const express = require("express");

const mysqlConnection = require('./postgres/dbconn');

const app = express();

const port = 3000;

app.set("port", port);

app.get("/", (req, res) => {
  res.send("Hello world!");
});

app.listen(port, () => console.log("Listening on", port));

module.exports = app;
