const pgConnection = require("../dbconn");

exports.getBlogList = function (req, res) {
    _getBlogList(req.params.blogType).then((response) => {
        res.send(response);
    }).catch((err) => {
        console.log(err);
    });
}

exports.getBlogById = function (req, res) {
    switch (req.params.blogType) {
        case '1':
            _getBlogByIdTypeBarBlog(req.params.blogId).then((response) => {
                res.send(response);
            }).catch((err) => {
                console.log(err);
            });
            break;

        case '2':
            _getBlogByIdTypeCocktailBlog(req.params.blogId).then((response) => {
                res.send(response);
            }).catch((err) => {
                console.log(err);
            });
            break;

        case '3':
            _getBlogByIdTypeCustomBlog(req.params.blogId).then((response) => {
                res.send(response);
            }).catch((err) => {
                console.log(err);
            });
            break;

        case '4':
            _getSmallBlogById(req.params.blogId).then((response) => {
                res.send(response);
            }).catch((err) => {
                console.log(err);
            });
    }
}

async function _getBlogList(blogType) {
    if(blogType === '4') return _getSmallBlogList();
    var query = '' +
        'SELECT blog_post_id, blog_post_title, image_path FROM moonshine.blog_posts ' +
        'INNER JOIN moonshine.image ' +
        '   ON blog_posts.blog_post_image = image.image_id ' +
        'WHERE blog_post_type = ' + blogType;

    let result = await pgConnection.query(query);
    let response = [];

    for (let row of result.rows) {
        let component = {
            id: row.blog_post_id,
            title: row.blog_post_title,
            url: row.image_path,
        }
        response.push(component);
    }

    return response;
}

async function _getSmallBlogList(){
    var query = '' +
        'SELECT blog_small_post_id, blog_small_post_content FROM moonshine.blog_small_post '
    let result = await pgConnection.query(query);
    let response = [];

    for (let row of result.rows) {
        let component = {
            id: row.blog_small_post_id,
            content: row.blog_small_post_content,
        }
        response.push(component);
    }

    return response;
}

async function _getBlogByIdTypeBarBlog(blogId) {
    let query = '' +
        'SELECT blog_post_title, blog_post_content, user_name, image_path, blog_post_updated_at FROM moonshine.blog_posts ' +
        'INNER JOIN moonshine.image ' +
        '   ON blog_posts.blog_post_image = image.image_id ' +
        'INNER JOIN moonshine.users ' +
        '   ON blog_posts.blog_post_user_id = users.user_id ' +
        'WHERE blog_post_id = ' + blogId;

    let result = await pgConnection.query(query);
    result = result.rows[0];

    let image_query = '' +
        'SELECT image_path, blog_post_image_comment FROM moonshine.blog_post_image_composition ' +
        'INNER JOIN moonshine.image ' +
        '   ON blog_post_image_composition.image_id = image.image_id ' +
        'WHERE blog_post_id = ' + blogId;
    let image_result = await pgConnection.query(image_query);
    let images = [];
    images.push({
        url: result.image_path,
        comment: "thumbnail"
    });

    let cocktails_query = '' +
        'SELECT bar_id, blog_posts_bar_cocktail_composition.cocktail_id, bar_cocktail_score, cocktail_name, image_path ' +
        'FROM moonshine.blog_posts_bar_cocktail_composition ' +
        'LEFT JOIN moonshine.cocktails ON moonshine.blog_posts_bar_cocktail_composition.cocktail_id = moonshine.cocktails.cocktail_id ' +
        'LEFT JOIN moonshine.image ON moonshine.cocktails.cocktail_image = moonshine.image.image_id ' +
        'WHERE moonshine.blog_posts_bar_cocktail_composition.blog_post_id = ' + blogId;
    let cocktails_result = await pgConnection.query(cocktails_query);
    let cocktails = [];

    for (let row of image_result.rows) {
        var component = {
            url: row.image_path,
            comment: row.blog_post_image_comment,
        };
        images.push(component);
    }

    let bar_id = cocktails_result.rows[0].bar_id;

    for (let row of cocktails_result.rows) {
        var component = {
            id: row.cocktail_id,
            name: row.cocktail_name,
            url: row.image_path,
            score: row.bar_cocktail_score,
        };
        cocktails.push(component);
    }
    return {
        title: result.blog_post_title,
        content: result.blog_post_content,
        bar_id: bar_id,
        author: result.user_name,
        thumbnail: result.image_path,
        timestamp: result.blog_post_updated_at,
        images: images,
        cocktails: cocktails,
    };
}

async function _getBlogByIdTypeCocktailBlog(blogId) {
    let query = '' +
        'SELECT blog_post_title, blog_post_content, user_name, image_path, blog_post_updated_at FROM moonshine.blog_posts ' +
        'INNER JOIN moonshine.image ' +
        '   ON blog_posts.blog_post_image = image.image_id ' +
        'INNER JOIN moonshine.users ' +
        '   ON blog_posts.blog_post_user_id = users.user_id ' +
        'WHERE blog_post_id = ' + blogId;

    let result = await pgConnection.query(query);
    result = result.rows[0];

    let image_query = '' +
        'SELECT image_path, blog_post_image_comment FROM moonshine.blog_post_image_composition ' +
        'INNER JOIN moonshine.image ' +
        '   ON blog_post_image_composition.image_id = image.image_id ' +
        'WHERE blog_post_id = ' + blogId;
    let image_result = await pgConnection.query(image_query);
    let images = [];
    images.push({
        url: result.image_path,
        comment: "thumbnail"
    });

    let bar_query = '' +
        'SELECT cocktail_id, moonshine.blog_posts_bar_cocktail_composition.bar_id, bar_name, bar_cocktail_score, image_path ' +
        'FROM moonshine.blog_posts_bar_cocktail_composition ' +
        'LEFT JOIN moonshine.bars ON moonshine.blog_posts_bar_cocktail_composition.bar_id = moonshine.bars.bar_id ' +
        'LEFT JOIN moonshine.image ON moonshine.bars.bar_image = moonshine.image.image_id ' +
        'WHERE moonshine.blog_posts_bar_cocktail_composition.blog_post_id = ' + blogId;
    let bar_result = await pgConnection.query(bar_query);
    let bars = [];

    for (let row of image_result.rows) {
        var component = {
            url: row.image_path,
            comment: row.blog_post_image_comment,
        };
        images.push(component);
    }

    let cocktail_id = bar_result.rows[0].cocktail_id;

    for (let row of bar_result.rows) {
        var component = {
            id: row.bar_id,
            name: row.bar_name,
            url: row.image_path,
            score: row.bar_cocktail_score,
        };
        bars.push(component);

    }

    return {
        title: result.blog_post_title,
        content: result.blog_post_content,
        cocktail_id: cocktail_id,
        author: result.user_name,
        thumbnail: result.image_path,
        timestamp: result.blog_post_updated_at,
        images: images,
        bars: bars,
    }
}

async function _getBlogByIdTypeCustomBlog(blogId){
    let query = '' +
        'SELECT blog_post_title, blog_post_content, user_name, image_path, blog_post_updated_at FROM moonshine.blog_posts ' +
        'INNER JOIN moonshine.image ' +
        '   ON blog_posts.blog_post_image = image.image_id ' +
        'INNER JOIN moonshine.users ' +
        '   ON blog_posts.blog_post_user_id = users.user_id ' +
        'WHERE blog_post_id = ' + blogId;

    let result = await pgConnection.query(query);
    result = result.rows[0];

    let image_query = '' +
        'SELECT image_path, blog_post_image_comment FROM moonshine.blog_post_image_composition ' +
        'INNER JOIN moonshine.image ' +
        '   ON blog_post_image_composition.image_id = image.image_id ' +
        'WHERE blog_post_id = ' + blogId;
    let image_result = await pgConnection.query(image_query);
    let images = [];
    images.push({
        url: result.image_path,
        comment: "thumbnail"
    });

    let cocktail_query = '' +
        'SELECT moonshine.blog_posts_bar_cocktail_composition.cocktail_id, cocktail_name, image_path ' +
        'FROM moonshine.blog_posts_bar_cocktail_composition ' +
        'LEFT JOIN moonshine.cocktails ON moonshine.blog_posts_bar_cocktail_composition.cocktail_id = moonshine.cocktails.cocktail_id ' +
        'LEFT JOIN moonshine.image ON moonshine.cocktails.cocktail_image = moonshine.image.image_id ' +
        'WHERE moonshine.blog_posts_bar_cocktail_composition.blog_post_id = ' + blogId;
    let cocktail_result = await pgConnection.query(cocktail_query);

    for (let row of image_result.rows) {
        var component = {
            url: row.image_path,
            comment: row.blog_post_image_comment,
        };
        images.push(component);
    }

    return {
        title: result.blog_post_title,
        content: result.blog_post_content,
        cocktail_id: cocktail_result.rows[0].cocktail_id,
        cocktail_name: cocktail_result.rows[0].cocktail_name,
        cocktail_image: cocktail_result.rows[0].image_path,
        author: result.user_name,
        thumbnail: result.image_path,
        timestamp: result.blog_post_updated_at,
        images: images,
    };
}

async function _getSmallBlogById(blogId){
    let query = '' +
        'SELECT blog_small_post_content, user_name, blog_small_post_updated_at FROM moonshine.blog_small_post ' +
        'INNER JOIN moonshine.users ON blog_small_post_user_id = user_id ' +
        'WHERE blog_small_post_id = ' + blogId;
    let result = await pgConnection.query(query);
    result = result.rows[0];

    let comment_query = '' +
        'SELECT user_name, blog_small_post_comment_content, blog_small_post_comment_updated_at ' +
        'FROM moonshine.blog_small_post_comment ' +
        'INNER JOIN moonshine.users ' +
        'ON moonshine.blog_small_post_comment.user_id = moonshine.users.user_id ' +
        'WHERE blog_small_post_id = ' + blogId;

    let comment_result = await pgConnection.query(comment_query);
    let comments = [];

    for (let row of comment_result.rows) {
        const component = {
            author: row.user_name,
            content: row.blog_small_post_comment_content,
            timestamp: row.blog_small_post_comment_updated_at,
        }
        comments.push(component);
    }

    return {
        content: result.blog_small_post_content,
        author: result.user_name,
        timestamp: result.blog_small_post_updated_at,
        comments: comments,
    };
}