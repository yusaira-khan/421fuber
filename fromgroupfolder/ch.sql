CREATE TABLE charge (
        chargeNumber INTEGER PRIMARY KEY NOT NULL,
        cid char(9) NOT NULL,
        sid char(9) NOT NULL,
        startTime TIMESTAMP NOT NULL,
        FOREIGN KEY (sid) REFERENCES ChargingStation,
        FOREIGN KEY (cid) REFERENCES Car
);
