drop table if exists room cascade;
drop table if exists reservation cascade;
drop table if exists list_transfers cascade;
drop table if exists person cascade;
drop table if exists transfer_ cascade;
drop table if exists meal_catering cascade;
drop table if exists meal cascade;
drop table if exists catering cascade;
drop table if exists payment cascade;
drop table if exists hotel cascade;
drop table if exists room_cleaning cascade;
drop table if exists maid cascade;

create table maid (
    id Serial not null PRIMARY key,
    name_ varchar (16),
    surname VARCHAR (16),
    patronymic VARCHAR (16),
    salary INT
);

 create table room_cleaning (
     id Serial not null PRIMARY key,
     type_ varchar (128),
     frequency VARCHAR(16),
     maidId INT,
     foreign key (maidId) references maid(id)
 ); 

create TABLE hotel (
    id Serial not null PRIMARY key,
    name_ VARCHAR (32),
    phone varchar (16),
    address_ varchar (128),
    star_rating INT
);

create table payment (
    id Serial not null PRIMARY key,
    amount DECIMAL,
    type_ varchar (16),
    time_ timestamp without time zone
);

create table catering (
    id Serial not null PRIMARY key,
    name_ varchar (32),
    type_ varchar (16) 
);

create table meal (
    id Serial not null PRIMARY key,
    type_ varchar (16),
    eating varchar (32)
);

create table meal_catering (
    id Serial not null PRIMARY key,
    mealid INT,
    foreign key (mealid) references meal(id),
    cateringid INT,
    foreign key (cateringid) references catering(id)
);

create table transfer_ (
    id Serial not null PRIMARY key,
    cost INT,
    whereTo VARCHAR (32),
    fromWhere VARCHAR (32)
);


create table person (
    id Serial not null PRIMARY key,
    surname varchar (16),
    name_ varchar (16),
    patronymic VARCHAR (16),
    phone varchar (16),
    mealId INT,
    foreign key (mealId) references meal_catering(id)
);

create table list_transfers (
    id Serial not null PRIMARY key,
    transferId INT,
    personId INT,
    foreign key (transferId) references transfer_(id),
    foreign key (personId) references person(id)
);

create table reservation (
    id Serial not null PRIMARY key,
    number_of_rooms INT,
    personId INT,
    foreign key (personId) references person(id),
    hotelId INT,
    foreign key (hotelId) references hotel(id),
    paymentId INT,
    foreign key (paymentId) references payment(id)
);

create table room (
    id Serial not null PRIMARY key,
    number INT,
    comfort_level varchar(16),
    cost DECIMAL,
    booking_dates INTERVAL,
    reservationId INT,
    foreign key (reservationId) references reservation(id),
    room_cleaningId INT,
    foreign key (room_cleaningId) references room_cleaning(id)
);

ALTER TABLE person ADD COLUMN roomId INT, ADD foreign key (roomId) references room(id);

INSERT INTO maid(name_, surname, patronymic, salary) 
VALUES ('Василиса', 'Норкова', 'Радионовна', 25000);
INSERT INTO maid(name_, surname, patronymic, salary) 
VALUES ('Мария', 'Иванова', 'Петровна', 25000);
INSERT INTO maid(name_, surname, patronymic, salary) 
VALUES ('Злата', 'Порфирьева', 'Игоревна', 17000);
INSERT INTO maid(name_, surname, patronymic, salary) 
VALUES ('Ирина', 'Залинова', 'Дмитриевна', 17000);

INSERT INTO room_cleaning(type_, frequency) 
VALUES ('мытье полов, смена полотенец и постельного белья, протирание поверхностей', 'ежедневно');
INSERT INTO room_cleaning(type_, frequency) 
VALUES ('мытье полов, смена полотенец и постельного белья, протирание поверхностей', '2 раза в неделю');
INSERT INTO room_cleaning(type_, frequency) 
VALUES ('мытье полов, смена полотенец и постельного белья, протирание поверхностей', 'еженедельно');
INSERT INTO room_cleaning(type_, frequency) 
VALUES ('мытье полов', 'еженедельно');

UPDATE room_cleaning SET maidId = 2 WHERE id = 1;
UPDATE room_cleaning SET maidId = 3 WHERE id = 2;
UPDATE room_cleaning SET maidId = 1 WHERE id = 3;
UPDATE room_cleaning SET maidId = 4 WHERE id = 4;

INSERT INTO hotel(name_, phone, address_, star_rating) 
VALUES ('Норд-вест', '88004977883', 'РФ, г. Москва, ул. Подгорная, 35', 5);
INSERT INTO hotel(name_, phone, address_, star_rating) 
VALUES ('У Ларисы', '88003256601', 'РФ, г. Орёл, пгт Ульяновское, ул. Мира, 5', 3);

INSERT INTO payment(amount, type_, time_)
VALUES (12000, 'Наличные', '2020-08-25 10:27:04');
INSERT INTO payment(amount, type_, time_)
VALUES (80000, 'Безналичный', '2022-07-24 12:44:05');
INSERT INTO payment(amount, type_, time_)
VALUES (32000, 'Безналичный', '2020-09-15 08:07:24');
INSERT INTO payment(amount, type_, time_)
VALUES (16000, 'Наличные', '2020-02-17 15:35:58');

INSERT INTO catering (name_, type_) 
VALUES ('La Belle', 'ресторан');
INSERT INTO catering (name_, type_) 
VALUES ('Exotic Beach', 'кафе');
INSERT INTO catering (name_, type_) 
VALUES ('Family Inc.', 'кафе-бистро');

INSERT INTO meal (type_, eating)
VALUES ('Шведский стол', 'завтрак, обед и ужин');
INSERT INTO meal (type_, eating)
VALUES ('Шведский стол', 'завтрак и ужин');
INSERT INTO meal (type_, eating)
VALUES ('Шведский стол', 'завтрак');
INSERT INTO meal (type_, eating)
VALUES ('Еда по меню', 'завтрак, обед и ужин');
INSERT INTO meal (type_, eating)
VALUES ('Еда по меню', 'обед и ужин');
INSERT INTO meal (type_, eating)
VALUES ('Еда по меню', 'завтрак и ужин');
INSERT INTO meal (type_, eating)
VALUES ('Еда по меню', 'ужин');

INSERT INTO meal_catering DEFAULT VALUES;
INSERT INTO meal_catering DEFAULT VALUES;
INSERT INTO meal_catering DEFAULT VALUES;
INSERT INTO meal_catering DEFAULT VALUES;
INSERT INTO meal_catering DEFAULT VALUES;
INSERT INTO meal_catering DEFAULT VALUES;
INSERT INTO meal_catering DEFAULT VALUES;
INSERT INTO meal_catering DEFAULT VALUES;
INSERT INTO meal_catering DEFAULT VALUES;
INSERT INTO meal_catering DEFAULT VALUES;
INSERT INTO meal_catering DEFAULT VALUES;
INSERT INTO meal_catering DEFAULT VALUES;
INSERT INTO meal_catering DEFAULT VALUES;
UPDATE meal_catering SET mealid = 1 WHERE id = 1;
UPDATE meal_catering SET cateringid = 1 WHERE id = 1;
UPDATE meal_catering SET mealid = 2 WHERE id = 2;
UPDATE meal_catering SET cateringid = 1 WHERE id = 2;
UPDATE meal_catering SET mealid = 3 WHERE id = 3;
UPDATE meal_catering SET cateringid = 1 WHERE id = 3;
UPDATE meal_catering SET mealid = 4 WHERE id = 4;
UPDATE meal_catering SET cateringid = 1 WHERE id = 4;
UPDATE meal_catering SET mealid = 5 WHERE id = 5;
UPDATE meal_catering SET cateringid = 1 WHERE id = 5;
UPDATE meal_catering SET mealid = 6 WHERE id = 6;
UPDATE meal_catering SET cateringid = 1 WHERE id = 6;
UPDATE meal_catering SET mealid = 7 WHERE id = 7;
UPDATE meal_catering SET cateringid = 1 WHERE id = 7;
UPDATE meal_catering SET mealid = 5 WHERE id = 8;
UPDATE meal_catering SET cateringid = 2 WHERE id = 8;
UPDATE meal_catering SET mealid = 7 WHERE id = 9;
UPDATE meal_catering SET cateringid = 2 WHERE id = 9;
UPDATE meal_catering SET mealid = 4 WHERE id = 10;
UPDATE meal_catering SET cateringid = 3 WHERE id = 10;
UPDATE meal_catering SET mealid = 5 WHERE id = 11;
UPDATE meal_catering SET cateringid = 3 WHERE id = 11;
UPDATE meal_catering SET mealid = 6 WHERE id = 12;
UPDATE meal_catering SET cateringid = 3 WHERE id = 12;
UPDATE meal_catering SET mealid = 7 WHERE id = 13;
UPDATE meal_catering SET cateringid = 3 WHERE id = 13;

INSERT INTO transfer_ (cost, whereTo, fromWhere)
VALUES (5000, 'Отель', 'Аэропорт');
INSERT INTO transfer_ (cost, whereTo, fromWhere)
VALUES (5000,'Аэропорт', 'Отель');
INSERT INTO transfer_ (cost, whereTo, fromWhere)
VALUES (800, 'Вокзал', 'Отель');
INSERT INTO transfer_ (cost, whereTo, fromWhere)
VALUES (800, 'Отель', 'Вокзал');

INSERT INTO person (surname, name_, patronymic, phone)
VALUES ('Колбаскин', 'Олег', 'Владимирович', '89356187824');
INSERT INTO person (surname, name_, patronymic, phone)
VALUES ('Нестеренко', 'Марина', 'Сергеевна', '89370609633');
INSERT INTO person (surname, name_, patronymic, phone)
VALUES ('Малышкин', 'Михаил', 'Витальевич', '89376515591');
INSERT INTO person (surname, name_, patronymic, phone)
VALUES ('Колбаскина', 'Ольга', 'Васильевна', '89275000705');
INSERT INTO person (surname, name_, patronymic)
VALUES ('Колбаскин', 'Венеамин', 'Олегович');
INSERT INTO person (surname, name_, patronymic, phone)
VALUES ('Зуев', 'Вадим', 'Алексеевич', '89043590168');
INSERT INTO person (surname, name_, patronymic, phone)
VALUES ('Калова', 'Дарья', 'Александровна', '89455514508');
INSERT INTO person (surname, name_, patronymic, phone)
VALUES ('Альгашев', 'Геннадий', 'Сергеевич', '89350756649');
UPDATE person SET mealId = 10 WHERE id = 1;
UPDATE person SET mealId = 3 WHERE id = 2;
UPDATE person SET mealId = 2 WHERE id = 3;
UPDATE person SET mealId = 11 WHERE id = 4;
UPDATE person SET mealId = 12 WHERE id = 5;
UPDATE person SET mealId = 3 WHERE id = 6;
UPDATE person SET mealId = 6 WHERE id = 7;
UPDATE person SET mealId = 9 WHERE id = 8;

INSERT INTO list_transfers DEFAULT VALUES;
INSERT INTO list_transfers DEFAULT VALUES;
INSERT INTO list_transfers DEFAULT VALUES;
INSERT INTO list_transfers DEFAULT VALUES;

UPDATE list_transfers SET transferid = 1 WHERE id = 1;
UPDATE list_transfers SET personid = 1 WHERE id = 1;
UPDATE list_transfers SET transferid = 1 WHERE id = 2;
UPDATE list_transfers SET personid = 4 WHERE id = 2;
UPDATE list_transfers SET transferid = 1 WHERE id = 3;
UPDATE list_transfers SET personid = 5 WHERE id = 3;

INSERT INTO reservation (number_of_rooms)
VALUES (2);
INSERT INTO reservation (number_of_rooms)
VALUES (1);
INSERT INTO reservation (number_of_rooms)
VALUES (2);
INSERT INTO reservation (number_of_rooms)
VALUES (1);

UPDATE reservation SET personId = 1 WHERE id = 1;
UPDATE reservation SET hotelId = 2 WHERE id = 1;
UPDATE reservation SET paymentId = 1 WHERE id = 1;
UPDATE reservation SET personId = 3 WHERE id = 2;
UPDATE reservation SET hotelid = 1 WHERE id = 2;
UPDATE reservation SET paymentId = 2 WHERE id = 2;
UPDATE reservation SET personId = 6 WHERE id = 3;
UPDATE reservation SET hotelid = 1 WHERE id = 3;
UPDATE reservation SET paymentId = 3 WHERE id = 3;
UPDATE reservation SET personId = 8 WHERE id = 4;
UPDATE reservation SET hotelid = 1 WHERE id = 4;
UPDATE reservation SET paymentId = 4 WHERE id = 4;

INSERT INTO room (comfort_level, cost, booking_dates)
VALUES ('Эконом', 1400, '120:00:00');
INSERT INTO room (comfort_level, cost, booking_dates)
VALUES ('Эконом', 1000, '120:00:00');
INSERT INTO room (comfort_level, cost, booking_dates)
VALUES ('Полулюкс', 20000, '96:00:00');
INSERT INTO room (comfort_level, cost, booking_dates)
VALUES ('Стандарт', 8000, '48:00:00');
INSERT INTO room (comfort_level, cost, booking_dates)
VALUES ('Стандарт', 8000, '48:00:00');
INSERT INTO room (comfort_level, cost, booking_dates)
VALUES ('Эконом', 4000, '96:00:00');

UPDATE room SET reservationId = 1 WHERE id = 1;
UPDATE room SET room_cleaningId = 4 WHERE id = 1;
UPDATE room SET reservationId = 1 WHERE id = 2;
UPDATE room SET room_cleaningId = 4 WHERE id = 2;
UPDATE room SET reservationId = 2 WHERE id = 3;
UPDATE room SET room_cleaningId = 1 WHERE id = 3;
UPDATE room SET reservationId = 3 WHERE id = 4;
UPDATE room SET room_cleaningId = 2 WHERE id = 4;
UPDATE room SET reservationId = 3 WHERE id = 5;
UPDATE room SET room_cleaningId = 2 WHERE id = 5;
UPDATE room SET reservationId = 4 WHERE id = 6;
UPDATE room SET room_cleaningId = 3 WHERE id = 6;

select name_, surname from person where mealId in (select meal_catering.id from meal_catering inner join catering on meal_catering.cateringid = catering.id where catering.name_ = 'La Belle');
select name_ from hotel inner join reservation on reservation.hotelid = hotel.id where personid in (select person.id from person inner join meal_catering on person.mealid = meal_catering.id where meal_catering.cateringid in (select id from catering WHERE type_ = 'ресторан')) group by name_;
select name_, surname from maid inner join room_cleaning on room_cleaning.maidid = maid.id where room_cleaning.id in (select room_cleaningid from room where comfort_level = 'Эконом');
select name_, surname from person inner join reservation on reservation.personid = person.id where reservation.paymentid in (select id from payment where amount < 30000);