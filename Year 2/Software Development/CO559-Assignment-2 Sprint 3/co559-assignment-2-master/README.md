The SQL script should create new tables that are required to test and use the program. 
You can add this database to MYSQL command line by entering:

source C:\PATHWAY\sqlScripts.sql

Where PATHWAY is where the file is being held. 
The default username and password used in the program to access the database is: 
Username: root
Password: root

So this may need to be changed for your username and password.

There's only a few entries in a couple of tables used for feature testing.

Useful commands for MySQL:

//Accesses the database we need for the program
USE mydb;

//Shows all the tables in mydb database.
SHOW TABLES;

//Shows the contents of the table you want.
SHOW * FROM `table-name`;
E.G: SHOW * FROM `patients table`;

//Add a row to a table.
INSERT INTO `the database`.`the table` (`column-1`, `column-2`) VALUES (`value-1`,`value-2`);

E.G: INSERT INTO `mydb`.`Messages Table` (`Message ID`, `Username`, `Message`, `Date`, `Username & Patient ID`) VALUES (1, 'hhac01', 'Test: Checking messages sent arent recieved to sender', '21/02/2021', 'tje01');
