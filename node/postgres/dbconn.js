const {Client} = require('pg');

const pgConnection = new Client({
    user: "moonshine", host: "localhost", database: "moonshine", password: "moonshine", port: 5432,
})

pgConnection.connect();
pgConnection.query("SELECT NOW()", (err, res) => {
    console.log(err, res);
    pgConnection.end();
});

module.exports = pgConnection;