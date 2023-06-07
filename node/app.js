require('dotenv').config({path: './config/.env'});
const express = require("express");
const app = express();
app.use(express.json());

const mysqlConnection = require('./controller/dbconn');

const port = process.env.SERVER_PORT || 3000;

app.set("port", port);

const indexRouter = require("./routes/index");

app.use(indexRouter);
app.use(express.static(process.env.FILE_PATH))
app.listen(port, () => console.log("Listening on", port));

module.exports = app;
