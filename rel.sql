CREATE TABLE On_Ride (
        rid char(9) PRIMARY KEY NOT NULL,
        cid char(9) NOT NULL,
        FOREIGN KEY (rid) REFERENCES Ride,
        FOREIGN KEY (cid) REFERENCES Car
);

CREATE TABLE Subscribe (
        uid char(9),
        subsNumber INTEGER PRIMARY KEY NOT NULL,
        FOREIGN KEY (uid) REFERENCES User,
        FOREIGN KEY (subsNumber) REFERENCES Subscription
);

CREATE TABLE Take_Ride (
        rid char(9) NOT NULL,
        uid char(9) NOT NULL,
        FOREIGN KEY (rid) REFERENCES Ride,
        FOREIGN KEY (uid) REFERENCES User,
        PRIMARY KEY (rid, uid) 
);

CREATE TABLE Insure (
        ipid char(9) NOT NULL,
        cid char(9) NOT NULL,
        FOREIGN KEY (cid) REFERENCES Car,
        FOREIGN KEY (ipid) REFERENCES InsurancePackage,
        PRIMARY KEY (ipid, cid)
);

CREATE TABLE Park_At (
        cid char(9),
        pNumber INTEGER NOT NULL,
        latitude DOUBLE,
        longitude DOUBLE,
        FOREIGN KEY (latitude, longitude) REFERENCES ParkingStation,
        FOREIGN KEY (latitude, longitude, pNumber) REFERENCES ParkingSpot,
        FOREIGN KEY (cid) REFERENCES Car 
);

CREATE TABLE charge (
        chargeNumber INTEGER PRIMARY KEY NOT NULL,
        cid char(9) NOT NULL,
        sid char(9) NOT NULL,
        FOREIGN KEY (sid) REFERENCES ChargingStation,
        FOREIGN KEY (cid) REFERENCES Car
);

CREATE TABLE manage (
        eid char(9) PRIMARY KEY NOT NULL,
        latitude DOUBLE,
        longitude DOUBLE,
        FOREIGN KEY (latitude, longitude) REFERENCES Station,
        FOREIGN KEY (eid) REFERENCES Employee
);