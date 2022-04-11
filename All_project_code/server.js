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
	var username = req.query.uname;
	var password = req.query.pwd;
	var loginQuery = "Select username from userregistration where username = '" + username + "' and password = '" + password + "';";

	db.task('login', task => {
		return task.batch([
			task.any(loginQuery)
		]);
	})
	.then(data => {
		if(data[0].length > 0){
			var user = data[0][0].username;
			return res.redirect("/home")
		} else {
			res.render('pages/login', {
				my_title: "Login Page",
				local_css: "signin.css",
				username: '',
				error: 'User not found.'
			})
		}
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
app.post('/registration', function(req, res) {
	var username = req.body.uname;
	var email = req.body.email;
	var password = req.body.pwd;
	var phone = req.body.phone;
	var insert_statement = "insert into userregistration(email, username, password) value ('" + email + "', '" + username + "', '" + password + "');";
  
	db.task('register', task => {
	  return task.batch([
	  task.any(insert_statement),
	  ]);
	})
	.then(data => {
		  res.render('pages/registration', {
			  my_title: "Users' registration",
			  users: username,
			  user_info: data[0]
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
		my_title:"Home Page"
	});
});


// set the view engine to ejs
app.set('view engine', 'ejs');
app.use(express.static(__dirname + '/'));//This line is necessary for us to use relative paths and access our resources directory

app.listen(3000);
console.log('3000 is the magic port');


