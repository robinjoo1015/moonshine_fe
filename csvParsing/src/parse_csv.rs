use std::collections::HashMap;
use csv;
use postgres::{Client, NoTls, Error};
use postgres::error::DbError;

fn main() {
    // read csv file
    let mut rdr = csv::Reader::from_path("./src/taste_crawling.csv").unwrap();
    // println!("{:?}", rdr);
    let mut client = Client::connect( "host=localhost user=whbaek password=moonshine dbname=moonshine port=5432", NoTls)
        .expect("Failed to connect to database");

    let taste_query = "INSERT INTO moonshine.tastes (taste_id, gentle, boozy, sweet, dry, alcohol) VALUES ($1, $2, $3, $4, $5, $6)";
    let select_cocktail_query = "SELECT cocktail_id FROM moonshine.cocktails WHERE cocktail_name = $1";
    let cocktail_taste_query = "INSERT INTO moonshine.cocktail_taste_composition (cocktail_id, taste_id) VALUES ($1, $2)";
    let mut i = 1;
    for result in rdr.deserialize(){
        let record: HashMap<String, String> = result.unwrap();
        println!("{:?}", record);
        client.execute(
            taste_query,
            &[
                &i,
                &record["gentle"].parse::<f64>().unwrap(),
                &record["boozy"].parse::<f64>().unwrap(),
                &record["sweet"].parse::<f64>().unwrap(),
                &record["dry"].parse::<f64>().unwrap(),
                &record["alcohol"].parse::<f64>().unwrap(),
                ]
        ).unwrap();

        let query_result = client.query(
            select_cocktail_query,
            &[&record["name"]],
        ).unwrap();
        if query_result.len() == 0 {
            println!("cocktail_name: {} is not in the database", record["name"]);
            continue;
        }
        let cocktail_id : i32 = query_result[0].get(0);
        println!("cocktail_id: {}", cocktail_id);
        client.execute(
            cocktail_taste_query,
            &[&cocktail_id, &i],
        ).unwrap();
        i += 1;
    }
}
