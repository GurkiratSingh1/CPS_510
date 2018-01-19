#!/bin/sh
export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib
sqlplus64 "g85singh/04145229@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))"<<EOF
DROP TABLE ADDITIONALDRIVERS;
DROP TABLE Adds;
DROP TABLE previous;
DROP TABLE vehicleHis;
DROP TABLE vehicleinformation;
DROP TABLE reservation;
DROP TABLE employee;
DROP TABLE customer;
DROP TABLE vehicle;
	exit;
EOF
