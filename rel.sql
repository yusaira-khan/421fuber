drop TABLE On_Ride;
CREATE TABLE On_Ride (
        rid INTEGER PRIMARY KEY NOT NULL,
        cid INTEGER NOT NULL,
        FOREIGN KEY (rid) REFERENCES Ride,
        FOREIGN KEY (cid) REFERENCES Car
);
drop TABLE Subscribe;

CREATE TABLE Subscribe (
        uid INTEGER NOT NULL,
        subsNumber INTEGER PRIMARY KEY NOT NULL,
        FOREIGN KEY (uid) REFERENCES User,
        FOREIGN KEY (subsNumber) REFERENCES Subscription
);
drop TABLE Take_Ride;

CREATE TABLE Take_Ride (
        rid INTEGER NOT NULL,
        uid INTEGER NOT NULL,
        FOREIGN KEY (rid) REFERENCES Ride,
        FOREIGN KEY (uid) REFERENCES User,
        PRIMARY KEY (rid, uid) 
);
drop TABLE Insure;
CREATE TABLE Insure (
        ipid INTEGER NOT NULL,
        cid INTEGER NOT NULL,
        FOREIGN KEY (cid) REFERENCES Car,
        FOREIGN KEY (ipid) REFERENCES InsurancePackage,
        PRIMARY KEY (ipid, cid)
);
drop TABLE Park_At;
CREATE TABLE Park_At (
        cid INTEGER,
        pNumber INTEGER NOT NULL,
        sid INTEGER NOT NULL,
        FOREIGN KEY (sid,pNumber) REFERENCES ParkingSpot,
        FOREIGN KEY (cid) REFERENCES Car 
);
drop TABLE charge;

CREATE TABLE charge (
        chargeNumber INTEGER PRIMARY KEY  not null GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
        cid INTEGER NOT NULL,
        sid INTEGER NOT NULL,
        FOREIGN KEY (sid) REFERENCES ChargingStation,
        FOREIGN KEY (cid) REFERENCES Car
);
drop TABLE manage;

CREATE TABLE manage (
        eid INTEGER PRIMARY KEY NOT NULL,
        sid INTEGER NOT NULL,
        FOREIGN KEY (sid) REFERENCES ParkingStation,
        FOREIGN KEY (eid) REFERENCES Employee
);