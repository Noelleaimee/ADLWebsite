/***********************
  Load Components!

  Express      - A Node.js Framework
  Body-Parser  - A tool to help use parse the data in a post request
***********************/

var express = require('express'); //Ensure our express framework has been added
var app = express();
var bodyParser = require('body-parser'); //Ensure our body-parser tool has been added
app.use(bodyParser.json());              // support json encoded bodies
app.use(bodyParser.urlencoded({ extended: true })); // support encoded bodies

//Create Database Connection
var mysql = require('mysql2');

var con = mysql.createConnection({
    host: "db",
    user: "root",
    password: "1234qwer",
    port: "3306"
});

con.connect(function(err) {
    if (err) throw err;
    console.log("Database connected.");
});


// set the view engine to ejs
app.set('view engine', 'ejs');
app.use(express.static(__dirname + '/'));//This line is necessary for us to use relative paths and access our resources directory

app.listen(3000);
console.log('3000 is the magic port');


