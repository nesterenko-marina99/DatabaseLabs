DROP TABLE IF EXISTS order_table;
DROP TABLE IF EXISTS customer_account;
DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS basket;
DROP TABLE IF EXISTS item;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS worker_account;
DROP TABLE IF EXISTS worker;
DROP TABLE IF EXISTS position;
DROP TABLE IF EXISTS department;

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
    phone VARCHAR (12),
    workhours INT,
    positionId INT,
    departmentId INT,
    FOREIGN key (positionId) references position(id),
    FOREIGN key (departmentId) references department(id)
);

create TABLE worker_account (
    id serial not null primary key,
    login_ varchar(16),
    password_ varchar (32),
    workerId INT,
    FOREIGN key (workerId) references worker(id)
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
    categoryId INT,
    FOREIGN key (categoryId) references category(id)
);

create table basket (
    id serial not null primary key,
    itemId INT,
    FOREIGN key (itemId) references item(id)
);

create table customer (
    id serial not null primary key,
    name_ varchar (16),
    surname VARCHAR (16),
    phone VARCHAR (12),
    email VARCHAR(32)
);

create table customer_account (
    id serial not null primary key,
    login_ varchar(16),
    password_ varchar (32),
    customerId INT,
    FOREIGN key (customerId) references customer(id)
);

create table order_table (
    id serial not null primary key,
    basketId INT,
    customerId INT,
    workerId INT,
    FOREIGN key (basketId) references basket(id),
    FOREIGN key (customerId) references customer(id),
    FOREIGN key (workerId) references worker(id)
);

INSERT INTO department (title, description_)
VALUES ('Отдел Кадров', 'Занимается подбором персонала');
INSERT INTO department (title, description_)
VALUES ('Отдел Безопасности', 'Обеспечивает защиту предприятия от кибер-атак');
INSERT INTO department (title, description_)
VALUES ('SMM-отдел', 'Занимается рекламой в соц-сетях');
INSERT INTO department (title, description_)
VALUES ('Отдел продаж', 'Общение с клиентами, помощь в выборе товара, ориентации по магазину');
INSERT INTO department (title, description_)
VALUES ('Техподдержка', 'Обработка ошибок, связанных с техникой');

INSERT INTO position (title, description_, hour_salary)
VALUES ('SMM-специалист', 'Занимается продвижением магазина', 500);
INSERT INTO position (title, description_, hour_salary)
VALUES ('Инспектор безопасности', 'Занимается отделом безопасности', 300);
INSERT INTO position (title, description_, hour_salary)
VALUES ('Старший соотрудник', 'Ведущий соотрудник отдела', 350);
INSERT INTO position (title, description_, hour_salary)
VALUES ('Младший соотрудник', 'Рядовой соотрудник отдела', 250);
INSERT INTO position (title, description_, hour_salary)
VALUES ('Программист', 'Занимается технической стороной магазина', 700);

INSERT INTO worker (name_, surname, email, phone, workhours)
VALUES ('Алексей','Дерябин', 'deryabinam@mail.ru', '+79879811245', 8);
INSERT INTO worker (name_, surname, email, phone, workhours)
VALUES ('Антонина', 'Маляева', 'malan1352@yandex.ru', '+79454548123', 12);
INSERT INTO worker (name_, surname, email, phone, workhours)
VALUES ('Александр', 'Евклидов', 'evklid314@gmail.com', '+79038883145', 7);
INSERT INTO worker (name_, surname, email, phone, workhours)
VALUES ('Эдуард', 'Липкин', 'lipa_edik@rambler.ru', '+79777777777', 7);
INSERT INTO worker (name_, surname, email, phone, workhours)
VALUES ('Ирина', 'Яковенко', 'yakovenko-irina13@yandex.ru', '+79375659553', 8);
INSERT INTO worker (name_, surname, email, phone, workhours)
VALUES ('Василина', 'Мензуркина', 'menzurka_fizik@mail.ru', '+79188137002', 12);
INSERT INTO worker (name_, surname, email, phone, workhours)
VALUES ('Альберт', 'Рафаилевич', 'rafailevich_a@yandex.ru', '+79051870103', 5);

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
VALUES ('yatochk', 'noragami88');
INSERT INTO worker_account (login_, password_)
VALUES ('darkness', 'konosuba11');
INSERT INTO worker_account (login_, password_)
VALUES ('kirito', 'SwordArtOnline');
INSERT INTO worker_account (login_, password_)
VALUES ('boruto', 'narutofiller');
INSERT INTO worker_account (login_, password_)
VALUES ('inori', 'guilty_crown');
INSERT INTO worker_account (login_, password_)
VALUES ('bulbazaur', 'Pokemon34');
INSERT INTO worker_account (login_, password_)
VALUES ('tangiro', 'demon_slayer');

UPDATE worker_account SET workerId = 1 WHERE id = 1;
UPDATE worker_account SET workerId = 2 WHERE id = 2;
UPDATE worker_account SET workerId = 3 WHERE id = 3;
UPDATE worker_account SET workerId = 4 WHERE id = 4;
UPDATE worker_account SET workerId = 5 WHERE id = 5;
UPDATE worker_account SET workerId = 6 WHERE id = 6;
UPDATE worker_account SET workerId = 7 WHERE id = 7;

INSERT INTO category (title, description_)
VALUES ('Периферия', 'Компьютерные мыши, клавиатуры, т.д.');
INSERT INTO category (title, description_)
VALUES ('Аудио', 'Колонки и наушники');
INSERT INTO category (title, description_)
VALUES ('Бытовая техника', 'Холодильники, Стиральные машинки и т.д.');
INSERT INTO category (title, description_)
VALUES ('Гаджеты', 'Телефоны, ноутбуки, планшеты');
INSERT INTO category (title, description_)
VALUES ('Аксессуары', 'Чехлы, поп-сокеты, стекла, ...');

INSERT INTO item (title, price, stock, description_)
VALUES ('Apple MagicMouse', 2900, 300, 'беспроводная копьютерная эргономичная мышь');
INSERT INTO item (title, price, stock, description_)
VALUES ('Marshall major2', 2500, 690, 'Беспроводные накладные наушники');
INSERT INTO item (title, price, stock, description_)
VALUES ('Bosch maxx 4', 27990, 10, 'Стиральная машинка фронтальная');
INSERT INTO item (title, price, stock, description_)
VALUES ('Honor 10i', 12990, 440, 'Смартфон с трипл камерой и nfc');
INSERT INTO item (title, price, stock, description_)
VALUES ('Apple iPhone6 Case', 300, 5000, 'Защитный чехол для iPhone 6');

UPDATE item SET categoryId = 1 WHERE id = 1;
UPDATE item SET categoryId = 2 WHERE id = 2;
UPDATE item SET categoryId = 3 WHERE id = 3;
UPDATE item SET categoryId = 4 WHERE id = 4;
UPDATE item SET categoryId = 5 WHERE id = 5;


INSERT INTO basket DEFAULT VALUES;
INSERT INTO basket DEFAULT VALUES;
INSERT INTO basket DEFAULT VALUES;
INSERT INTO basket DEFAULT VALUES;
INSERT INTO basket DEFAULT VALUES;
INSERT INTO basket DEFAULT VALUES;

UPDATE basket SET itemId = 1 WHERE id = 1;
UPDATE basket SET itemId = 2 WHERE id = 2;
UPDATE basket SET itemId = 4 WHERE id = 3;
UPDATE basket SET itemId = 3 WHERE id = 4;
UPDATE basket SET itemId = 2 WHERE id = 5;
UPDATE basket SET itemId = 1 WHERE id = 6;



INSERT INTO customer (name_, surname,  phone, email)
VALUES ('Роберт', 'Петров', '+79457771005', 'petrov_rob@mail.ru');
INSERT INTO customer (name_, surname,  phone, email)
VALUES ('Жанна', 'Игнатьева', '+79271058814', 'zhanna_d_ark@bk.ru');
INSERT INTO customer (name_, surname,  phone, email)
VALUES ('Дмитрий', 'Федосеев', '+79086833540', 'fedoseev_d@gmail.com');
INSERT INTO customer (name_, surname,  phone, email)
VALUES ('Мирон', 'Разумодько', '+79353560415', 'razumir@yandex.ru');
INSERT INTO customer (name_, surname,  phone, email)
VALUES ('Ева', 'Зеленухина', '+79378757501', 'green_eva@mail.ru');

INSERT INTO customer_account (login_, password_)
VALUES ('eren', 'attack_titan');
INSERT INTO customer_account (login_, password_)
VALUES ('senku', 'Dr. Stone');
INSERT INTO customer_account (login_, password_)
VALUES ('subaru', 'RE:Zero');
INSERT INTO customer_account (login_, password_)
VALUES ('miyamura', 'horimiya');
INSERT INTO customer_account (login_, password_)
VALUES ('Kira', 'Death Note');

UPDATE customer_account SET customerId = 1 WHERE id = 1;
UPDATE customer_account SET customerId = 2 WHERE id = 2;
UPDATE customer_account SET customerId = 3 WHERE id = 3;
UPDATE customer_account SET customerId = 4 WHERE id = 4;

INSERT INTO order_table DEFAULT VALUES;
INSERT INTO order_table DEFAULT VALUES;
INSERT INTO order_table DEFAULT VALUES;
INSERT INTO order_table DEFAULT VALUES;
INSERT INTO order_table DEFAULT VALUES;
INSERT INTO order_table DEFAULT VALUES;


UPDATE order_table SET basketId = 2 WHERE id = 1;
UPDATE order_table SET basketId = 1 WHERE id = 2;
UPDATE order_table SET basketId = 5 WHERE id = 3;
UPDATE order_table SET basketId = 3 WHERE id = 4;
UPDATE order_table SET basketId = 4 WHERE id = 5;
UPDATE order_table SET basketId = 6 WHERE id = 6;
UPDATE order_table SET customerId = 1 WHERE id = 1;
UPDATE order_table SET customerId = 2 WHERE id = 2;
UPDATE order_table SET customerId = 3 WHERE id = 3;
UPDATE order_table SET customerId = 4 WHERE id = 4;
UPDATE order_table SET customerId = 2 WHERE id = 5;
UPDATE order_table SET customerId = 2 WHERE id = 6;
UPDATE order_table SET workerId = 4 WHERE id = 1;
UPDATE order_table SET workerId = 3 WHERE id = 2;
UPDATE order_table SET workerId = 2 WHERE id = 3;
UPDATE order_table SET workerId = 6 WHERE id = 4;
UPDATE order_table SET workerId = 2 WHERE id = 5;
UPDATE order_table SET workerId = 5 WHERE id = 6;


select title from item inner join basket on item.id = basket.itemId where basket.id in (select basketId from order_table where customerId in (select id from customer where name_ = 'Роберт' and surname = 'Петров'));
select * from worker inner join position on worker.positionId = position.id where workhours < 7 and hour_salary > 300;
Create view goods_cheaper_3000 as select * from item where price < 3000;
Create view customer_emails as select email from customer where id in (select customerId from order_table inner join basket on basket.id = order_table.basketid where itemId in (select id from item where categoryId in (select id from category where title = 'Гаджеты')));



ccreate or replace procedure changePrice(
item_name VARCHAR(45),
new_price INT
)
language plpgsql
as $$
begin

update item set price = new_price where title = item_name;

end;
$$

call changePrice('Honor 10i', 13990);

CREATE OR REPLACE FUNCTION deletion() RETURNS TRIGGER AS $$
begin 
	delete from worker where
	worker_account.id = OLD.id;
end;
$$ LANGUAGE plpgsql;

create trigger after_delete_worker_account 
after delete on worker_account
for each row 
execute procedure deletion();


