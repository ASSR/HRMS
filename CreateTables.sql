CREATE TABLE users (
	user_id serial PRIMARY KEY,
	email VARCHAR (60) UNIQUE NOT NULL,
	email_token VARCHAR (255) UNIQUE NOT NULL,
	password_salt VARCHAR (250) NOT NULL,
	password_hash VARCHAR (250) NOT NULL,
	active BOOL NOT NULL DEFAULT 'f',
	created_on TIMESTAMP NOT NULL,
    last_login TIMESTAMP);

CREATE TABLE employees (
	user_id INT PRIMARY KEY,
	first_name VARCHAR (60) NOT NULL,
	last_name VARCHAR (60) NOT NULL,
	tcno VARCHAR (11) UNIQUE NOT NULL,
	year_of_birth INT NOT NULL,
	FOREIGN KEY (user_id) REFERENCES users (user_id) 
		ON UPDATE CASCADE ON DELETE CASCADE);

CREATE TABLE companies (
	user_id INT PRIMARY KEY,
	companies_name VARCHAR (50) UNIQUE NOT NULL,
	web_adress VARCHAR (50) NOT NULL,
	tel VARCHAR (20) NOT NULL,
	FOREIGN KEY (user_id) REFERENCES users (user_id) 
		ON UPDATE CASCADE ON DELETE CASCADE);
		
CREATE TABLE system_personels (
	user_id INT PRIMARY KEY,
	first_name VARCHAR (60) NOT NULL,
	last_name VARCHAR (60) NOT NULL,
	tcno VARCHAR (11) UNIQUE NOT NULL,
	birthday DATE NOT NULL,
	tel VARCHAR (20) NOT NULL,
	FOREIGN KEY (user_id) REFERENCES users (user_id) 
		ON UPDATE CASCADE ON DELETE CASCADE);

CREATE TABLE roles(
   role_id serial PRIMARY KEY,
   role_name VARCHAR (50) UNIQUE NOT NULL
);

CREATE TABLE user_roles (
  user_role_id serial PRIMARY KEY,
  user_id INT NOT NULL,
  role_id INT NOT NULL,
  grant_date TIMESTAMP,
  FOREIGN KEY (role_id) REFERENCES roles (role_id) 
	ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (user_id) REFERENCES users (user_id) 
	ON UPDATE CASCADE ON DELETE CASCADE
);