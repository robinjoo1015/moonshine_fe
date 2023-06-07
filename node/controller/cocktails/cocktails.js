const request = require('request');

const pgConnection = require('../dbconn');

exports.getCocktailList = function (req, res) {
    getCocktailList().then((response) => {
        res.send(response);
    }).catch((err) => {
        console.log(err);
    });
};

async function getCocktailList() {
    var query = '' +
        'SELECT cocktail_id, cocktail_name, image_path FROM cocktails ' +
        'INNER JOIN image ' +
        '   ON cocktails.cocktail_image = image.image_id';
    let result = await pgConnection.query(query);
    let response = [];
    for (let row of result.rows) {
        let component = {
            id: row.cocktail_id,
            name: row.cocktail_name,
            url: row.image_path,
        }
        response.push(component);
    }
    return response;
}

exports.getCocktailByID = function (req, res) {
    getCocktail(req.params.id).then((response) => {
        console.log(response);
        res.send(response);
    }).catch((err) => {
        console.log(err);
    });
};

async function getCocktail(id) {
    var query = '' +
        'SELECT * FROM moonshine.cocktails ' +
        'WHERE cocktail_id = ' + id;
    let cocktail_result = await pgConnection.query(query);
    let cocktail = cocktail_result.rows[0];
    let cocktail_id = cocktail.cocktail_id;
    var images_query = '' +
        'SELECT image_id FROM moonshine.cocktail_image_composition ' +
        'WHERE cocktail_id = ' + String(cocktail_id);
    let image_result = await pgConnection.query(images_query);
    var image_list = [];

    var ingredients_query = '' +
        'SELECT ingredient_name, ingredient_quantity ' +
        'FROM moonshine.ingredient, moonshine.cocktail_composition ' +
        'WHERE ingredient.ingredient_id = cocktail_composition.ingredient_id ' +
        '   AND cocktail_composition.cocktail_id = ' + String(cocktail_id);
    let ingredient_result = await pgConnection.query(ingredients_query);
    let ingredient_list = [];
    let response = [];

    for (let row of image_result.rows) {
        let component = {
            url: row.image_path,
        }
        image_list.push(component);
    }

    for (let row of ingredient_result.rows) {
        let component = {
            name: row.ingredient_name,
            quantity: row.ingredient_quantity,
        }
        ingredient_list.push(component);
    }
    let response_component = {
        name: cocktail.cocktail_name,
        images: image_list,
        ingredients: ingredient_list,
        recipe: cocktail.cocktail_instructions,
    }
    console.log(response_component);
    return response_component;
}