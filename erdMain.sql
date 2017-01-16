drop table if exists Computer; 
drop table if exists Customer;
drop table if exists Ordering;
drop table if exists Payment_Type;
drop table if exists Product;
drop table if exists Joint_Customer_Product_Table;
drop table if exists Product_Type;
drop table if exists Department; 
drop table if exists Employee; 
drop table if exists Training; 
drop table if exists Employee_Type; 
drop table if exists Supervisor; 


-- Personnel MGMT Section

-- Department Section

create table `Department` (
	`department_id` integer not null primary key autoincrement,
	`Name` text not null,
	`Budget` integer not null,
	`Number of Employees` integer not null
);


create table `Training` (
	`training_id` integer not null primary key autoincrement, 
	`Start_Date` text not null, 
	`End_Date` text not null, 
	`Roster Capacity` text not null, 
	`Description` text not null
);

-- Employee Section

create table `Supervisor` (
	`supervisor_id` integer not null primary key autoincrement 
);

create table `Employee_Type` (
	`employee_type_id` integer not null primary key autoincrement, 
	`supervisor_id` integer not null, 
	foreign key(`supervisor_id`) references `Supervisor`(`supervisor_id`)
);

-- Specific Employee Positions



create table `Employee` (
	`employee_id` integer not null primary key autoincrement,
	`First Name` text not null,
	`Last Budget` text not null,
	`position` text not null,
	`department_id` text not null,
	`training_id` text not null, 
	`employee_type_id` integer not null,
	foreign key(`department_id`) references `Department`(`department_id`) on delete cascade,
	foreign key(`training_id`) references `Training`(`training_id`) on delete cascade,
	foreign key(`employee_type_id`) references `Employee_Type`(`employee_type_id`) on delete cascade
);


-- Other Asset Section

create table `Computer` (
	`computer_id` integer not null primary key autoincrement, 
	`Purchase_Date` date not null, 
	`Decomission_Date` date not null, 
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

insert into Department values (null, 'Accounting', 4000000, 30);
insert into Department values (null, 'HR', 1000000, 13);

insert into Supervisor values (null);

insert into Employee_Type values (null, 1);
insert into Training values(1, "1/20/17", "1/21/19", "1", "Sensitivity");

insert into Employee values (null, 'Sketchy Jeff', "Dunbar", "Assistant to the Aquisitions Manager", 1, 1, 1);
insert into Employee values (null, 'Steezy Steve', "Skaggs", "HR Overseer", 2, 1, 1);

insert into Computer values (null, '2016-01-17', '2020-01-17', 1);

insert into Product_Type values (null, 'Broom', 9);

insert into Customer values (null, "Cool", "Craig", "2017-01-16", "True");
insert into Customer values (null, "Surly", "Sue", "2017-01-16", "True");

