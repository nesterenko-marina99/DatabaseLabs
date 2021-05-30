DROP TABLE IF EXISTS department;
DROP TABLE IF EXISTS position;
DROP TABLE IF EXISTS worker;
DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS customer_account;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS item;
DROP TABLE IF EXISTS basket;
DROP TABLE IF EXISTS worker_account;
DROP TABLE IF EXISTS order;

CREATE TABLE department (
    id Serial not null PRIMARY key,
    title VARCHAR(32),
    description_ VARCHAR (128)
);

CREATE TABLE position (
    id serial not null PRIMARY key,
    title VARCHAR(32),
    description_ VARCHAR(128),
    hour_salary INT
);

CREATE TABLE worker (
    id serial not null primary key,
    name_ varchar (16),
    surname VARCHAR (16),
    email VARCHAR(32),
    phone VARCHAR (11),
    workhours INT,
    positionId INT,
    departmentId INT,
    foreign key (positionId) references position(id),
    foreign key (departmentId) references department(id)
);

create TABLE worker_account (
    id serial not null primary key,
    login_ varchar(16),
    password_ varchar (32),
    workerId INT,
    foreign key (workerId) references worker(id)
);

create table category (
    id serial not null primary key,
    title varchar (45),
    description_ varchar (45)
);

create table item (
    id serial not null primary key,
    title VARCHAR (45),
    price INT,
    stock INT,
    description_ varchar(128),
    categoryId INT foreign key references category(id)
);

create table basket (
    id serial not null primary key,
    itemId INT,
    foreign key (itemId) references item(id)
);

create table customer (
    id serial not null primary key,
    name_ varchar (16),
    surname VARCHAR (16),
    phone VARCHAR (11),
    email VARCHAR(32)
);

create table customer_account (
    id serial not null primary key,
    login_ varchar(16),
    password_ varchar (32),
    customerId INT,
    foreign key (customerId) references customer(id)
);

create table order (
    id serial not null primary key,
    basketId INT,
    customerId INT,
    workerId INT,
    foreign key (basketId) references basket(id),
    foreign key (customerId) references customer(id),
    foreign key (workerId) references worker(id)
);

INSERT INTO department (title, description_)
VALUES ();
INSERT INTO department (title, description_)
VALUES ();
INSERT INTO department (title, description_)
VALUES ();
INSERT INTO department (title, description_)
VALUES ();
INSERT INTO department (title, description_)
VALUES ();

INSERT INTO position (title, description_, hour_salary)
VALUES ();
INSERT INTO position (title, description_, hour_salary)
VALUES ();
INSERT INTO position (title, description_, hour_salary)
VALUES ();
INSERT INTO position (title, description_, hour_salary)
VALUES ();
INSERT INTO position (title, description_, hour_salary)
VALUES ();

INSERT INTO worker (name_, surname, email, phone, workhours)
VALUES ();
INSERT INTO worker (name_, surname, email, phone, workhours)
VALUES ();
INSERT INTO worker (name_, surname, email, phone, workhours)
VALUES ();
INSERT INTO worker (name_, surname, email, phone, workhours)
VALUES ();
INSERT INTO worker (name_, surname, email, phone, workhours)
VALUES ();

UPDATE worker SET positionid = 1 WHERE id = 1;
UPDATE worker SET departmentid = 1 WHERE id = 1;
UPDATE worker SET positionid = 2 WHERE id = 2;
UPDATE worker SET departmentid = 2 WHERE id = 2;
UPDATE worker SET positionid = 3 WHERE id = 3;
UPDATE worker SET departmentid = 3 WHERE id = 3;
UPDATE worker SET positionid = 4 WHERE id = 4;
UPDATE worker SET departmentid = 4 WHERE id = 4;
UPDATE worker SET positionid = 5 WHERE id = 5;
UPDATE worker SET departmentid = 5 WHERE id = 5;

INSERT INTO worker_account (login_, password_)
VALUES ();
INSERT INTO worker_account (login_, password_)
VALUES ();
INSERT INTO worker_account (login_, password_)
VALUES ();
INSERT INTO worker_account (login_, password_)
VALUES ();
INSERT INTO worker_account (login_, password_)
VALUES ();

UPDATE worker_account SET workerId = 1 WHERE id = 1;
UPDATE worker_account SET workerId = 2 WHERE id = 2;
UPDATE worker_account SET workerId = 3 WHERE id = 3;
UPDATE worker_account SET workerId = 4 WHERE id = 4;
UPDATE worker_account SET workerId = 5 WHERE id = 5;


INSERT INTO category (title, description_)
VALUES ();
INSERT INTO category (title, description_)
VALUES ();
INSERT INTO category (title, description_)
VALUES ();
INSERT INTO category (title, description_)
VALUES ();
INSERT INTO category (title, description_)
VALUES ();

INSERT INTO item (title, price, stock, description_)
VALUES ();
INSERT INTO item (title, price, stock, description_)
VALUES ();
INSERT INTO item (title, price, stock, description_)
VALUES ();
INSERT INTO item (title, price, stock, description_)
VALUES ();
INSERT INTO item (title, price, stock, description_)
VALUES ();

UPDATE item SET categoryId = 1 WHERE id = 1;
UPDATE item SET categoryId = 2 WHERE id = 2;
UPDATE item SET categoryId = 3 WHERE id = 3;
UPDATE item SET categoryId = 4 WHERE id = 4;
UPDATE item SET categoryId = 5 WHERE id = 5;


INSERT INTO basket;
INSERT INTO basket;
INSERT INTO basket;
INSERT INTO basket;
INSERT INTO basket;

UPDATE basket SET itemId = 1 WHERE id = 1;
UPDATE basket SET itemId = 2 WHERE id = 2;
UPDATE basket SET itemId = 3 WHERE id = 3;
UPDATE basket SET itemId = 4 WHERE id = 4;
UPDATE basket SET itemId = 5 WHERE id = 5;


INSERT INTO customer (name_, surname,  phone, email)
VALUES ();
INSERT INTO customer (name_, surname,  phone, email)
VALUES ();
INSERT INTO customer (name_, surname,  phone, email)
VALUES ();
INSERT INTO customer (name_, surname,  phone, email)
VALUES ();
INSERT INTO customer (name_, surname,  phone, email)
VALUES ();

INSERT INTO customer_account (login_, password_)
VALUES ();
INSERT INTO customer_account (login_, password_)
VALUES ();
INSERT INTO customer_account (login_, password_)
VALUES ();
INSERT INTO customer_account (login_, password_)
VALUES ();
INSERT INTO customer_account (login_, password_)
VALUES ();

UPDATE customer_account SET customerId = 1 WHERE id = 1;
UPDATE customer_account SET customerId = 2 WHERE id = 2;
UPDATE customer_account SET customerId = 3 WHERE id = 3;
UPDATE customer_account SET customerId = 4 WHERE id = 4;

INSERT INTO order;
INSERT INTO order;
INSERT INTO order;
INSERT INTO order;
INSERT INTO order;

UPDATE order SET basketId = 2 WHERE id = 1;
UPDATE order SET basketId = 1 WHERE id = 2;
UPDATE order SET basketId = 4 WHERE id = 3;
UPDATE order SET basketId = 3 WHERE id = 4;
UPDATE order SET customerId = 1 WHERE id = 1;
UPDATE order SET customerId = 2 WHERE id = 2;
UPDATE order SET customerId = 3 WHERE id = 3;
UPDATE order SET customerId = 4 WHERE id = 4;
UPDATE order SET workerId = 4 WHERE id = 1;
UPDATE order SET workerId = 3 WHERE id = 2;
UPDATE order SET workerId = 2 WHERE id = 3;
UPDATE order SET workerId = 1 WHERE id = 4;