delete from Department; 
delete from Employee; 
delete from Training; 
delete from Employee_Type; 
delete from Supervisor; 
delete from Computer; 
delete from Customer;
delete from Ordering;
delete from Payment_Type;
delete from Product;
delete from Joint_Customer_Product_Table;
delete from Product_Type;

drop table if exists Department; 
drop table if exists Employee; 
drop table if exists Training; 
drop table if exists Employee_Type; 
drop table if exists Supervisor; 
drop table if exists Computer; 
drop table if exists Customer;
drop table if exists Ordering;
drop table if exists Payment_Type;
drop table if exists Product;
drop table if exists Joint_Customer_Product_Table;
drop table if exists Product_Type;


-- Personnel MGMT Section

-- Department Section

create table `Department` (
	`department_id` integer not null primary key autoincrement,
	`Name` text not null,
	`Budget` integer not null,
	`Number of Employees` integer not null
);

INSERT INTO Department VALUES (1, 'Accounting', 4000000, 30);

-- Employee Section

create table `Employee` (
	`employee_id` integer not null primary key autoincrement,
	`First Name` text not null,
	`Last Budget` text not null,
	`position` text not null,
	`department_id` text not null,
	`training_id` text not null, 
	foreign key(`department_id`) references `Department`(`department_id`),
	foreign key(`training_id`) references `Training`(`training_id`)
);

INSERT INTO Employee VALUES (1, 'Sketchy Jeff', "Dunbar", "Aquisitions Associate", 1, 1);



create table `Employee_Type` (
	`employee_type__id` integer not null primary key autoincrement, 
	`supervisor_id` integer not null, 
	foreign key(`supervisor_id`) references `Supervisor`(`supervisor_id`)
);

-- Specific Employee Positions

create table `Supervisor` (
	`supervisor_id` integer not null primary key autoincrement 
);


-- Other Asset Section

create table `Training` (
	`training_id` integer not null primary key autoincrement, 
	`Start_Date` text not null, 
	`End_Date` text not null, 
	`Roster Capacity` text not null 
);
insert into Training values(1, "1/20/17", "1/21/19", "1")

create table `Computer` (
	`computer_id` integer not null primary key autoincrement, 
	`Purchase_Date` text not null, 
	`Decomission_Date` text not null, 
	`employee_id` integer not null, 
	foreign key(`employee_id`) references `Employee`(`employee_id`)
);


-- Transaction MGMT Section

create table `Customer` (
	`customer_id` integer not null primary key autoincrement, 
	`First Name` text not null, 
	`Last Name` text not null, 
	`Account Creation Date` date not null,
	`Account Status` boolean not null 
);

create table `Ordering` (
	`ordering_id` integer not null primary key autoincrement, 
	`customer_id` integer not null, 
	`payment_type_id` integer not null,
	foreign key(`customer_id`) references `Customer`(`customer_id`),
	foreign key(`payment_type_id`) references `Payment_Type`(`payment_type_id`)
);

create table `Payment_Type` (
	`payment_type_id` integer not null primary key autoincrement, 
	`Payment Type` text not null, 
	`Account Number` text not null 
);

create table `Product` (
	`product_id` integer not null primary key autoincrement, 
	`price` text not null,
	`title` text not null, 
	`description` not null,
	`customer_id` integer not null,
	`product_type_id` integer not null,
	foreign key(`customer_id`) references `Customer`(`customer_id`),
	foreign key(`product_type_id`) references `Product_Type`(`product_type_id`)
);


create table `Joint_Customer_Product_Table` (
	`joint_customer_product_table_id` integer not null primary key autoincrement, 
	`customer_id` integer not null, 
	`product_id` integer not null,
	foreign key(`customer_id`) references `Customer`(`customer_id`),
	foreign key(`product_id`) references `Product`(`product_id`)
);

create table `Product_Type` (
	`product_type_id` integer not null primary key autoincrement, 
	`name` text not null, 
	`quantity` integer not null 
);

INSERT INTO Product_Type VALUES (null, 'Broom', 9);

select * from Product_Type
