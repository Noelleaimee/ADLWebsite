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
app.get('/', function(req, res) {
	res.render('pages/login', {
		my_title: "Login Page",
		local_css: "signin.css"
	})
})
app.get('/login', function(req, res) {
	var username = req.query.uname;
	var password = req.query.pwd;
	var loginQuery = "Select username, passwords from userregistration where username = '" + username + "' and passwords = '" + password + "';";

	// res.render('pages/login',{
	// 	local_css:"signin.css",
	// 	my_title:"Login Page"
	// });

	db.task('login', task => {
		return task.batch([
			task.any(loginQuery)
		]);
	})
	.then(data => {
		// console.log(data[0][0], data[0][0].passwords)
		if (data[0][0].passwords == password)
		{
			res.render('pages/home',{
				local_css:"home_style.css",
				my_title:"Home Page"
			});
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
		//console.log(data[0])
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

// prof_settings page
app.get('/prof_settings', function(req, res) {
	res.render('pages/prof_settings',{
		local_css: "home_style.css",
		my_title:"Prof_settings Page"
	});

	// $(savebutton).on('click', function() {
	// 	alert(firstname);
	// })

});

app.post('/prof_settings', function(req, res) {
	
	var firstname = req.body.fName;
	var lastname = req.body.lName;
	var mobileNumber = req.body.phone;
	var address1 = req.body.address1;
	var address2 = req.body.address2;
	var postcode = req.body.postcode;
	var state = req.body.state;
	var area = req.body.area;
	var emailID = req.body.email;
	var occupation = req.body.occupation;
	var country = req.body.country;
	var region = req.body.region;
	var insert = "insert into userprofile(firstname, lastname, email, mobile_phone, address_line_1, address_line_2, postcode, user_state, city, country, occupation) values ('"+ firstname + "', '"+ lastname + "', '"+ emailID + "', '"+ mobileNumber +"', '"+ address1 +"', '"+ address2 +"', '"+ postcode +"', '"+ state +"', '"+ area +"', '"+ country +"', '"+ occupation +"');";
	var username = "select username from userprofile where firstname = '"+ firstname + "' and '"+ lastname + "';";

	db.task('register', task => {
		return task.batch([
			task.any(insert)
		]);
	})
	.then(data => {
		console.log(data)
		res.render('pages/Profile_page', {
			my_title: "Profile setting page",
			user: username, 
		})
	})
	.catch(err => {
		console.log('error', err)
		res.render('pages/prof_settings', {
			my_title: "Profile setting page",
			user: '',
		})
	})

	// $(savebutton).on('click', function() {
	// 	alert(firstname);
	// })

});

//graph attempt
app.get('/graph', function(req, res) {
	var query1 = 'select * from useradl;';
	db.task('get-everything', task => {
		return task.batch([
			task.any(query1),
		]);
	})
	.then(data => {
		//console.log(data[0]);
		res.render('pages/graph',{
				my_title: "Page Title Here",
				data: data[0]
			})
	})
	.catch(err => {
		// display error message in case an error
			console.log('error', err);
			res.render('pages/graph',{
				my_title: "Page Title Here",
				data: '',
				result_2: '',
				result_3: ''
			})
		});
	});

//end

// ADL page
app.get('/ADL_page', function(req, res) {
	res.render('pages/ADL_page',{
		my_title:"ADL Page"
	});
});

 app.post('/ADL_page', function(req, res) {
 	var email_ADL = req.body.user_email;
 	var user_ADL_name = req.body.fname;
 	var user_ADL_description = req.body.description;
 	var times_ADL_completed = req.body.total_ADL;
 	var times_ADL_completed_week = req.body.week_ADL;
 	var times_ADL_completed_month = req.body.month_ADL;
 	var insert_statement = "INSERT into useradl(email, user_ADL_name, user_ADL_description, times_ADL_completed, times_ADL_completed_week, times_ADL_completed_month) values ('" + email_ADL + "', '" + user_ADL_name + "', '" + user_ADL_description + "', '" + times_ADL_completed + "', '"+ times_ADL_completed_week + "', '"+ times_ADL_completed_month + "');";
	 
	db.task('ADL_page', task => {
		return task.batch([
			task.any(insert_statement)
		])
	})
	.then(data => {
		console.log(data[0])
		  res.render('pages/ADL_page', {
			  my_title: "ADL page",
			  users: '',
			  user_info: ''
		  })
	  })
  
	  .catch(err => {
		  console.log('error', err);
		  res.render('pages/ADL_page', {
			  my_title: "ADL page",
			  users:'',
			  user_info:'',
		  })
	  });
  });
app.get('/Profile_page', function(req, res) {
	res.render('pages/Profile_page', {
		my_title: "Profile page(demo)"
	})
})

app.get('/profile', function(req, res) {
	var user = "select * from userprofile;";

	db.task('get_user', task => {
		return task.batch([
			task.any(user),
		]);
	})
	.then(info => {
		console.log(info[0])
		console.log(info[0][0].firstname)
		res.render('pages/Profile', {
			my_title: "Profile_info",
			user_info: info[0]
		})
	})
	.catch(err => {
		console.log('error', err)
		res.render('pages/Profile', {
			my_title: "Profile_info",
			user_info: ''
		})
	});
});	



// set the view engine to ejs
app.set('view engine', 'ejs');
app.use(express.static(__dirname + '/'));//This line is necessary for us to use relative paths and access our resources directory

app.listen(3000);
console.log('3000 is the magic port');


