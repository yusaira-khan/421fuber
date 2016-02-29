INSERT INTO Car (chargePercentage, model, color, class, latitude, longitude, status)
VALUES ( 100, 'ford focus','black','small',45.507227, -73.578086,'available');

INSERT INTO Car ( chargePercentage, model, color, class, latitude, longitude, status)
VALUES ( 70, 'some kind of limo','white','limo',45.531882, -73.668512,'busy');

INSERT INTO Car ( chargePercentage, model, color, class, latitude, longitude, status)
VALUES (10, 'honda accord','grey', 'small',45.527986, -73.563914,'busy');

INSERT INTO Car (chargePercentage, model, color, class, latitude, longitude, status)
VALUES (80,'toyota camry','blue','big',45.462409, -73.563242,'available');

INSERT INTO Car (chargePercentage, model, color, class, latitude, longitude, status)
VALUES (60, 'hummer','red','luxury',45.512783, -73.558334, 'available');



INSERT INTO InsurancePackage (type, startDate, endDate, cost, insuranceCompany)
VALUES ( 'standard', '2016-01-01,2016-06-01',200,'McNab Insurance');

INSERT INTO InsurancePackage (ipid, type, startDate, endDate, cost, insuranceCompany)
VALUES ( 'limo', '2015-09-22,2016-09-22',1000,'McNab Insurance');

INSERT INTO InsurancePackage (ipid, type, startDate, endDate, cost, insuranceCompany)
VALUES ( 'luxury', '2016-01-01,2016-06-01',600,'McNab Insurance');

INSERT INTO InsurancePackage (ipid, type, startDate, endDate, cost, insuranceCompany)
VALUES ( 'large', '2015-02-01,2016-04-01',1200,'Billy Bob Insurance');

INSERT INTO InsurancePackage (ipid, type, startDate, endDate, cost, insuranceCompany)
VALUES ('standard', '2016-02-12,2016-09-11',1729,'Hugh Jasshole Insurance');





INSERT INTO Employee (eid, name, salary, responsibilities)
VALUES ( 'Jimmy Jones', 1437,'in charge of all lizard-related disasters');

INSERT INTO Employee (eid, name, salary, responsibilities)
VALUES ( 'Jonti Harris', 1337,'manages database entries');

INSERT INTO Employee (eid, name, salary, responsibilities)
VALUES ('Timothy Turner', 0,'intern');

INSERT INTO Employee (eid, name, salary, responsibilities)
VALUES ( 'Susan Rutherford', 1729,'head of northern station');

INSERT INTO Employee (eid, name, salary, responsibilities)
VALUES ('Sparkling Pete', 500,'just some guy tbh');



INSERT INTO Station (sid, longitude, latitude)
VALUES ( 45.504299, -73.576660);

INSERT INTO Station (sid, longitude, latitude)
VALUES ( 45.472063, -73.559479);

INSERT INTO Station (sid, longitude, latitude)
VALUES ( 45.492803, -73.696549);

INSERT INTO Station (sid, longitude, latitude)
VALUES ( 45.518094, -73.5668350);

INSERT INTO Station (sid, longitude, latitude)
VALUES ( 45.507742, -73.591648);

INSERT INTO Station (sid, longitude, latitude)
VALUES ( 45.514159, -73.583620);

INSERT INTO Station (sid, longitude, latitude)
VALUES ( 45.497277, -73.564495);

INSERT INTO Station (sid, longitude, latitude)
VALUES ( 45.470574, -73.543742);

INSERT INTO Station (sid, longitude, latitude)
VALUES ( 45.464431, -73.572956);

INSERT INTO Station (sid, longitude, latitude)
VALUES ( 45.473725, -73.587237);



INSERT INTO ParkingStation (sid,longitude, latitude)
VALUES (1, 45.504299, -73.576660);

INSERT INTO ParkingStation (sid,longitude, latitude)
VALUES (3, 45.492803, -73.696549);

INSERT INTO ParkingStation (sid,longitude, latitude)
VALUES (10, 45.473725, -73.587237);

INSERT INTO ParkingStation (sid,longitude, latitude)
VALUES (5,  45.507742, -73.591648);

INSERT INTO ParkingStation (sid,longitude, latitude)
VALUES (8, 45.470574, -73.543742);



INSERT INTO ChargingStation (sid,status,longitude, latitude)
VALUES (2, 'busy', 45.472063, -73.559479);

INSERT INTO ChargingStation (sid,status,longitude, latitude)
VALUES (4, 'available',45.518094, -73.5668350);

INSERT INTO ChargingStation (sid,status,longitude, latitude)
VALUES (6, 'available',45.514159, -73.583620);

INSERT INTO ChargingStation (sid,status,longitude, latitude)
VALUES (7, 'available',45.497277, -73.564495);

INSERT INTO ChargingStation (sid,status,longitude, latitude)
VALUES (9, 'busy', 45.464431, -73.572956);




INSERT INTO CreditCard (ccNumber, expirationDate, CVV, cardHolderName, billingAddress)
VALUES ('4564567456745677', '2021-12-02', 545, 'Jane Porter', '67 Jungle Avenue');

INSERT INTO CreditCard (ccNumber, expirationDate, CVV, cardHolderName, billingAddress)
VALUES ('1241241241241245', '2015-12-31', 123, 'CIA UUUU', '317 Big Guy Road');

INSERT INTO CreditCard (ccNumber, expirationDate, CVV, cardHolderName, billingAddress)
VALUES ('0070007000700070', '2018-05-01', 789, 'James Bond', '85 Albert Embarkment');

INSERT INTO CreditCard (ccNumber, expirationDate, CVV, cardHolderName, billingAddress)
VALUES ('6934657920349553', '2020-10-01', 621, 'Ashley Maddison ', '123 Fake Street');

INSERT INTO CreditCard (ccNumber, expirationDate, CVV, cardHolderName, billingAddress)
VALUES ('172172917291729', '2021-02-17', 909, 'Tarzan', '67 Jungle Avenue');


INSERT INTO Subscription (subsNumber, monthlyPrice, class, startDate, endDate)
VALUES (1, 60, 'small','2015-01-01, 2016-01-01');

INSERT INTO Subscription (subsNumber, monthlyPrice, class, startDate, endDate)
VALUES (4, 100, 'big','2016-01-01, 2017-01-01');

INSERT INTO Subscription (subsNumber, monthlyPrice, class, startDate, endDate)
VALUES (3, 70, 'small','2016-01-01, 2016-02-01');

INSERT INTO Subscription (subsNumber, monthlyPrice, class, startDate, endDate)
VALUES (2, 200, 'limo','2015-07-14, 2016-03-14');

INSERT INTO Subscription (subsNumber, monthlyPrice, class, startDate, endDate)
VALUES (5, 50, 'small','2016-02-22, 2017-08-22');



INSERT INTO User (uid, name, email, ccNumber)
VALUES ('James Bond','shakennotstirred@gmail.com', '0070007000700070');

INSERT INTO User (uid, name, email, ccNumber)
VALUES ( 'Jane Porter','mynameisjane@aol.com','4564567456745677');

INSERT INTO User (uid, name, email, ccNumber, subsNumber)
VALUES ( 'Tarzan','kingofthejungle@gmail.com','172172917291729');

INSERT INTO User (uid, name, email, ccNumber, subsNumber)
VALUES ( 'CIA UUUU','getthishotheadouttahere@cia.gov','1241241241241245');

INSERT INTO User (uid, name, email, ccNumber, subsNumber)
VALUES ('Ashley Maddison','comecheatwithme@aol.com','6934657920349553');



INSERT INTO Ride (rid, startLatitude, startLongitude, destinationLatitude, destinationlongitude, startTime, endTime, price)
VALUES ( 45.504115, -73.574314, 45.507774, -73.562699, '2015-11-10-12.20.21.02', '2015-11-10-12.30.45.32',5.67);

INSERT INTO Ride (rid, startLatitude, startLongitude, destinationLatitude, destinationlongitude, startTime, endTime, price)
VALUES ( 45.508433, -73.568844, 45.448116, -73.698170, '2016-01-10-01.13.23.46', '2016-01-10-01.50.34.21',40.75);

INSERT INTO Ride (rid, startLatitude, startLongitude, destinationLatitude, destinationlongitude, startTime)
VALUES ( 45.510852, -73.577279, 45.499233, -73.647537, '2016-02-27-23.55.55.55');

INSERT INTO Ride (rid, startLatitude, startLongitude, destinationLatitude, destinationlongitude, startTime, endTime, price)
VALUES ( 45.470336, -73.603934, 45.473856, -73.607902, '2015-07-04-16.15.14.13', '2015-07-04-16.15.14.13', 17.29);

INSERT INTO Ride (rid, startLatitude, startLongitude, destinationLatitude, destinationlongitude, startTime, endTime, price)
VALUES (45.493828, -73.575208, 45.513820, -73.557249, '2016-01-01-17.34.33.03', '2016-01-02-13.53.45.22',38.99);

