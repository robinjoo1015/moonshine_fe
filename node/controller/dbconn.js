const {Client} = require('pg');

const pgConnection = new Client({
    user: process.env.DB_USER, host: process.env.DB_HOST, database: process.env.DB_NAME, password: process.env.DB_PASSWD, port: process.env.DB_PORT,
})

pgConnection.connect();

pgConnection.query("SET search_path = \"moonshine\"", (err, res) => {
    console.log(err, res);
});

module.exports = pgConnection;