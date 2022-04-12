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
  email varchar(255) NOT NULL,
  mobile_phone varchar(20) DEFAULT NULL,
  address_line_1 varchar(50) DEFAULT NULL,
  address_line_2 varchar(50) DEFAULT NULL,
  postcode varchar(10) DEFAULT NULL,
  user_state varchar(2) DEFAULT NULL,
  city varchar(45) DEFAULT NULL,
  country varchar(45) DEFAULT NULL,
  occupation varchar(45) DEFAULT NULL,
  completed_ADL_count int DEFAULT NULL,
  total_ADL int DEFAULT NULL,
  total_month_completed_ADL_count int DEFAULT NULL,
  total_week_completed_ADL_count int DEFAULT NULL,
  PRIMARY KEY (email)
);

DROP TABLE IF EXISTS useradl CASCADE;
CREATE TABLE IF NOT EXISTS useradl (
  user_ADL_ID SERIAL PRIMARY KEY,
  email varchar(255) NOT NULL,
  user_ADL_name varchar(255) NOT NULL,
  user_ADL_description varchar(255) DEFAULT NULL,
  times_ADL_completed int DEFAULT NULL,
  times_ADL_completed_week int DEFAULT NULL,
  times_ADL_completed_month int DEFAULT NULL
);