drop table take_ride;
CREATE TABLE Take_Ride (
        rid INTEGER NOT NULL,
        uid INTEGER NOT NULL,
        FOREIGN KEY (rid) REFERENCES Ride,
        FOREIGN KEY (uid) REFERENCES User,
        PRIMARY KEY (rid, uid),
        INFO XML Not Null
);


INSERT INTO Take_Ride (rid, uid,INFO)
VALUES(1, 2, '<session><source uid="2" >initiator</source><space_left rid="1" users="1">1</space_left><time_accepted>10:00</time_accepted><date>12-12-2012</date></session>');

INSERT INTO Take_Ride (rid, uid,INFO)
VALUES(2, 1, '<session><source uid="1" >initiator</source><space_left rid="2" users="1">3</space_left> <time_accepted>11:00</time_accepted><date>12-12-2012</date></session>');

INSERT INTO Take_Ride (rid, uid,INFO)
VALUES(2, 3, '<session><source uid="3">splitter</source><space_left rid="2" users="2">2</space_left> <time_accepted>11:05</time_accepted><date>12-12-2012</date></session>');

INSERT INTO Take_Ride (rid, uid,INFO)
VALUES(3, 5, '<session><source uid="5">initiator</source><space_left rid="3"  users="1">3</space_left> <time_accepted>12:00</time_accepted><date>12-12-2012</date></session>');

INSERT INTO Take_Ride (rid, uid,INFO)
VALUES(4, 4, '<session><source uid="4">initiator</source><space_left rid="4" users="1">1</space_left> <time_accepted>12:00</time_accepted><date>12-12-2012</date></session>');

INSERT INTO Take_Ride (rid, uid,INFO)
VALUES(4, 2, '<session><source uid="2">splitter</source><space_left rid="4"  users="2">0</space_left> <time_accepted>12:05</time_accepted><date>12-12-2012</date></session>');

INSERT INTO Take_Ride (rid, uid,INFO)
VALUES(5, 3, '<session><source uid="3">initiator</source><space_left rid="5" users="1">1</space_left> <time_accepted>13:00</time_accepted><date>12-12-2012</date></session>');

select * from Take_Ride;

SELECT XMLQUERY ( 'for $d in $INFO/session/source 
			return <splitter> {$d/@uid} </splitter> ' )
FROM Take_Ride WHERE XMLEXISTS ('$INFO/session[source="splitter"]' );

SELECT XMLQUERY ( 'for $d in $INFO/session 
		return <full> {$d/space_left/@rid} {$d/date}{$d/time_accepted} </full> ' )
FROM Take_Ride WHERE XMLEXISTS ('$INFO/session[space_left=0]' );
