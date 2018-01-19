#!/bin/sh
export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib
sqlplus64 "g85singh/04145229@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))"<<EOF
INSERT INTO vehicle
VALUES('abcd123',0,'y');
INSERT INTO vehicle
VALUES('asdf456',1,'y');
INSERT INTO vehicle
VALUES('qwer123',3,'y');
INSERT INTO vehicle
VALUES('tyui789',2,'y');
INSERT INTO vehicleInformation
VALUES
('abcd123',1234,200,'Model S', 2018, 'Tesla', 150000, 'Red', 520);
INSERT INTO vehicleInformation
VALUES ('asdf456',5234,200,'Model X', 2018, 'Tesla', 150000, 'Black', 520);
INSERT INTO vehicleInformation
VALUES ('qwer123',1534,200,'3', 2018, 'Mazda', 50000, 'Blue', 520);
INSERT INTO vehicleInformation
VALUES ('tyui789',18734,400,'GTR', 2018, 'Nissan', 170000, 'Orange', 780);
INSERT INTO Customer
VALUES
(1,'Gurkirat','s123','123 Random st', 'creditCard');
INSERT INTO Customer
VALUES(2,'Chloe','g123','123 Random st', 'credit_Card');
INSERT INTO Customer
VALUES(3,'John','s153','123 Random st', 'credit-Card');
INSERT INTO Customer
VALUES(4,'Steve','s843','123 Random st', 'credit Card');
INSERT INTO employee
VALUES(1,5,'jane','y',CURRENT_DATE);
INSERT INTO Employee
VALUES(2,6,'Tim', 'y',CURRENT_DATE);
INSERT INTO Employee
VALUES(3,7,'joe', 'y',CURRENT_DATE);
INSERT INTO Employee
VALUES(4,8,'kyle', 'y',CURRENT_DATE);
INSERT INTO Reservation
VALUEs(1,1,1,'creditCard', 2, 's123', CURRENT_DATE+1,400,CURRENT_DATE+7, 100, 'good', 500);
INSERT INTO Reservation
VALUEs(2,2,2,'credit_Card', 1, 'g123', CURRENT_DATE+2,200,CURRENT_DATE+8, 100, 'good', 500);
INSERT INTO Reservation
VALUEs(3,3,4,'credit-Card', 0, 's153', CURRENT_DATE+3,200,CURRENT_DATE+9, 100, 'good', 500);
INSERT INTO Reservation
VALUEs(4,4,3,'credit Card', 3, 's843', CURRENT_DATE+4,200,CURRENT_DATE+10, 100, 'good', 500);
INSERT INTO additionalDrivers
VALUES (1,1,'jackson', '123 jackson st', 'f852');
INSERT INTO vehiclehis
VALUES ('qwer123', 'oil change 5/10/17', null);
	exit;
EOF
