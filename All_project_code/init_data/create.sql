DROP TABLE IF EXISTS userregistration CASCADE;
CREATE TABLE IF NOT EXISTS userregistration (
  firstname VARCHAR(30),
  lastname VARCHAR(30),
  username VARCHAR(30),      
  email VARCHAR(255) NOT NULL,   
  passwords VARCHAR(255) NOT NULL, 
  PRIMARY KEY(email) 
);

DROP TABLE IF EXISTS userprofile CASCADE;
CREATE TABLE IF NOT EXISTS userprofile (
  firstname VARCHAR(30),
  lastname VARCHAR(30),
  email VARCHAR(255) NOT NULL,
  mobile_phone VARCHAR(20) ,
  address_line_1 VARCHAR(50) ,
  address_line_2 VARCHAR(50) ,
  postcode VARCHAR(10) ,
  user_state VARCHAR(10) ,
  city VARCHAR(45) ,
  country VARCHAR(45) ,
  occupation VARCHAR(45) ,
  completed_ADL_count SMALLINT ,
  total_ADL SMALLINT ,
  total_month_completed_ADL_count SMALLINT ,
  total_week_completed_ADL_count SMALLINT ,
  PRIMARY KEY (email)
);

DROP TABLE IF EXISTS useradl CASCADE;
CREATE TABLE IF NOT EXISTS useradl (
  user_ADL_ID SERIAL PRIMARY KEY,
  email VARCHAR(255) NOT NULL,
  user_ADL_name VARCHAR(255) NOT NULL,
  user_ADL_description VARCHAR(255) ,
  times_ADL_completed SMALLINT ,
  times_ADL_completed_week SMALLINT ,
  times_ADL_completed_month SMALLINT 
);