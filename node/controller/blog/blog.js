const pgConnection = require("../dbconn");
exports.getBlogList = function (req, res) {
    _getBlogList(req.params.blogType).then((response) => {
        res.send(response);
    }).catch((err) => {
        console.log(err);
    });
}

async function _getBlogList(blogType) {
    if(blogType === 4) return _getSmallBlogList();
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
        'SELECT blog_small_post_id, blog_small_post_title, blog_small_post_constent FROM moonshine.blog_small_posts '
    let result = await pgConnection.query(query);
    let response = [];

    for (let row of result.rows) {
        let component = {
            id: row.blog_small_post_id,
            title: row.blog_small_post_title,
            content: row.blog_small_post_content,
        }
        response.push(component);
    }

    return response;
}
