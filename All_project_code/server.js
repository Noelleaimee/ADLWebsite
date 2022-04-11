/***********************
  Load Components!

  Express      - A Node.js Framework
  Body-Parser  - A tool to help use parse the data in a post request
***********************/

// var express = require('express'); //Ensure our express framework has been added
// var app = express();
// var bodyParser = require('body-parser'); //Ensure our body-parser tool has been added
// app.use(bodyParser.json());              // support json encoded bodies
// app.use(bodyParser.urlencoded({ extended: true })); // support encoded bodies

// // Create Database Connection
// const mysql = require("mysql2");
// // var pgp = require('pg-promise')();

// const con = mysql.createPool({
// 	connectionLimit: 10,
//     host: "127.0.0.1",
//     user: "mysql",
//     password: "1234qwer",
//     database: "adl_db"
// });
// // var db = pgp(con);
// console.log(con)

var express = require('express'); //Ensure our express framework has been added
var app = express();
var bodyParser = require('body-parser'); //Ensure our body-parser tool has been added
const { request, response } = require('express');
app.use(bodyParser.json());              // support json encoded bodies
app.use(bodyParser.urlencoded({ extended: true })); // support encoded bodies

//Create Database Connection
var pgp = require('pg-promise')();

const dbConfig = {
	host: 'db',
	port: 5432,
	database: 'adl_db',
	user: 'postgres',
	password: 'pwd'
};

var db = pgp(dbConfig);

// set the view engine to ejs
app.set('view engine', 'ejs');
app.use(express.static(__dirname + '/'));//This line is necessary for us to use relative paths and access our resources directory


// login page
// app.get('/', function(req, res) {
// 	res.render('pages/login', {
// 		my_title: "Login Page",
// 		local_css: "signin.css"
// 	})
// })
app.get('/login', function(req, res) {
	var username = req.query.uname;
	var password = req.query.pwd;
	var loginQuery = "Select username from userregistration where username = '" + username + "' and password = '" + password + "';";

	db.task('login', task => {
		return task.batch([
			task.any(loginQuery)
		]);
	})
	.then(data => {
		console.log(data)
		
	})

	.catch(err => {
		console.log('error', err)
		res.render('pages/login', {
			username: '',
			error: 'User not found.'
		})
	})
	// res.render('pages/login',{
	// 	local_css:"signin.css",
	// 	my_title:"Login Page"
	// });
});

// registration page
app.get('/registration', function(req, res) {
	res.render('pages/registration', {
		my_title: "Users' registration",
	})
})

app.post('/registration', function(req, res) {
	var firstname = req.body.first_name;
	var lastname = req.body.last_name;
	var username = req.body.uname;
	var email = req.body.email;
	var password = req.body.pwd;
	var insert_statement = "insert into userregistration(email, username, passwords, firstname, lastname) values ('" + email + "', '" + username + "', '" + password + "', '" + firstname + "', '"+ lastname + "');";
  
	db.task('register', task => {
		return task.batch([
			task.any(insert_statement)
		])
	})
	.then(data => {
		console.log(data[0])
		  res.render('pages/login', {
			  my_title: "Users' registration",
			  users: '',
			  user_info: ''
		  })
	  })
  
	  .catch(err => {
		  console.log('error', err);
		  res.render('pages/registration', {
			  my_title: "Users' registration",
			  users:'',
			  user_info:'',
		  })
	  });
  });

// home page
app.get('/home', function(req, res) {
	res.render('pages/home',{
		local_css: "home_style.css",
		my_title:"Home Page"
	});
});


// set the view engine to ejs
app.set('view engine', 'ejs');
app.use(express.static(__dirname + '/'));//This line is necessary for us to use relative paths and access our resources directory

app.listen(3000);
console.log('3000 is the magic port');


