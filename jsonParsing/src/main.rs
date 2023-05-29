use postgres::{Client, NoTls, Error};

pub mod parser;
mod dbcheck;

fn main() {
    // let ingredients = parser::parse_ingredients();
    // let mut client = Client::connect("host=localhost user=whbaek password=moonshine dbname=moonshine port=5432", NoTls).expect("Failed to connect to database");
    // for ingredient in ingredients.drinks {
    //     let ingredient = ingredient.strIngredient1;
    //     let query = format!("INSERT INTO moonshine.ingredient (ingredient_name) VALUES ('{}')", ingredient);
    //     client.execute(&query, &[]).unwrap();
    // }
    dbcheck::check_magaritta();
}
