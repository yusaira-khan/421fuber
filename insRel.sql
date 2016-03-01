INSERT INTO ON_Ride (rid, cid)
VALUES(1, 1);
 
INSERT INTO ON_Ride (rid, cid)
VALUES(2, 3);

INSERT INTO ON_Ride (rid, cid)
VALUES(3, 3);

INSERT INTO ON_Ride (rid, cid)
VALUES(4, 2);

INSERT INTO ON_Ride (rid, cid)
VALUES(5, 3);

INSERT INTO Subscribe (uid, subsNumber)
VALUES(1,1);

INSERT INTO Subscribe (uid, subsNumber)
VALUES(2,2);

INSERT INTO Subscribe (uid, subsNumber)
VALUES(3,3);

INSERT INTO Subscribe (uid, subsNumber)
VALUES(4,4);

INSERT INTO Subscribe (uid, subsNumber)
VALUES(5,5);

INSERT INTO Take_Ride (rid, uid)
VALUES(1, 2);

INSERT INTO Take_Ride (rid, uid)
VALUES(2, 1);

INSERT INTO Take_Ride (rid, uid)
VALUES(2, 3);

INSERT INTO Take_Ride (rid, uid)
VALUES(3, 5);

INSERT INTO Take_Ride (rid, uid)
VALUES(4, 4);

INSERT INTO Take_Ride (rid, uid)
VALUES(4, 2);

INSERT INTO Take_Ride (rid, uid)
VALUES(5, 3);

INSERT INTO Insure (ipid, cid)
VALUES(1,1);

INSERT INTO Insure (ipid, cid)
VALUES(2,2);

INSERT INTO Insure (ipid, cid)
VALUES(1,3);

INSERT INTO Insure (ipid, cid)
VALUES(4, 4);

INSERT INTO Insure (ipid, cid)
VALUES(3,5);

INSERT INTO Insure (ipid, cid)
VALUES(5,6);

INSERT INTO Insure (ipid, cid)
VALUES(2, 7);

INSERT INTO Insure (ipid, cid)
VALUES(1, 8);

INSERT INTO Insure (ipid, cid)
VALUES(4, 9);

INSERT INTO Insure (ipid, cid)
VALUES(3, 10);

INSERT INTO Insure (ipid, cid)
VALUES(4, 11);

INSERT INTO Park_At (cid, pNumber, sid)
VALUES(1, 4, 1);

INSERT INTO Park_At (cid, pNumber, sid)
VALUES(4, 15, 8);

INSERT INTO Park_At (cid, pNumber, sid)
VALUES(5, 8, 9);

INSERT INTO Park_At (cid, pNumber, sid)
VALUES(6, 11, 5);

INSERT INTO Park_At (cid, pNumber, sid)
VALUES(9, 19, 8);

INSERT INTO Park_At (cid, pNumber, sid)
VALUES(10, 20, 9);

INSERT INTO Park_At (cid, pNumber, sid)
VALUES(11, 21, 1);


INSERT INTO Charge (cid, sid, startTime, endTime)
VALUES(2, 4, TIMESTAMP('2016-02-01-12.00.00'), TIMESTAMP('2016-02-01-14.00.00')););

INSERT INTO Charge (cid, sid, startTime)
VALUES(2, 4, TIMESTAMP('2016-02-02-13.30.00'));

INSERT INTO Charge (cid, sid, startTime, endTime)
VALUES(9, 4, TIMESTAMP('2016-02-01-15.00.00'), TIMESTAMP('2016-02-01-18.00.00'));

INSERT INTO manage (eid, sid)
VALUES(5, 1);

