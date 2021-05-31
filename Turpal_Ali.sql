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
VALUES ("Отдел Кадров", "Занимается подбором персонала");
INSERT INTO department (title, description_)
VALUES ("Отдел Безопасности", "Обеспечивает защиту предприятия от кибер-атак");
INSERT INTO department (title, description_)
VALUES ("SMM-отдел", "Занимается рекламой в соц-сетях");
INSERT INTO department (title, description_)
VALUES ("Отдел продаж", "Общение с клиентами, помощь в выборе товара, ориентации по магазину");
INSERT INTO department (title, description_)
VALUES ("Техподдержка", "Обработка ошибок, связанных с техникой");

INSERT INTO position (title, description_, hour_salary)
VALUES ("SMM-специалист", "Занимается продвижением магазина");
INSERT INTO position (title, description_, hour_salary)
VALUES ("Инспектор безопасности", "Занимается отделом безопасности");
INSERT INTO position (title, description_, hour_salary)
VALUES ("Старший соотрудник", "Ведущий соотрудник отдела");
INSERT INTO position (title, description_, hour_salary)
VALUES ("Младший соотрудник", "Рядовой соотрудник отдела");
INSERT INTO position (title, description_, hour_salary)
VALUES ("Программист", "Занимается технической стороной магазина");

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
INSERT INTO worker (name_, surname, email, phone, workhours)
VALUES ();
INSERT INTO worker (name_, surname, email, phone, workhours)
VALUES ();

UPDATE worker SET positionid = 1 WHERE id = 1;
UPDATE worker SET departmentid = 3 WHERE id = 1;
UPDATE worker SET positionid = 2 WHERE id = 2;
UPDATE worker SET departmentid = 2 WHERE id = 2;
UPDATE worker SET positionid = 3 WHERE id = 3;
UPDATE worker SET departmentid = 1 WHERE id = 3;
UPDATE worker SET positionid = 4 WHERE id = 4;
UPDATE worker SET departmentid = 1 WHERE id = 4;
UPDATE worker SET positionid = 5 WHERE id = 5;
UPDATE worker SET departmentid = 5 WHERE id = 5;
UPDATE worker SET positionid = 5 WHERE id = 6;
UPDATE worker SET departmentid = 5 WHERE id = 6;
UPDATE worker SET positionid = 3 WHERE id = 7;
UPDATE worker SET departmentid = 4 WHERE id = 7;


INSERT INTO worker_account (login_, password_)
VALUES ("yatochk", "noragami88");
INSERT INTO worker_account (login_, password_)
VALUES ("darkness", "konosuba11");
INSERT INTO worker_account (login_, password_)
VALUES ("kirito", "SwordArtOnline");
INSERT INTO worker_account (login_, password_)
VALUES ("boruto", "narutofiller");
INSERT INTO worker_account (login_, password_)
VALUES ("inori", "guilty_crown");
INSERT INTO worker_account (login_, password_)
VALUES ("bulbazaur", "Pokemon34");
INSERT INTO worker_account (login_, password_)
VALUES ("tangiro", "demon_slayer");

UPDATE worker_account SET workerId = 1 WHERE id = 1;
UPDATE worker_account SET workerId = 2 WHERE id = 2;
UPDATE worker_account SET workerId = 3 WHERE id = 3;
UPDATE worker_account SET workerId = 4 WHERE id = 4;
UPDATE worker_account SET workerId = 5 WHERE id = 5;
UPDATE worker_account SET workerId = 6 WHERE id = 6;
UPDATE worker_account SET workerId = 7 WHERE id = 7;

INSERT INTO category (title, description_)
VALUES ("Периферия", "Компьютерные мыши, клавиатуры, т.д.");
INSERT INTO category (title, description_)
VALUES ("Аудио", "Колонки и наушники");
INSERT INTO category (title, description_)
VALUES ("Бытовая техника", "Холодильники, Стиральные машинки и т.д.");
INSERT INTO category (title, description_)
VALUES ("Гаджеты", "Телефоны, ноутбуки, планшеты");
INSERT INTO category (title, description_)
VALUES ("Аксессуары", "Чехлы, поп-сокеты, стекла, ...");

INSERT INTO item (title, price, stock, description_)
VALUES ("Apple MagicMouse", 2900, 300, "беспроводная копьютерная эргономичная мышь");
INSERT INTO item (title, price, stock, description_)
VALUES ("Marshall major2", 2500, 690, "Беспроводные накладные наушники");
INSERT INTO item (title, price, stock, description_)
VALUES ("Bosch maxx 4", 27990, 10, "Стиральная машинка фронтальная");
INSERT INTO item (title, price, stock, description_)
VALUES ("Honor 10i", 12990, 440, "Смартфон с трипл камерой и nfc");
INSERT INTO item (title, price, stock, description_)
VALUES ("Apple iPhone6 Case", 300, 5000, "Защитный чехол для iPhone 6");

UPDATE item SET categoryId = 1 WHERE id = 1;
UPDATE item SET categoryId = 2 WHERE id = 2;
UPDATE item SET categoryId = 3 WHERE id = 3;
UPDATE item SET categoryId = 4 WHERE id = 4;
UPDATE item SET categoryId = 5 WHERE id = 5;


INSERT INTO basket;
INSERT INTO basket;
INSERT INTO basket;

UPDATE basket SET itemId = 1 WHERE id = 1;
UPDATE basket SET itemId = 2 WHERE id = 2;
UPDATE basket SET itemId = 4 WHERE id = 4;



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
VALUES ("eren", "attack_titan");
INSERT INTO customer_account (login_, password_)
VALUES ("senku", "Dr. Stone");
INSERT INTO customer_account (login_, password_)
VALUES ("subaru", "RE:Zero");
INSERT INTO customer_account (login_, password_)
VALUES ("miyamura", "horimiya");
INSERT INTO customer_account (login_, password_)
VALUES ("Kira", "Death Note");

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