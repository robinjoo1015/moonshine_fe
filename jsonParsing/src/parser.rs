use serde::{Deserialize, Serialize};
use serde_json::Result;
use std::error::Error as E;

#[derive(Deserialize, Serialize, Debug)]
pub struct strIngredient1 {
    pub(crate) strIngredient1: String,
}

#[derive(Deserialize, Serialize, Debug)]
pub struct Ingredients {
    pub(crate) drinks: Vec<strIngredient1>,
}

pub fn parse_ingredients() -> Ingredients {
    reqwest::blocking::get("https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list").expect("").json::<Ingredients>().expect("Failed to parse JSON")
}