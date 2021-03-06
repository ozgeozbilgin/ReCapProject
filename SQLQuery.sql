﻿CREATE TABLE Colors(
	ColorId INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	ColorName NVARCHAR (50) NOT NULL,
);

CREATE TABLE Brands(
	BrandId INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	BrandName NVARCHAR (50) NOT NULL,
);

CREATE TABLE Cars(
	CarID INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	BrandId INT NOT NULL,
	ColorId INT NOT NULL,
	ModelYear INT NOT NULL,
	DailyPrice DECIMAL NOT NULL,
	Descriptions NTEXT NULL,
	FOREIGN KEY (ColorID) REFERENCES Colors(ColorID),
	FOREIGN KEY (BrandID) REFERENCES Brands(BrandID)
);

CREATE TABLE Users(
    Id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    FirstName NVARCHAR (100) NOT NULL,
    LastName NVARCHAR (100) NOT NULL,
    Email NVARCHAR (100) UNIQUE NOT NULL,
    PasswordSalt BINARY(128) NOT NULL,
    PasswordHash BINARY(128) NOT NULL,
    Status BIT NOT NULL
);

CREATE TABLE Customers(
    Id INT PRIMARY KEY IDENTITY (1, 1) NOT NULL,
    UserId INT UNIQUE NOT NULL,
    CompanyName NVARCHAR (100) NOT NULL,
    FOREIGN KEY (UserId) REFERENCES Users(Id)
);

CREATE TABLE Rentals(
    Id INT PRIMARY KEY IDENTITY (1, 1) NOT NULL,
    CarId INT  NOT NULL,
    CustomerId INT  NOT NULL,
    RentDate DATE NOT NULL,
    ReturnDate DATE NULL,
    FOREIGN KEY (CarId) REFERENCES Cars(Id),
    FOREIGN KEY (CustomerId) REFERENCES Customers(UserId)
);

CREATE TABLE CarImages(
    Id INT PRIMARY KEY IDENTITY (1, 1) NOT NULL,
    CarId INT,
    ImagePath NVARCHAR(MAX),
    Date DATE,
);
CREATE TABLE UserOperationsClaims(
    Id INT PRIMARY KEY IDENTITY (1, 1) NOT NULL,
    UserId INT NOT NULL,
    OperationClaimId INT NOT NULL,
);
CREATE TABLE OperationsClaims(
    Id INT PRIMARY KEY IDENTITY (1, 1) NOT NULL,
    Name VARCHAR(250) NOT NULL,
);
