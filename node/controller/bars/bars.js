// id, name, url

// 세부 정보
// id, name, images,
const pgConnection = require("../dbconn");
exports.getBarList = function (req, res) {
    _getBarList(req.params.user_id).then((response) => {
        res.send(response);
    }).catch((err) => {
        console.log(err);
    });
}

exports.getBarById = function (req, res) {
    _getBarById(req.params.user_id, req.params.id).then((response) => {
        res.send(response);
    }).catch((err) => {
        console.log(err);
    });
}

async function _getBarList(user_id) {
    var query = '' +
        'SELECT bar_id, bar_name, image_path FROM moonshine.bars ' +
        'INNER JOIN moonshine.image ' +
        '   ON bars.bar_image = image.image_id';

    var favorite_query = '' +
        'SELECT bar_id FROM moonshine.bar_favorites ' +
        'WHERE user_id = ' + user_id;
    let favorite_result = await pgConnection.query(favorite_query);
    let favorite_response = [];
    for (let row of favorite_result.rows) {
        favorite_response.push(row.bar_id);
    }

    let result = await pgConnection.query(query);
    let response = [];
    for (let row of result.rows) {
        let bar_id = row.bar_id;
        let is_favorite = false;
        if (favorite_response.includes(bar_id)) {
            is_favorite = true;
        }
        let component = {
            id: bar_id,
            name: row.bar_name,
            url: row.image_path,
            is_favorite: is_favorite,
        }
        response.push(component);
    }
    return response;
}

async function _getBarById(user_id, id) {
    var query = '' +
        'SELECT * FROM moonshine.bars ' +
        'WHERE bar_id = ' + id;
    let bar_result = await pgConnection.query(query);
    let bar = bar_result.rows[0];
    let bar_id = bar.bar_id;
    var bar_image_query = '' +
        'SELECT image_path FROM moonshine.image ' +
        'WHERE image_id = ' + String(bar.bar_image);
    let bar_image_result = await pgConnection.query(bar_image_query);
    let bar_image = bar_image_result.rows[0].image_path;

    console.log(bar_image);

    var images_query = '' +
        'SELECT image_path FROM moonshine.bar_image_composition ' +
        'INNER JOIN moonshine.image ' +
            'ON moonshine.bar_image_composition.image_id = moonshine.image.image_id ' +
        'WHERE moonshine.bar_image_composition.bar_id = ' + String(bar_id);
    let image_result = await pgConnection.query(images_query);
    var image_list = [];

    var menu_query = '' +
        'SELECT cocktails.cocktail_id, cocktails.cocktail_name, bar_cocktail_score, bar_cocktail_price ' +
        'FROM moonshine.bar_menu_composition ' +
            'INNER JOIN moonshine.cocktails ' +
                'ON bar_menu_composition.cocktail_id = cocktails.cocktail_id ' +
        'WHERE bar_id = ' + String(bar_id);
    let menu_result = await pgConnection.query(menu_query);
    var menu_list = [];

    var blog_query = '' +
        'SELECT blog_posts.blog_post_id, blog_post_title, image_path ' +
        'FROM moonshine.blog_posts_bar_cocktail_composition ' +
        'INNER JOIN moonshine.blog_posts ' +
            'ON blog_posts_bar_cocktail_composition.blog_post_id = blog_posts.blog_post_id ' +
        'INNER JOIN moonshine.image ' +
            'ON blog_posts.blog_post_image = image.image_id ' +
        'WHERE bar_id = ' + String(bar_id);
    let blog_result = await pgConnection.query(blog_query);
    var blog_list = [];

    var favorite_query = '' +
        'SELECT bar_id FROM moonshine.bar_favorites ' +
        'WHERE user_id = ' + user_id + ' AND bar_id = ' + String(bar_id);
    let favorite_result = await pgConnection.query(favorite_query);
    let is_favorite = false;
    if (favorite_result.rows.length > 0) {
        is_favorite = true;
    }


    for (let row of image_result.rows) {
        var component = {
            url: row.image_path,
        }
        image_list.push(component);
        console.log(component);
    }

    for (let row of menu_result.rows) {
        var component = {
            id: row.cocktail_id,
            name: row.cocktail_name,
            score: row.bar_cocktail_score,
            price: row.bar_cocktail_price,
        }
        menu_list.push(component);
        console.log(component);
    }

    for (let row of blog_result.rows) {
        var component = {
            id: row.blog_post_id,
            title: row.blog_post_title,
            url: row.image_path,
        }
        blog_list.push(component);
        console.log(component);
    }

    var response = {
        id: bar.bar_id,
        name: bar.bar_name,
        address: bar.bar_address,
        url: bar_image,
        latitude: bar.bar_latitude,
        longitude: bar.bar_longitude,
        contact: bar.bar_contact,
        description: bar.bar_description,
        opening_hours: bar.bar_opening_hours,
        score: bar.bar_score,
        images: image_list,
        menu: menu_list,
        blog: blog_list,
        is_favorite: is_favorite,
    }
    return response;
}
