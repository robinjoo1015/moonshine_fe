const request = require('request');

const pgConnection = require('../dbconn');

exports.getCocktailList = function (req, res) {
    _getCocktailList(req.params.user_id).then((response) => {
        res.send(response);
    }).catch((err) => {
        console.log(err);
    });
};

exports.getCocktailByID = function (req, res) {
    _getCocktail(req.params.user_id, req.params.id).then((response) => {
        res.send(response);
    }).catch((err) => {
        console.log(err);
    });
};

exports.updateFavorite = function (req, res) {
    _updateFavorite(req.params.user_id, req.params.id).then((response) => {
        res.send(response);
    }).catch((err) => {
        console.log(err);
    });
}


async function _getCocktailList(user_id) {
    var query = '' +
        'SELECT cocktail_id, cocktail_name, image_path FROM cocktails ' +
        'INNER JOIN image ' +
        '   ON cocktails.cocktail_image = image.image_id';
    let result = await pgConnection.query(query);
    let response = [];
    var taste_query = '' +
        'SELECT gentle, boozy, sweet, dry, alcohol FROM moonshine.cocktail_taste_composition ' +
        'INNER JOIN tastes ' +
        'ON cocktail_taste_composition.taste_id = tastes.taste_id ' +
        'WHERE cocktail_id = $1';
    var favorite_query = '' +
        'SELECT cocktail_id FROM moonshine.cocktail_favorites ' +
        'WHERE user_id = ' + user_id;
    let favorite_result = await pgConnection.query(favorite_query);
    let favorite_response = [];
    for (let row of favorite_result.rows) {
        favorite_response.push(row.cocktail_id);
    }

    for (let row of result.rows) {
        let cocktail_id = row.cocktail_id;
        let is_favorite = false;
        if (favorite_response.includes(cocktail_id)) {
            is_favorite = true;
        }
        let taste_result = await pgConnection.query(taste_query, [cocktail_id]);
        let taste_response = taste_result.rows[0];
        let taste = {
            gentle: taste_response.gentle,
            boozy: taste_response.boozy,
            sweet: taste_response.sweet,
            dry: taste_response.dry,
            alcohol: taste_response.alcohol,
        }
        let component = {
            id: row.cocktail_id,
            name: row.cocktail_name,
            url: row.image_path,
            taste: taste,
            is_favorite: is_favorite,
        }
        response.push(component);
    }
    return response;
}

async function _getCocktail(user_id, id) {
    const query = '' +
        'SELECT * FROM moonshine.cocktails ' +
        'WHERE cocktail_id = ' + id;
    let cocktail_result = await pgConnection.query(query);
    let cocktail = cocktail_result.rows[0];
    let cocktail_id = cocktail.cocktail_id;
    const images_query = '' +
        'SELECT image_id FROM moonshine.cocktail_image_composition ' +
        'WHERE cocktail_id = ' + String(cocktail_id);
    let image_result = await pgConnection.query(images_query);
    const image_list = [];

    const ingredients_query = '' +
        'SELECT ingredient_name, ingredient_quantity ' +
        'FROM moonshine.ingredient, moonshine.cocktail_composition ' +
        'WHERE ingredient.ingredient_id = cocktail_composition.ingredient_id ' +
        '   AND cocktail_composition.cocktail_id = ' + String(cocktail_id);
    let ingredient_result = await pgConnection.query(ingredients_query);
    let ingredient_list = [];

    const taste_query = '' +
        'SELECT gentle, boozy, sweet, dry, alcohol FROM moonshine.cocktail_taste_composition ' +
        'INNER JOIN tastes ' +
        'ON cocktail_taste_composition.taste_id = tastes.taste_id ' +
        'WHERE cocktail_id = ' + String(cocktail_id);
    let taste_result = await pgConnection.query(taste_query);
    let taste_response = taste_result.rows[0];
    let taste = {
        gentle: taste_response.gentle,
        boozy: taste_response.boozy,
        sweet: taste_response.sweet,
        dry: taste_response.dry,
        alcohol: taste_response.alcohol,
    }

    const favorite_query = '' +
        'SELECT cocktail_id FROM moonshine.cocktail_favorites ' +
        'WHERE user_id = ' + user_id + ' AND cocktail_id = ' + String(cocktail_id);
    let favorite_result = await pgConnection.query(favorite_query);
    let is_favorite = false;
    if (favorite_result.rows.length > 0) {
        is_favorite = true;
    }

    const bar_query = '' +
        'SELECT bars.bar_id, bar_name, image_path FROM moonshine.bar_menu_composition ' +
        'INNER JOIN moonshine.bars ' +
        '    ON bar_menu_composition.bar_id = bars.bar_id ' +
        'INNER JOIN moonshine.image ' +
        '    ON bars.bar_image = image.image_id ' +
        'WHERE bar_menu_composition.cocktail_id = ' + String(cocktail_id);
    let bar_result = await pgConnection.query(bar_query);
    let bar_list = [];

    const blog_query = '' +
        'SELECT blog_posts.blog_post_id, blog_post_title, image_path, blog_post_type ' +
        'FROM moonshine.blog_posts_bar_cocktail_composition ' +
        'INNER JOIN moonshine.blog_posts ' +
        'ON blog_posts_bar_cocktail_composition.blog_post_id = blog_posts.blog_post_id ' +
        'INNER JOIN moonshine.image ' +
        'ON blog_posts.blog_post_image = image.image_id ' +
        'WHERE cocktail_id = ' + String(cocktail_id);
    let blog_result = await pgConnection.query(blog_query);
    var blog_list = [];


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

    for (let row of bar_result.rows) {
        let component = {
            id: row.bar_id,
            name: row.bar_name,
            url: row.image_path,
        }
        bar_list.push(component);
    }

    for (let row of blog_result.rows) {
        let component = {
            id: row.blog_post_id,
            name: row.blog_post_title,
            url: row.image_path,
            type: row.blog_post_type,
        }
        blog_list.push(component);
    }

    return {
        name: cocktail.cocktail_name,
        images: image_list,
        ingredients: ingredient_list,
        tastes: taste,
        recipe: cocktail.cocktail_instructions,
        bars: bar_list,
        blogs: blog_list,
        is_favorite: is_favorite,
    };
}

async function _updateFavorite(userId, id){
    let select_query = '' +
        'SELECT * FROM moonshine.cocktail_favorites ' +
        'WHERE user_id = ' + userId + ' AND cocktail_id = ' + id;
    let select_result = await pgConnection.query(select_query);
    if (select_result.rows.length > 0) {
        let delete_query = '' +
            'DELETE FROM moonshine.cocktail_favorites ' +
            'WHERE user_id = ' + userId + ' AND cocktail_id = ' + id;
        let delete_result = await pgConnection.query(delete_query);
        return {
            is_favorite: false,
        }
    } else {
        let insert_query = '' +
            'INSERT INTO moonshine.cocktail_favorites (user_id, cocktail_id) ' +
            'VALUES (' + userId + ', ' + id + ')';
        let insert_result = await pgConnection.query(insert_query);
        return {
            is_favorite: true,
        }
    }
}