Drop TABLE Ride;
CREATE TABLE Ride(
        rid  integer  PRIMARY KEY  not null GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
        startLatitude DOUBLE NOT NULL,
        startLongitude DOUBLE NOT NULL,
        destinationLatitude DOUBLE,
        destinationLongitude DOUBLE,
        startTime TIMESTAMP,
        endTime TIMESTAMP,
        price DOUBLE,
        cid integer,
        FOREIGN KEY(cid) REFERENCES Car 
);
Drop TABLE Car ;
CREATE TABLE Car (
        cid integer  PRIMARY KEY  not null GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
        chargePercentage decimal(3,0) check (chargePercentage between 0 and 100) NOT NULL,
        model varchar(20) NOT NULL,
        color varchar(10) NOT NULL,
        class varchar(7) NOT NULL,
        latitude DOUBLE NOT NULL,
        longitude DOUBLE NOT NULL,
        status varchar(10) check (status in ('busy','available','repairing')) with default 'available' NOT NULL,
        FOREIGN Key(class ) REFERENCES CarClassInfo
);
Drop TABLE InsurancePackage;
CREATE TABLE InsurancePackage (
        ipid integer  PRIMARY KEY  not null GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
        class varchar(7) NOT NULL,
        startDate DATE NOT NULL,
        endDate DATE NOT NULL,
        cost DOUBLE NOT NULL,
        insuranceCompany varchar(50) NOT NULL
);
Drop TABLE Employee;
CREATE TABLE Employee (
        eid integer  PRIMARY KEY  not null GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
        name varchar(50) NOT NULL,
        salary DOUBLE NOT NULL,
        responsibilities varchar(200) NOT NULL
);
Drop TABLE Station;
CREATE TABLE Station (
        sid integer  PRIMARY KEY  not null GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
        latitude DOUBLE NOT NULL,
        longitude DOUBLE NOT NULL
);
Drop TABLE ParkingStation;
CREATE TABLE ParkingStation (
        sid integer PRIMARY KEY NOT NULL,
        latitude DOUBLE NOT NULL,
        longitude DOUBLE NOT NULL,
        FOREIGN KEY (sid) REFERENCES Station
);
Drop TABLE ChargingStation ;
CREATE TABLE ChargingStation (
        sid integer PRIMARY KEY NOT NULL,
        status varchar(10) check (status in ('busy','available')) with default 'available' NOT NULL,
        latitude DOUBLE NOT NULL,
        longitude DOUBLE NOT NULL,
        FOREIGN KEY (sid) REFERENCES Station
);
Drop TABLE ParkingSpot;
CREATE TABLE ParkingSpot (
        pNumber integer PRIMARY KEY  not null GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
        class varchar(7) NOT NULL,
        sid integer  PRIMARY KEY NOT NULL,
        status varchar(10) check (status in ('busy','available')) with default 'available' NOT NULL,
        FOREIGN KEY (sid) REFERENCES ParkingStation,
        PRIMARY KEY (sid, pNumber),
        FOREIGN Key(class ) REFERENCES CarClassInfo
);
Drop TABLE CreditCard
CREATE TABLE CreditCard (
        ccNumber char(16) PRIMARY KEY NOT NULL,
        expirationDate DATE NOT NULL,
        CVV SMALLINT NOT NULL,
        cardHolderName varchar(50) NOT NULl,
        billingAddress varchar(100) NOT NULL,
        validity varchar(8) check (validity in ('valid','invalid')) with default 'valid'
);
Drop TABLE Subscription
CREATE TABLE Subscription (
        subsNumber integer PRIMARY KEY  not null GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
        monthlyPrice DOUBLE NOT NULL,
        class varchar(7),
        startDate DATE NOT NULL,
        endDate DATE NOT NULL,
        uid integer NOT NULL,
        FOREIGN KEY (uid) REFERENCES User,
        FOREIGN Key(class ) REFERENCES CarClassInfo
);
Drop TABLE User;
CREATE TABLE User (
        uid integer PRIMARY KEY  not null GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
        name varchar(50) NOT NULL,
        email varchar(10) NOT NULL UNIQUE,
        ccNumber char(16) NOT NULL,
        FOREIGN KEY (ccNumber) REFERENCES CreditCard
);
Drop TABLE CarClassInfo; 
CREATE TABLE CarClassInfo (
        class varchar(7) PRIMARY KEY check (class in ('small','big','limo','luxury')) NOT NULL,
        basePrice DOUBLE check (basePrice > 0),
        kmPrice Double check (kmPrice > 0),
        minutePrice Double check (minutePrice > 0),
        duration TIME check (duration > 0)
);