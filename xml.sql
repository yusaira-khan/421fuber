
CREATE TABLE Take_Ride (
        rid INTEGER NOT NULL,
        uid INTEGER NOT NULL,
        FOREIGN KEY (rid) REFERENCES Ride,
        FOREIGN KEY (uid) REFERENCES User,
        PRIMARY KEY (rid, uid) 
        RequestInfo XML Not Null,
);


INSERT INTO Take_Ride (rid, uid,RequestInfo)
VALUES(1, 2, "<session><source users=1>initiator</source> <time_accepted>10:00</time_accepted></session>");

INSERT INTO Take_Ride (rid, uid)
VALUES(2, 1, "<session><source users=1>initiator</source> <time_accepted>10:00</time_accepted></session>");

INSERT INTO Take_Ride (rid, uid)
VALUES(2, 3, "<session><source users=2>splitter</source> <time_accepted>10:00</time_accepted></session>");

INSERT INTO Take_Ride (rid, uid)
VALUES(3, 5, "<session><source users=1>initiator</source> <time_accepted>10:00</time_accepted></session>");

INSERT INTO Take_Ride (rid, uid)
VALUES(4, 4, "<session><source users=1>initiator</source> <time_accepted>10:00</time_accepted></session>");

INSERT INTO Take_Ride (rid, uid)
VALUES(4, 2, "<session><source users=2>splitter</source> <time_accepted>10:00</time_accepted></session>");

INSERT INTO Take_Ride (rid, uid)
VALUES(5, 3, "<session><source users=1>initiator</source> <time_accepted>10:00</time_accepted></session>");
