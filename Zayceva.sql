DROP TABLE IF EXISTS Counts;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS ListMedicines;
DROP TABLE IF EXISTS Deliveries;
DROP TABLE IF EXISTS Clients;
DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Providers;
DROP TABLE IF EXISTS Medicines;

CREATE TABLE Medicines (
    MedicineId INT PRIMARY KEY,
    MedicineName VARCHAR(100),
    Price DECIMAL(19, 2),
    Manufacturer VARCHAR(50),
    MedicineStatus VARCHAR(50)
);

CREATE TABLE Providers (
    ProviderId INT PRIMARY KEY,
    ProviderName VARCHAR(100),
    Phone VARCHAR(20),
    ProviderAddress VARCHAR(50)
);

CREATE TABLE Deliveries (
    DeliveryId INT PRIMARY KEY,
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
    EmployeeId INT PRIMARY KEY,
    SurName VARCHAR(50),
    FirstName VARCHAR(50),
    ParentName VARCHAR(50),
    Phone VARCHAR(30),
    EmployeePassword VARCHAR(20),
    Salary DECIMAL(19, 2)
);

CREATE TABLE Clients(
    ClientId INT PRIMARY KEY,
    Phone VARCHAR(50),
    Email VARCHAR(50),
    Bonus VARCHAR(50)
);

CREATE TABLE Orders(
    OrderId INT PRIMARY KEY,
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

INSERT INTO Clients VALUES ();
INSERT INTO Clients VALUES ();
INSERT INTO Clients VALUES ();
INSERT INTO Clients VALUES ();

INSERT INTO Employees VALUES ();
INSERT INTO Employees VALUES ();
INSERT INTO Employees VALUES ();
INSERT INTO Employees VALUES ();

INSERT INTO Medicines VALUES ();
INSERT INTO Medicines VALUES ();
INSERT INTO Medicines VALUES ();
INSERT INTO Medicines VALUES ();

INSERT INTO Providers VALUES ();
INSERT INTO Providers VALUES ();
INSERT INTO Providers VALUES ();
INSERT INTO Providers VALUES ();

INSERT INTO Deliveries VALUES ();
INSERT INTO Deliveries VALUES ();
INSERT INTO Deliveries VALUES ();
INSERT INTO Deliveries VALUES ();

INSERT INTO Orders VALUES ();
INSERT INTO Orders VALUES ();
INSERT INTO Orders VALUES ();
INSERT INTO Orders VALUES ();

INSERT INTO ListMedicines VALUES ();
INSERT INTO ListMedicines VALUES ();
INSERT INTO ListMedicines VALUES ();
INSERT INTO ListMedicines VALUES ();

INSERT INTO Counts VALUES ();
INSERT INTO Counts VALUES ();
INSERT INTO Counts VALUES (); 
INSERT INTO Counts VALUES ();