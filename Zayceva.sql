DROP TABLE IF EXISTS Counts;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS ListMedicines;
DROP TABLE IF EXISTS Deliveries;
DROP TABLE IF EXISTS Clients;
DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Providers;
DROP TABLE IF EXISTS Medicines;

CREATE TABLE Medicines (
    MedicineId SERIAL NOT NULL PRIMARY KEY,
    MedicineName VARCHAR(100),
    Price DECIMAL(19, 2),
    Manufacturer VARCHAR(50),
    MedicineStatus VARCHAR(50)
);

CREATE TABLE Providers (
    ProviderId SERIAL NOT NULL PRIMARY KEY,
    ProviderName VARCHAR(100),
    Phone VARCHAR(20),
    ProviderAddress VARCHAR(50)
);

CREATE TABLE Deliveries (
    DeliveryId SERIAL NOT NULL PRIMARY KEY,
    DeliveryDate DATE,
    ProviderId INT,
    FOREIGN KEY(ProviderId) REFERENCES Providers(ProviderId)
);

CREATE TABLE ListMedicines (
    DeliveryId INT,
    MedicineID INT,
    MedicineCount INT,
    Price DECIMAL(19, 2),
    PRIMARY KEY(DeliveryId, MedicineId),
    FOREIGN KEY(DeliveryId) REFERENCES Deliveries(DeliveryId),
    FOREIGN KEY(MedicineID) REFERENCES Medicines(MedicineID)
);

CREATE TABLE Employees(
    EmployeeId SERIAL NOT NULL PRIMARY KEY,
    SurName VARCHAR(50),
    FirstName VARCHAR(50),
    ParentName VARCHAR(50),
    Phone VARCHAR(30),
    EmployeePassword VARCHAR(20),
    Salary DECIMAL(19, 2)
);

CREATE TABLE Clients(
    ClientId SERIAL NOT NULL PRIMARY KEY,
    Phone VARCHAR(50),
    Email VARCHAR(50),
    Bonus VARCHAR(50)
);

CREATE TABLE Orders(
    OrderId SERIAL NOT NULL PRIMARY KEY,
    OrderDate DATE,
    OrderSum DECIMAL(19, 2),
    EmployeeId INT,
    ClientId INT,
    FOREIGN KEY(ClientId) REFERENCES Clients(ClientId),
    FOREIGN KEY(EmployeeId) REFERENCES Employees(EmployeeId)
);

CREATE TABLE Counts(
    OrderId INT,
    MedicineId INT,
    Count_ INT,
    PRIMARY KEY(OrderId, MedicineId),
    FOREIGN KEY(OrderId) REFERENCES Orders(OrderId),
    FOREIGN KEY(MedicineId) REFERENCES Medicines(MedicineId)
);

INSERT INTO Clients (Phone, Email, Bonus)
VALUES ("+79435680102", "myloIvan@rambler.ru", "5%");
INSERT INTO Clients (Phone, Email, Bonus)
VALUES ("+79642570496", "mandarinchik168@mail.ru", "0%");
INSERT INTO Clients (Phone, Email, Bonus)
VALUES ("+79270947230", "vasilisa_s@gmail.com", "3%");
INSERT INTO Clients (Phone, Email, Bonus)
VALUES ("+79865409454", "Penguin_RS@yandex.ru", "10%");

INSERT INTO Employees (SurName, FirstName, ParentName, Phone, EmployeePassword, Salary)
VALUES ("Булавин", "Алексей", "Викторович", "+79876437954", "UlitkA25", 15000);
INSERT INTO Employees (SurName, FirstName, ParentName, Phone, EmployeePassword, Salary)
VALUES ("Каргиевич", "Жанна", "Павловна", "+79993454481", "Kamenuha48", 32000);
INSERT INTO Employees (SurName, FirstName, ParentName, Phone, EmployeePassword, Salary)
VALUES ("Вторников", "Игнатий", "Дамирович", "+79378194388", "Travinka111", 20000);
INSERT INTO Employees (SurName, FirstName, ParentName, Phone, EmployeePassword, Salary)
VALUES ("Краюхов", "Денис", "Валерьевич", "+79891436485", "Gryaz89", 50000);

INSERT INTO Medicines (MedicineName, Price, Manufacturer, MedicineStatus)
VALUES ("Дезлоратадин", 210, "Велфарм", "В наличии");
INSERT INTO Medicines (MedicineName, Price, Manufacturer, MedicineStatus)
VALUES ("Супрастинекс", 500, "EGIS", "Отсутствует");
INSERT INTO Medicines (MedicineName, Price, Manufacturer, MedicineStatus)
VALUES ("Блогир-3", 400, "BELUPO", "В наличии");
INSERT INTO Medicines (MedicineName, Price, Manufacturer, MedicineStatus)
VALUES ("Супрастин", 150, "EGIS", "В наличии");

INSERT INTO Providers (ProviderName, Phone, ProviderAddress)
VALUES ("Вита Лайн", "3522486005", "Россия-Курган-Пушкина-11");
INSERT INTO Providers (ProviderName, Phone, ProviderAddress)
VALUES ("Иннолек", "+74956538199", "Россия-Москва-Пресн. Набережная-6");
INSERT INTO Providers (ProviderName, Phone, ProviderAddress)
VALUES ("Русофарм", "4991295100", "Россия-Москва-Цюрупы-3");
INSERT INTO Providers (ProviderName, Phone, ProviderAddress)
VALUES ("Фармсинтез", "8123298084", "Россия-Санкт-Петербург-Энгельса-150");

INSERT INTO Deliveries(DeliveryDate) VALUES ("2021-06-01");
INSERT INTO Deliveries(DeliveryDate) VALUES ("2021-06-04");
INSERT INTO Deliveries(DeliveryDate) VALUES ("2021-07-07");
INSERT INTO Deliveries(DeliveryDate) VALUES ("2021-06-21");

INSERT INTO Orders(OrderDate, OrderSum)
VALUES ("2021-05-28", 1300);
INSERT INTO Orders(OrderDate, OrderSum)
VALUES ("2021-05-30", 150);
INSERT INTO Orders(OrderDate, OrderSum)
VALUES ("2021-05-14", 12000);
INSERT INTO Orders(OrderDate, OrderSum)
VALUES ("2021-05-24", 500);

INSERT INTO ListMedicines(MedicineCount, Price)
VALUES (2, 420);
INSERT INTO ListMedicines(MedicineCount, Price)
VALUES (5, 2000);
INSERT INTO ListMedicines(MedicineCount, Price)
VALUES (1, 500);
INSERT INTO ListMedicines(MedicineCount, Price)
VALUES (10, 1500);

INSERT INTO Counts(Count_) VALUES (5);
INSERT INTO Counts(Count_) VALUES (7);
INSERT INTO Counts(Count_) VALUES (3); 
INSERT INTO Counts(Count_) VALUES (9);