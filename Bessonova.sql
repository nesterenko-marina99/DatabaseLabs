create table maid (
    id Serial not null PRIMARY key,
    name_ varchar (16),
    surname VARCHAR (16),
    patronymic VARCHAR (16),
    salary INT
);

create TABLE hotel (
    id Serial not null PRIMARY key,
    name_ VARCHAR (32),
    phone varchar (16),
    address_ varchar (128),
    star_rating INT
);

create table catering (
    id Serial not null PRIMARY key,
    name_ varchar (32),
    type_ varchar (16) 
);

create table meal (
    id Serial not null PRIMARY key,
    type_ varchar (16),
    number_of_meals INT,
    foreign key (cateringId) references catering(id)
);

create table person (
    id Serial not null PRIMARY key,
    surname varchar (16),
    name_ varchar (16),
    patronymic VARCHAR (16),
    phone varchar (16),
    payment_detail VARCHAR (32),
    foreign key (mealId) references meal(id)
);