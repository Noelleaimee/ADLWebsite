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

// Create Database Connection
const mysql = require("mysql2");

const con = mysql.createPool({
	connectionLimit: 10,
    host: "127.0.0.1",
    user: "mysql",
    password: "1234qwer",
    database: "adl_db"
});

console.log(con)

// login page
app.get('/', function(req, res) {
	res.render('pages/login',{
		local_css:"signin.css",
		my_title:"Login Page"
	});
});

// registration page
app.get('/registration', function(req, res) {
	res.render('pages/registration',{
		my_title:"Registration Page"
	});
});

// home page
app.get('/home', function(req, res) {
	res.render('pages/home',{
		my_title:"Home Page"
	});
});


// set the view engine to ejs
app.set('view engine', 'ejs');
app.use(express.static(__dirname + '/'));//This line is necessary for us to use relative paths and access our resources directory

app.listen(3000);
console.log('3000 is the magic port');


