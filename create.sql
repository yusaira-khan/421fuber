CREATE TABLE Ride(
        rid char(9) PRIMARY KEY NOT NULL,
        startLatitude DOUBLE NOT NULL,
        startLongitude DOUBLE NOT NULL,
        destinationLatitude DOUBLE,
        destinationLongitude DOUBLE,
        startTime TIMESTAMP NOT NULL,
        endTime TIMESTAMP,
        price DOUBLE,
        cid char(9),
        FOREIGN KEY(cid) REFERENCES Car 
);

CREATE TABLE Car (
        cid char(9) PRIMARY KEY NOT NULL,
        chargePercentage decimal(3,0) check (chargePercentage between 0 and 100) NOT NULL,
        model varchar(20) NOT NULL,
        color varchar(10) NOT NULL,
        class varchar(7) check (class in ('small','big','limo','luxury')) NOT NULL,
        latitude DOUBLE NOT NULL,
        longitude DOUBLE NOT NULL,
        status varchar(10) check (status in ('busy','available')) with default 'available' NOT NULL
);

CREATE TABLE InsurancePackage (
        ipid char(9) PRIMARY KEY NOT NULL,
        type varchar(7) check (type in ('small','big','limo','luxury')) NOT NULL,
        startDate DATE NOT NULL,
        endDate DATE NOT NULL,
        cost DOUBLE NOT NULL,
        insuranceCompany varchar(50) NOT NULL
);

CREATE TABLE Employee (
        eid char(9) PRIMARY KEY NOT NULL,
        name varchar(50) NOT NULL,
        salary DOUBLE NOT NULL,
        responsibilities varchar(200) NOT NULL
);

CREATE TABLE Station (
        sid char(9) PRIMARY KEY NOT NULL,
        latitude DOUBLE NOT NULL,
        longitude DOUBLE NOT NULL
);

CREATE TABLE ParkingStation (
        sid char(9) PRIMARY KEY NOT NULL,
        latitude DOUBLE NOT NULL,
        longitude DOUBLE NOT NULL,
        FOREIGN KEY (sid) REFERENCES Station
);

CREATE TABLE ChargingStation (
        sid char(9) PRIMARY KEY NOT NULL,
        status varchar(10) check (status in ('busy','available')) with default 'available' NOT NULL,
        latitude DOUBLE NOT NULL,
        longitude DOUBLE NOT NULL,
        FOREIGN KEY (sid) REFERENCES Station
);

CREATE TABLE ParkingSpot (
        pNumber char(7) NOT NULL,
        class varchar(7) check (class in ('small','big','limo','luxury')) NOT NULL,
        sid char(9) NOT NULL,
        status varchar(10) check (status in ('busy','available')) with default 'available' NOT NULL,
        FOREIGN KEY (sid) REFERENCES ParkingStation,
        PRIMARY KEY (sid, pNumber)
);

CREATE TABLE CreditCard (
        ccNumber char(16) PRIMARY KEY NOT NULL,
        expirationDate DATE NOT NULL,
        CVV SMALLINT NOT NULL,
        cardHolderName varchar(50) NOT NULl,
        billingAddress varchar(100) NOT NULL,
        validity varchar(8) check (validity in ('valid','invalid')) with default 'valid'
);

CREATE TABLE Subscription (
        subsNumber INTEGER PRIMARY KEY NOT NULL,
        monthlyPrice DOUBLE NOT NULL,
        class varchar(7) check (class in ('small','big','limo','luxury')),
        startDate DATE NOT NULL,
        endDate DATE NOT NULL,
        uid char(9) NOT NULL,
        FOREIGN KEY (uid) REFERENCES User
);

CREATE TABLE User (
        uid char(9) PRIMARY KEY NOT NULL,
        name varchar(50) NOT NULL,
        email varchar(10)0 NOT NULL UNIQUE,
        ccNumber INTEGER NOT NULL,
        FOREIGN KEY (ccNumber) REFERENCES CreditCard
);

CREATE TABLE CarInfo (
        class varchar(7) PRIMARY KEY check (class in ('small','big','limo','luxury')) NOT NULL,
        basePrice DOUBLE check (basePrice > 0)
        duration TIME check (duration > 0)
);