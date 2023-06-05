use postgres::{Client, NoTls, Error};
use postgres::error::DbError;
use serde_json::Value::String;

pub mod parser;
mod dbcheck;

fn main() {
    let mut client = Client::connect( "host=localhost user=whbaek password=moonshine dbname=moonshine port=5432", NoTls)
        .expect("Failed to connect to database");
    let ingredients = parser::parse_ingredients();
    let cocktails = parser::parse_cocktails();
    for ingredient in ingredients.drinks {
        let ingredient = ingredient.strIngredient1;
        let query = format!("INSERT INTO moonshine.ingredient (ingredient_name) VALUES ('{}')", ingredient);

        match client.execute(&query, &[]){
            Ok(_) => {}
            Err(_) => {continue;}
        }
    }

    for cocktailParse in &cocktails.drinks {
        // put image url in database
        let cocktail_image = &cocktailParse.strDrinkThumb;
        let query = format!("INSERT INTO moonshine.image (image_path) VALUES ('{}')",  cocktail_image);
        client.execute(&query, &[]).unwrap();
        let image_id = client.query("SELECT image_id FROM moonshine.image WHERE image_path = $1", &[&cocktail_image]).unwrap();
        let cocktail_name = match &cocktailParse.strDrink {
            Some(cocktail_name) => cocktail_name,
            None => continue,
        };
        let empty = &"".to_string();
        let cocktail_description = match &cocktailParse.strTags {
            Some(cocktail_description) => cocktail_description,
            None => empty,
        };
        let cocktail_instruction = match &cocktailParse.strInstructions {
            Some(cocktail_instruction) => cocktail_instruction,
            None => continue,
        };

        let query = format!("INSERT INTO moonshine.cocktails (cocktail_name, cocktail_description, cocktail_instructions, cocktail_image) VALUES ('{}', '{}', '{}', {})", cocktail_name, cocktail_description, cocktail_instruction, image_id[0].get::<_, i32>(0));
        let result = match client.execute(&query, &[]){
            Ok(_) => {}
            Err(_) => {continue}
        };
        let query = format!("SELECT cocktail_id FROM moonshine.cocktails WHERE cocktail_name = '{}'", cocktail_name);
        let cocktail_id = client.query(&query, &[]).unwrap()[0].get::<_, i32>(0);
        for i in 1..16{
            let ingredient = match cocktailParse.get_ingredient(i) {
                Some(ingredient) => ingredient,
                None => continue,
            };
            let quantity = match cocktailParse.get_quantity(i) {
                Some(quantity) => quantity,
                None => continue,
            };
            let mut query = format!("SELECT ingredient_id FROM moonshine.ingredient WHERE ingredient_name = '{}'", &ingredient);
            let result = client.query(&query, &[]).unwrap();
            if result.len() == 0 {
                let ingredient_query = format!("INSERT INTO moonshine.ingredient (ingredient_name) VALUES ('{}')", &ingredient);
                client.execute(&ingredient_query, &[]).unwrap();
                query = format!("SELECT ingredient_id FROM moonshine.ingredient WHERE ingredient_name = '{}'", &ingredient);
            }
            let result = client.query(&query, &[]).unwrap();
            println!("{:?}", result);
            let ingredient_id = result[0].get::<_, i32>(0);
            println!("{:?} {:?} {:?}", cocktail_id, ingredient_id, quantity);
            let query = format!("INSERT INTO moonshine.cocktail_composition (cocktail_id, ingredient_id, ingredient_quantity) VALUES ({}, {}, '{}')", cocktail_id, &ingredient_id, &quantity);
            client.execute(&query, &[]).unwrap();
        }
    }
}

