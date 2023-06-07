const pgConnection = require('../dbconn');
const fs = require("fs");
const axios = require("axios");

exports.userLogin = function (req, res) {
    _userLogin(req.body).then((response) => {
        res.send(response);
    }).catch((err) => {
        console.log(err);
    });
}

exports.userCreate = function (req, res) {
    _userCreate(req.body).then((response) => {
        res.send(response);
    }).catch((err) => {
        console.log(err);
    });
}

async function _userLogin(body) {
    const email = body.email;
    const password = body.password;

    let query = '' +
        'SELECT user_id, user_name FROM moonshine.users ' +
        'WHERE user_email = $1 AND user_password = $2';

    let result = await pgConnection.query(query, [email, password]);
    if (result.rowCount === 0) {
        return {
            status: 404,
            id: 0,
            name: null,
        }
    }
    console.log(result.rows[0].user_id);
    return {
        status: 200,
        id: result.rows[0].user_id,
        name: result.rows[0].user_name,
    }
}

async function _userCreate(body) {
    const name = body.name;
    const email = body.email;
    const password = body.password;

    let query = '' +
        'INSERT INTO moonshine.users (user_name, user_email, user_password) ' +
        'VALUES ($1, $2, $3)';

    let result = null;
    try{
        result = await pgConnection.query(query, [name, email, password]);
    } catch (err) {
        return {
            status: 404,
            id: 0,
        }
    }

    query = '' +
        'SELECT user_id FROM moonshine.users ' +
        'WHERE user_email = $1';

    result = await pgConnection.query(query, [email]);

    return {
        status: 200,
        id: result.rows[0].user_id,
    }
}