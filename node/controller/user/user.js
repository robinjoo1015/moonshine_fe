const pgConnection = require('../dbconn');

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

exports.getUserPreference = function (req, res) {
    _getUserPreference(req.params.user_id).then((response) => {
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
    };
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
    let preference_insert_query = '' +
        'INSERT INTO moonshine.tastes (alcohol) VALUES (0) RETURNING taste_id';
    let preference_result = await pgConnection.query(preference_insert_query);
    let preference_id = preference_result.rows[0].taste_id;

    query = '' +
        'SELECT user_id FROM moonshine.users ' +
        'WHERE user_email = $1';

    result = await pgConnection.query(query, [email]);

    let preference_composition_query = '' +
        'INSERT INTO moonshine.user_taste_composition (user_id, taste_id) VALUES ' +
        '(' + result.rows[0].user_id + ', ' + preference_id + ')';
    await pgConnection.query(preference_composition_query);

    return {
        status: 200,
        id: result.rows[0].user_id,
    };
}

async function _getUserPreference(user_id) {
    let query = '' +
        'SELECT gentle, boozy, sweet, dry, alcohol ' +
        'FROM moonshine.user_taste_composition ' +
        '         INNER JOIN moonshine.tastes ' +
        '                    ON user_taste_composition.taste_id = tastes.taste_id ' +
        'WHERE user_id = ' + user_id;

    let result = await pgConnection.query(query);

    if (result.length === 0) {
        return {
            gentle: 0,
            boozy: 0,
            sweet: 0,
            dry: 0,
            alcohol: 0,
        }
    }

    return {
        gentle: result.rows[0].gentle,
        boozy: result.rows[0].boozy,
        sweet: result.rows[0].sweet,
        dry: result.rows[0].dry,
        alcohol: result.rows[0].alcohol,
    };
}

exports.updateUserPreferences = function (req, res) {
    _updateUserPreferences(req.params.user_id).then((response) => {
        res.send(response);
    }).catch((err) => {
        console.log(err);
    });
}

async function _updateUserPreferences(user_id) {
    let select_query = '' +
        'SELECT gentle, boozy, sweet, dry, alcohol FROM moonshine.cocktail_favorites ' +
        'INNER JOIN moonshine.cocktail_taste_composition ' +
        '    ON cocktail_taste_composition.cocktail_id = cocktail_favorites.cocktail_id ' +
        'INNER JOIN moonshine.tastes ' +
        '    ON cocktail_taste_composition.taste_id = tastes.taste_id ' +
        'WHERE user_id = ' + user_id;

    let result = await pgConnection.query(select_query);

    // find the average of each taste, skip if favorite list is empty
    let gentle = 0.0;
    let boozy = 0.0;
    let sweet = 0.0;
    let dry = 0.0;
    let alcohol = 0.0;

    if (result.rowCount !== 0) {
        // find if all gentle, boozy, sweet, dry, alcohol == 0.0, if so, skip
        let count = 0;
        for (let i = 0; i < result.rowCount; i++) {
            let all_zero = true;
            if (result.rows[i].gentle !== 0.0) {
                gentle += result.rows[i].gentle;
                all_zero = false;
            }
            if (result.rows[i].boozy !== 0.0) {
                boozy += result.rows[i].boozy;
                all_zero = false;
            }
            if (result.rows[i].sweet !== 0.0) {
                sweet += result.rows[i].sweet;
                all_zero = false;
            }
            if (result.rows[i].dry !== 0.0) {
                dry += result.rows[i].dry;
                all_zero = false;
            }
            if (result.rows[i].alcohol !== 0.0) {
                alcohol += result.rows[i].alcohol;
                all_zero = false;
            }
            if (!all_zero) {
                count++;
            }
        }
        gentle /= count;
        boozy /= count;
        sweet /= count;
        dry /= count;
        alcohol /= count;

        let taste_id_query = '' +
            'SELECT taste_id FROM moonshine.user_taste_composition ' +
            'WHERE user_id = ' + user_id;

        let taste_id_result = await pgConnection.query(taste_id_query);
        let taste_id = taste_id_result.rows[0].taste_id;

        // update user taste composition
        let update_query = '' +
            'UPDATE moonshine.tastes ' +
            'SET gentle = $1, boozy = $2, sweet = $3, dry = $4, alcohol = $5 ' +
            'WHERE taste_id = ' + taste_id;
        await pgConnection.query(update_query, [gentle, boozy, sweet, dry, alcohol]);

        return {
            status: 200,
            gentle: gentle,
            boozy: boozy,
            sweet: sweet,
            dry: dry,
            alcohol: alcohol,
        }
    }
}