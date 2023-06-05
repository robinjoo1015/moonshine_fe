use serde::{Deserialize, Serialize};
use serde_json::Result;
use std::error::Error as E;
use std::ptr::null;
use reqwest::{RequestBuilder, Url};

#[derive(Deserialize, Serialize, Debug)]
pub struct strIngredient1 {
    pub(crate) strIngredient1: String,
}

#[derive(Deserialize, Serialize, Debug)]
pub struct Ingredients {
    pub(crate) drinks: Vec<strIngredient1>,
}

pub fn parse_ingredients() -> Ingredients {
    reqwest::blocking::get("https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list")
        .expect("")
        .json::<Ingredients>()
        .expect("Failed to parse JSON")
}

#[derive(Deserialize, Serialize, Debug, Clone)]
pub struct Cocktails {
    pub(crate) drinks: Vec<CocktailParse>,
}

#[derive(Deserialize, Serialize, Debug, Clone)]
pub struct CocktailParse {
    pub(crate) idDrink: Option<String>,
    pub(crate) strDrink: Option<String>,
    pub(crate) strDrinkAlternate: Option<String>,
    pub(crate) strTags: Option<String>,
    pub(crate) strVideo: Option<String>,
    pub(crate) strCategory: Option<String>,
    pub(crate) strIBA: Option<String>,
    pub(crate) strAlcoholic: Option<String>,
    pub(crate) strGlass: Option<String>,
    pub(crate) strInstructions: Option<String>,
    pub(crate) strInstructionsES: Option<String>,
    pub(crate) strInstructionsDE: Option<String>,
    pub(crate) strInstructionsFR: Option<String>,
    pub(crate) strInstructionsIT: Option<String>,
    pub(crate) strInstructionsZH_HANS: Option<String>,
    pub(crate) strInstructionsZH_HANT: Option<String>,
    pub(crate) strDrinkThumb: String,
    pub(crate) strIngredient1: Option<String>,
    pub(crate) strIngredient2: Option<String>,
    pub(crate) strIngredient3: Option<String>,
    pub(crate) strIngredient4: Option<String>,
    pub(crate) strIngredient5: Option<String>,
    pub(crate) strIngredient6: Option<String>,
    pub(crate) strIngredient7: Option<String>,
    pub(crate) strIngredient8: Option<String>,
    pub(crate) strIngredient9: Option<String>,
    pub(crate) strIngredient10: Option<String>,
    pub(crate) strIngredient11: Option<String>,
    pub(crate) strIngredient12: Option<String>,
    pub(crate) strIngredient13: Option<String>,
    pub(crate) strIngredient14: Option<String>,
    pub(crate) strIngredient15: Option<String>,
    pub(crate) strMeasure1: Option<String>,
    pub(crate) strMeasure2: Option<String>,
    pub(crate) strMeasure3: Option<String>,
    pub(crate) strMeasure4: Option<String>,
    pub(crate) strMeasure5: Option<String>,
    pub(crate) strMeasure6: Option<String>,
    pub(crate) strMeasure7: Option<String>,
    pub(crate) strMeasure8: Option<String>,
    pub(crate) strMeasure9: Option<String>,
    pub(crate) strMeasure10: Option<String>,
    pub(crate) strMeasure11: Option<String>,
    pub(crate) strMeasure12: Option<String>,
    pub(crate) strMeasure13: Option<String>,
    pub(crate) strMeasure14: Option<String>,
    pub(crate) strMeasure15: Option<String>,
    pub(crate) strImageSource: Option<String>,
    pub(crate) strImageAttribution: Option<String>,
    pub(crate) strCreativeCommonsConfirmed: Option<String>,
    pub(crate) dateModified: Option<String>,
}

impl CocktailParse {
    pub fn get_ingredient(&self, i: i32) -> Option<String> {
        match i {
            1 => self.strIngredient1.clone(),
            2 => self.strIngredient2.clone(),
            3 => self.strIngredient3.clone(),
            4 => self.strIngredient4.clone(),
            5 => self.strIngredient5.clone(),
            6 => self.strIngredient6.clone(),
            7 => self.strIngredient7.clone(),
            8 => self.strIngredient8.clone(),
            9 => self.strIngredient9.clone(),
            10 => self.strIngredient10.clone(),
            11 => self.strIngredient11.clone(),
            12 => self.strIngredient12.clone(),
            13 => self.strIngredient13.clone(),
            14 => self.strIngredient14.clone(),
            15 => self.strIngredient15.clone(),
            _ => None,
        }
    }

    pub fn get_quantity(&self, i: i32) -> Option<String> {
        match i {
            1 => self.strMeasure1.clone(),
            2 => self.strMeasure2.clone(),
            3 => self.strMeasure3.clone(),
            4 => self.strMeasure4.clone(),
            5 => self.strMeasure5.clone(),
            6 => self.strMeasure6.clone(),
            7 => self.strMeasure7.clone(),
            8 => self.strMeasure8.clone(),
            9 => self.strMeasure9.clone(),
            10 => self.strMeasure10.clone(),
            11 => self.strMeasure11.clone(),
            12 => self.strMeasure12.clone(),
            13 => self.strMeasure13.clone(),
            14 => self.strMeasure14.clone(),
            15 => self.strMeasure15.clone(),
            _ => None,
        }
    }
}

pub fn parse_cocktails() -> Cocktails {
    let mut cocktail: Vec<Cocktails> = Vec::new();
    let base_url = Url::parse("https://www.thecocktaildb.com/api/json/v1/1/").unwrap();

    for c in 'a'..='z' {
        let site_url = base_url.join(&*("search.php?f=".to_owned() + c.to_string().as_str())).unwrap();
        println!("{}", site_url);
        cocktail.push(match reqwest::blocking::get(site_url)
            .expect("")
            .json::<Cocktails>() {
            Ok(c) => c.clone(),
            Err(_) => continue,
        }
        );
    }

    for c in '0'..='9' {
        let site_url = base_url.join(&*("search.php?f=".to_owned() + c.to_string().as_str())).unwrap();
        println!("{}", site_url);
        cocktail.push(match reqwest::blocking::get(site_url)
            .expect("")
            .json::<Cocktails>() {
            Ok(c) => c.clone(),
            Err(_) => continue,
        }
        );
    }

    let mut return_cocktails: Cocktails = Cocktails {
        drinks: Vec::new(),
    };

    for c in cocktail {
        return_cocktails.drinks.extend(c.drinks);
    }

    return_cocktails
}