CREATE TABLE Ride(
        rid char(9) PRIMARY KEY NOT NULL,
        startlatitude DOUBLE NOT NULL,
        startlongitude DOUBLE NOT NULL,
        destinationlatitude DOUBLE,
        destinationlongitude DOUBLE,
        starttime TIMESTAMP NOT NULL,
        endtime TIMESTAMP,
        price DOUBLE
);

CREATE TABLE Car (
        cid char(9) PRIMARY KEY NOT NULL,
        chargePercentage decimal(3,0) check (chargePercentage between 0 and 100) NOT NULL,
        model varchar(20) NOT NULL,
        color varchar(10) NOT NULL,
        class varchar(7) check (class in ('small','big','limo','luxury')) NOT NULL,
        latitude DOUBLE NOT NULL,
        longitude DOUBLE NOT NULL,
        status varchar(10) check (status in ('busy','available','repairing')) with default 'available' NOT NULL
);

CREATE TABLE InsurancePackage (
        ipid char(9) PRIMARY KEY NOT NULL,
        type varchar(20) NOT NULL,
        startDate DATE NOT NULL,
        endDate DATE NOT NULL,
        cost DOUBLE NOT NULL,
        insuranceCompany varchar(20) NOT NULL
);

CREATE TABLE Employee (
        eid char(9) PRIMARY KEY NOT NULL,
        name varchar(50) NOT NULL,
        salary DOUBLE NOT NULL,
        responsibilities varchar(200)
);

CREATE TABLE Station (
        latitude DOUBLE NOT NULL,
        longitude DOUBLE NOT NULL,
        PRIMARY KEY (latitude, longitude)
);

CREATE TABLE ParkingStation (
        latitude DOUBLE NOT NULL,
        longitude DOUBLE NOT NULL,
        FOREIGN KEY (latitude, longitude) REFERENCES Station,
        PRIMARY KEY (latitude, longitude)
);

CREATE TABLE ChargingStation (
        status varchar(10) check (status in ('busy','available')) with default 'available' NOT NULL,
        latitude DOUBLE NOT NULL,
        longitude DOUBLE NOT NULL,
        FOREIGN KEY (latitude,longitude) REFERENCES Station,
        PRIMARY KEY (latitude, longitude)
);

CREATE TABLE ParkingSpot (
        pNumber INTEGER NOT NULL,
        class varchar(7) check (class in ('small','big','limo','luxury')),
        latitude DOUBLE NOT NULL,
        longitude DOUBLE NOT NULL,
        FOREIGN KEY (latitude, longitude) REFERENCES ParkingStation,
        PRIMARY KEY (latitude, longitude, pNumber)
);

CREATE TABLE CreditCard (
        ccNumber INTEGER PRIMARY KEY NOT NULL,
        expirationDate DATE NOT NULL,
        CVV SMALLINT NOT NULL,
        cardHolderName varchar(50) NOT NULl,
        billingAddress varchar(100) NOT NULL
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
        email varchar(100) NOT NULL UNIQUE,
        profilePicture BLOB,
        ccNumber INTEGER NOT NULL,
        FOREIGN KEY (ccNumber) REFERENCES CreditCard
);

