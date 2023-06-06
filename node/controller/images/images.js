const pgConnection = require('../dbconn');
const fs = require("fs");
const axios = require("axios");

exports.getImageById = function (req, res) {
    const imageId = req.params.id;
    _getImageById(imageId).then((response) => {
        // change to static image path
        res.sendFile(response, {root: process.env.FILE_PATH});
    }).catch((err) => {
        console.log(err);
    });
}
async function _getImageById(imageId) {
    const query = '' +
        'SELECT image_path FROM moonshine.image ' +
        'WHERE image_id = $1';
    let result = await pgConnection.query(query, [imageId]);
    return result.rows[0].image_path;
}

exports.downloadFullImage = function (req, res) {
    _downloadFullImage().then((response) => {
        res.send(response);
    }).catch((err) => {
        console.log(err);
    });
}

exports.updateOneImage = function (req, res) {
    _updateOneImage(req.params.id).then(async (response) => {
        _getImageById(req.params.id).then((response) => {
            res.sendFile(response, {root: process.env.FILE_PATH});
        }).catch((err) => {
            console.log(err);
        });
    }).catch((err) => {
        console.log(err);
    });
}

async function _updateOneImage(id) {
    const query = '' +
        'SELECT image_path FROM moonshine.image ' +
        'WHERE image_id = $1';
    let result = await pgConnection.query(query, [id]);
    let component = {
        name: id,
        path: result.rows[0].image_path,
    };
    await _downloadOneImage(component).then((response) => {
    }).catch((err) => {
        console.log(err);
    });
}
const downloadUrl = (url, image_path) =>
    axios({
        url,
        responseType: 'stream',
    }).then(
        response =>
            new Promise((resolve, reject) => {
                response.data
                    .pipe(fs.createWriteStream(image_path))
                    .on('finish', () => resolve())
                    .on('error', e => reject(e));
            }),
    );


async function _downloadFullImage() {
    const query = '' +
        'SELECT image_id, image_path FROM moonshine.image';
    let result = await pgConnection.query(query);
    let response = [];

    for (let row of result.rows) {
        let component = {
            name: row.image_id,
            path: row.image_path,
        }
        response.push(component);
    }

    for (let component of response) {
        await _downloadOneImage(component).then((response) => {
        }).catch((err) => {
            console.log(err);
        });
    }
    return response;
}

async function _downloadOneImage(component) {
    let save_path = process.env.FILE_PATH + component.name;
    let loading_path = component.path;
    let ending = loading_path.split('.')[loading_path.split('.').length - 1];
    if (loading_path === "") {
        console.log("No image path for image_id " + component.name);
    }
    if (ending !== "jpg" && ending !== "png" && ending !== "jpeg" && ending !== "webp") {
        console.log("Not an image: " + loading_path + " from image_id " + component.name);
    }
    else save_path += "." + ending;
    if (fs.existsSync(save_path)) {
        let path = component.name + "." + ending;
        result = updatePath(component.name, path);
        if (result.rowCount === 0) {
            console.log("Error updating path for image_id " + component.name);
        } else {
            console.log("Path updated for image_id " + component.name);
        }
    } else {
        await downloadUrl(loading_path, save_path);
        let path = component.name + "." + ending;
        result = updatePath(component.name, path);
        if (result.rowCount === 0) {
            console.log("Error updating path for image_id " + component.name);
        } else {
            console.log("File Downloaded and Path updated for image_id " + component.name);
        }
    }
}

async function updatePath(imageId, path) {
    const query = '' +
        'UPDATE moonshine.image ' +
        'SET image_path = $1 ' +
        'WHERE image_id = $2';
    let result = await pgConnection.query(query, [path, imageId]);
    return result;
}