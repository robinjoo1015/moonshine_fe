use postgres::{Client, NoTls, Error};

pub(crate) fn check_magaritta() {
    let mut client = Client::connect("host=localhost user=whbaek password=moonshine dbname=moonshine port=5432", NoTls).expect("Failed to connect to database");
    let ingredient  = vec!["Tequila", "Triple sec", "Lime juice"];
    let quntity = vec!["'2 oz'", "'1/2 oz'", "'1 oz'"];
    let mut query = String::from("SELECT ingredient_id FROM moonshine.ingredient WHERE ingredient_name IN (");
    for i in 0..ingredient.len() {
        query.push_str(&format!("'{}'", ingredient[i]));
        if i != ingredient.len() - 1 {
            query.push_str(", ");
        }
    }

    query.push_str(")");

    let result = client.query(&query, &[]).unwrap();
    let mut ingredient_id = Vec::new();
    for row in result {
        ingredient_id.push(row.get::<_, i32>(0));
    }

    let mut query = String::from("SELECT cocktail_id FROM moonshine.cocktails WHERE cocktail_name = 'Margarita'");

    let result = client.query(&query, &[]).unwrap();
    let mut cocktail_id = 0;

    for row in result {
        cocktail_id = row.get::<_, i32>(0);
    }
    println!("{:?}", ingredient_id);
    println!("{:?}", cocktail_id);

    for i in 0..ingredient_id.len() {
        let query = format!("INSERT INTO moonshine.cocktail_composition (cocktail_id, ingredient_id, ingredient_quantity) VALUES ({}, {}, {})", cocktail_id, ingredient_id[i], quntity[i]);
        client.execute(&query, &[]).unwrap();
    }
}
