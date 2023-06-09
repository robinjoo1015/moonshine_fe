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

exports.createBlog = function (req, res) {
    switch (req.params.blogType) {
        case '1':
            _createBarBlog(req.body).then((response) => {
                res.send(response);
            }).catch((err) => {
                console.log(err);
            });
            break;
        case '2':
            _createCocktailBlog(req.body).then((response) => {
                res.send(response);
            }).catch((err) => {
                console.log(err);
            });
            break;
        case '3':
            _createCustomCocktailBlog(req.body).then((response) => {
                res.send(response);
            }).catch((err) => {
                console.log(err);
            });
            break;
        case '4':
            _createSmallBlog(req.body).then((response) => {
                res.send(response);
            }).catch((err) => {
                console.log(err);
            });
            break;
    }

    return {
        status: 200,
    };
}

exports.createComment = function (req, res) {
    _createSmallBlogComment(req.params.blogId, req.body).then((response) => {
        res.send(response);
    }).catch((err) => {
        console.log(err);
    });
}

async function _getBlogList(blogType) {
    if (blogType === '4') return _getSmallBlogList();
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

async function _getSmallBlogList() {
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
        'SELECT image_path FROM moonshine.blog_post_image_composition ' +
        'INNER JOIN moonshine.image ' +
        '   ON blog_post_image_composition.image_id = image.image_id ' +
        'WHERE blog_post_id = ' + blogId;
    let image_result = await pgConnection.query(image_query);
    let images = [];
    images.push({
        url: result.image_path,
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
        'SELECT image_path FROM moonshine.blog_post_image_composition ' +
        'INNER JOIN moonshine.image ' +
        '   ON blog_post_image_composition.image_id = image.image_id ' +
        'WHERE blog_post_id = ' + blogId;
    let image_result = await pgConnection.query(image_query);
    let images = [];
    images.push({
        url: result.image_path,
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

async function _getBlogByIdTypeCustomBlog(blogId) {
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
        'SELECT image_path FROM moonshine.blog_post_image_composition ' +
        'INNER JOIN moonshine.image ' +
        '   ON blog_post_image_composition.image_id = image.image_id ' +
        'WHERE blog_post_id = ' + blogId;
    let image_result = await pgConnection.query(image_query);
    let images = [];
    images.push({
        url: result.image_path,
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

async function _getSmallBlogById(blogId) {
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
        comment_count: comments.length,
    };
}

async function _createBarBlog(body) {
    console.log(body);
    const title = body.title;
    const content = body.content;
    const userId = body.userId;
    const thumbnail = body.thumbnail;
    const imageList = JSON.parse(body.images);
    const selectionData = JSON.parse(body.selectionData);
    const bar_id = selectionData.mainSelection;
    const ratingList = JSON.parse(selectionData.ratingList);

    let blog_insert_query = '' +
        'INSERT INTO moonshine.blog_posts (blog_post_title, blog_post_content, blog_post_user_id, blog_post_image, blog_post_type) ' +
        'VALUES ($1, $2, $3, $4, $5) RETURNING blog_post_id';

    let blog_insert_result = await pgConnection.query(blog_insert_query, [title, content, userId, thumbnail, 1]);
    let blogId = blog_insert_result.rows[0].blog_post_id;

    let blog_bar_cocktail_insert_query = '' +
        'INSERT INTO moonshine.blog_posts_bar_cocktail_composition (blog_post_id, bar_id, cocktail_id, bar_cocktail_score) ' +
        'VALUES (' + blogId + ', ' + bar_id + ', ' + '$1, $2)';

    let blog_image_insert_query = '' +
        'INSERT INTO moonshine.blog_post_image_composition (blog_post_id, image_id) ' +
        'VALUES (' + blogId + ', $1)';

    let bar_image_insert_query = '' +
        'INSERT INTO moonshine.bar_image_composition (bar_id, image_id) ' +
        'VALUES (' + bar_id + ', $1)';

    for (let row of ratingList) {
        await pgConnection.query(blog_bar_cocktail_insert_query, [row.id, row.rating]);
    }

    for (let id of imageList) {
        await pgConnection.query(blog_image_insert_query, [id]);
        await pgConnection.query(bar_image_insert_query, [id]);
    }

    return {
        status: 200,
        blogId: blogId,
    };
}

async function _createCocktailBlog(body) {
    console.log(body);
    const title = body.title;
    const content = body.content;
    const userId = body.userId;
    const thumbnail = body.thumbnail;
    const imageList = JSON.parse(body.images);
    const selectionData = JSON.parse(body.selectionData);
    const cocktail_id = selectionData.mainSelection;
    const ratingList = JSON.parse(selectionData.ratingList);
    console.log(ratingList);

    let blog_insert_query = '' +
        'INSERT INTO moonshine.blog_posts (blog_post_title, blog_post_content, blog_post_user_id, blog_post_image, blog_post_type) ' +
        'VALUES ($1, $2, $3, $4, $5) RETURNING blog_post_id';

    let blog_insert_result = await pgConnection.query(blog_insert_query, [title, content, userId, thumbnail, 2]);
    let blogId = blog_insert_result.rows[0].blog_post_id;

    let blog_bar_cocktail_insert_query = '' +
        'INSERT INTO moonshine.blog_posts_bar_cocktail_composition (blog_post_id, bar_id, cocktail_id, bar_cocktail_score) ' +
        'VALUES (' + blogId + ', $1, ' + cocktail_id + ', $2)';

    let blog_image_insert_query = '' +
        'INSERT INTO moonshine.blog_post_image_composition (blog_post_id, image_id) ' +
        'VALUES (' + blogId + ', $1)';

    let cocktail_image_insert_query = '' +
        'INSERT INTO moonshine.cocktail_image_composition (cocktail_id, image_id) ' +
        'VALUES (' + cocktail_id + ', $1)';

    for (let row of ratingList) {
        await pgConnection.query(blog_bar_cocktail_insert_query, [row.id, row.rating]);
    }

    for (let id of imageList) {
        await pgConnection.query(blog_image_insert_query, [id]);
        await pgConnection.query(cocktail_image_insert_query, [id]);
    }

    return {
        status: 200,
        blogId: blogId,
    };
}

async function _createCustomCocktailBlog(body) {
    const title = body.title;
    const content = body.content;
    const userId = body.userId;
    const thumbnail = body.thumbnail;
    const imageList = JSON.parse(body.images);
    const selectionData = JSON.parse(body.selectionData);
    const cocktail_id = selectionData.mainSelection;

    let blog_insert_query = '' +
        'INSERT INTO moonshine.blog_posts (blog_post_title, blog_post_content, blog_post_user_id, blog_post_image, blog_post_type) ' +
        'VALUES ($1, $2, $3, $4, $5) RETURNING blog_post_id';

    let blog_insert_result = await pgConnection.query(blog_insert_query, [title, content, userId, thumbnail, 3]);
    let blogId = blog_insert_result.rows[0].blog_post_id;

    let blog_bar_cocktail_insert_query = '' +
        'INSERT INTO moonshine.blog_posts_bar_cocktail_composition (blog_post_id, bar_id) ' +
        'VALUES (' + blogId + ', ' + cocktail_id + ')';

    let blog_image_insert_query = '' +
        'INSERT INTO moonshine.blog_post_image_composition (blog_post_id, image_id) ' +
        'VALUES (' + blogId + ', $1)';

    let cocktail_image_insert_query = '' +
        'INSERT INTO moonshine.cocktail_image_composition (cocktail_id, image_id) ' +
        'VALUES (' + cocktail_id + ', $1)';

    await pgConnection.query(blog_bar_cocktail_insert_query);

    for (let id of imageList) {
        await pgConnection.query(blog_image_insert_query, [id]);
        await pgConnection.query(cocktail_image_insert_query, [id]);
    }

    return {
        status: 200,
        blogId: blogId,
    }
}

async function _createSmallBlog(body) {
    const content = body.content;
    const userId = body.user_id;

    let blog_insert_query = '' +
        'INSERT INTO moonshine.blog_small_post (blog_small_post_content, blog_small_post_user_id) ' +
        'VALUES ($1, $2) RETURNING blog_small_post_id';

    let blog_insert_result = await pgConnection.query(blog_insert_query, [content, userId]);
    let blogId = blog_insert_result.rows[0].blog_small_post_id;

    return {
        status: 200,
        blogId: blogId,
    };
}

async function _createSmallBlogComment(blogId, body) {
    console.log(body);
    const content = body.content;
    const userId = body.id;

    let blog_insert_query = '' +
        'INSERT INTO moonshine.blog_small_post_comment (blog_small_post_id, user_id, blog_small_post_comment_content) ' +
        'VALUES ' + '(' + blogId + ', ' + userId + ', $1)';

    await pgConnection.query(blog_insert_query, [content]);

    return {
        status: 200,
    };
}