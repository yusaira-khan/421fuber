drop table take_ride;
CREATE TABLE Take_Ride (
        rid INTEGER NOT NULL,
        uid INTEGER NOT NULL,
        FOREIGN KEY (rid) REFERENCES Ride,
        FOREIGN KEY (uid) REFERENCES User,
        PRIMARY KEY (rid, uid),
        RideRequestInfo XML Not Null
);


INSERT INTO Take_Ride (rid, uid,RideRequestInfo)
VALUES(1, 2, '<session><source users="1" space_left="1">initiator</source><time_accepted>10:00</time_accepted><date>12-12-2012</date><uid>2</uid></session>');

INSERT INTO Take_Ride (rid, uid,RideRequestInfo)
VALUES(2, 1, '<session><source users="1" space_left="3">initiator</source> <time_accepted>11:00</time_accepted><date>12-12-2012</date><uid>2</uid></session>');

INSERT INTO Take_Ride (rid, uid,RideRequestInfo)
VALUES(2, 3, '<session><source users="2" space_left="2">splitter</source> <time_accepted>11:05</time_accepted><date>12-12-2012</date><uid>2</uid></session>');

INSERT INTO Take_Ride (rid, uid,RideRequestInfo)
VALUES(3, 5, '<session><source users="1" space_left="3">initiator</source> <time_accepted>12:00</time_accepted><date>12-12-2012</date><uid>2</uid></session>');

INSERT INTO Take_Ride (rid, uid,RideRequestInfo)
VALUES(4, 4, '<session><source users="1" space_left="1">initiator</source> <time_accepted>12:00</time_accepted><date>12-12-2012</date><uid>2</uid></session>');

INSERT INTO Take_Ride (rid, uid,RideRequestInfo)
VALUES(4, 2, '<session><source users="2" space_left="0">splitter</source> <time_accepted>12:05</time_accepted><date>12-12-2012</date><uid>2</uid></session>');

INSERT INTO Take_Ride (rid, uid,RideRequestInfo)
VALUES(5, 3, '<session><source users="1" space_left="1">initiator</source> <time_accepted>13:00</time_accepted><date>12-12-2012</date><uid>2</uid></session>');

select * from Take_Ride;

SELECT XMLQUERY ('for $d in $doc/session return <splitter_uid>$d/uid</splitter_uid>' passing RideRequestInfo  'doc')
FROM Take_Ride m WHERE XMLEXISTS ('$doc/session[source="splitter"]' passing m.RideRequestInfo as 'doc');