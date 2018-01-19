CREATE TABLE employee (
	EmpNum NUMBER PRIMARY KEY,
	SinNum NUMBER UNiQUE,
	EmpName VARCHAR2(25) NOT NULL, 
	Active CHAR NOT NULL,
	startDate DATE
);
CREATE TABLE customer(
	CusNum NUMBER PRIMARY KEY,
	CusName VARCHAR(25) NOT NULL,
	LicenceNum VARCHAR2(25) UNIQUE, 
	Adress VARCHAR2(25),
	creditCard VARCHAR2(25) UNIQUE
);
CREATE TABLE vehicle(
  platenum VARCHAR2(7) PRIMARY KEY, 
  mileage NUMBER UNIQUE, 
  cavailability VARCHAR2(25)
);
CREATE TABLE reservation(
	resNum NUMBER PRIMARY KEY,
  CusNum NUMBER UNIQUE,
	EmpNum NUMBER UNIQUE,
	creditCard VARCHAR2(25) UNIQUE, 
	Mileage NUMBER,
	
	LicenceNum VARCHAR2(25) UNIQUE,
	checkoutDate DATE UNIQUE,
	rentAmmount INT NOT NULL,
	return_date DATE UNIQUE,
	returnMileage INT,
	vehicleState VARCHAR2(25) NOT NULL, 
	initial_deposit INT NOT NULL,
	
	
	foreign key (CusNum) references customer(CusNum),
	foreign key (EmpNum) references employee(EmpNum),
	foreign key (creditCard) references customer(creditCard),
	foreign key (mileage) references vehicle(mileage),
  foreign key (LicenceNum) references customer(LicenceNum)
	
);
CREATE TABLE additionalDrivers(
  cusNum NUMBER REFERENCES customer(cusNum) PRIMARY KEY,
  adName VARCHAR2(25),
  address VARCHAR2(30),
  licensenum VARCHAR2(25) UNIQUE
);
  
  
CREATE TABLE vehicleHis(
  platenum VARCHAR2(7) UNIQUE, 
  maintenanceHistory VARCHAR2(40), 
  collisionReport VARCHAR2(40),
  foreign key (platenum) references vehicle(platenum)
);
  CREATE TABLE vehicleInformation( 
  platenum VARCHAR2(7) UNIQUE, 
  partSerialNum NUMBER UNIQUE, 
  rate VARCHAR2(25), 
  vModel VARCHAR2(30), 
  mYear NUMBER,
  make VARCHAR2(20), 
  originalVal NUMBER, 
  color VARCHAR2(10), 
  insuranceRate NUMBER,
  foreign key (platenum) references vehicle(platenum)
); 
DROP TABLE vehicle;
DROP TABLE reservation;
DROP TABLE vehicleHis;
DROP TABLE ADDITIONALDRIVERS;
DROP TABLE Adds;
DROP TABLE employee;
DROP TABLE customer;
DROP TABLE vehicleinformation;
DROP TABLE choses;
DROP TABLE creates;
