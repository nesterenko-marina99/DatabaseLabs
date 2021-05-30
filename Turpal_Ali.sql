DROP TABLE IF EXISTS department;
DROP TABLE IF EXISTS position;
DROP TABLE IF EXISTS worker;
DROP TABLE IF EXISTS worker_account;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS item;
DROP TABLE IF EXISTS basket;
DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS customer_account;
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
    foreign key (positionId) references position(id),
    foreign key (departmentId) references department(id)
);

create TABLE worker_account (
    id serial not null primary key,
    login_ varchar(16),
    password_ varchar (32),
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
    foreign key (categoryId) references category(id)
);

create table basket (
    id serial not null primary key,
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
    foreign key (customerId) references customer(id)
);

create table order (
    id serial not null primary key,
    foreign key (basketId) references basket(id),
    foreign key (customerId) references customer(id),
    foreign key (workerId) references worker(id)
);