#!/bin/sh
	export LD_LIBRARY_PATH=/usr/lib/oracle/....
	sqlplus64 "g85singh/04145229@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))"<<EOF
	DROP VIEW available_Rental;
	DROP VIEW currentRes;
	CREATE VIEW available_Rental (AR_Mileage,AR_PlateNum,AR_Make,AR_Model,AR_Year,AR_Colour) AS
	        (SELECT Vehicle.Mileage, Vehicle.PlateNum, VehicleInformation.Make, VehicleInformation.VModel, VehicleInformation.MYear, VehicleInformation.Color
	         FROM Vehicle, VehicleInformation
	         WHERE Vehicle.CAvailability = 'y' AND Vehicle.platenum = VehicleInformation.PLATENUM);
	CREATE VIEW currentRes ( CName, CNum, CLicenseNum, CAdd, CCreditCard) AS
	        (SELECT Customer.CusNum, Customer.Cusname, Customer.LicenceNum, Customer.Adress, Customer.CreditCard
	        FROM Customer,Reservation
	WHERE Reservation.Initial_Deposit > 0 AND Customer.cusnum = Reservation.CusNum  )
	        WITH READ ONLY;
EOF
additionaDrivers()
{
	export LD_LIBRARY_PATH=/usr/lib/oracle/....
	sqlplus64 "g85singh/04145229@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))"<<EOF
	SELECT Reservation.CusNum, Customer.cusName, Reservation.ResNum, AdditionalDrivers.AdName
	        FROM Reservation, Customer, AdditionalDrivers
	        WHERE reservation.resnum = additionalDrivers.resnum and reservation.cusnum = customer.cusnum and  AdditionalDrivers.AdName IS NOT NULL;
EOF
}
todayReservations(){
	export LD_LIBRARY_PATH=/usr/lib/oracle/....
	sqlplus64 "g85singh/04145229@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))"<<EOF
	SELECT DISTINCT Customer.cusName
	FROM Customer
	WHERE EXISTS
	        (SELECT Reservation.checkoutdate
	        FROM Reservation
	        WHERE Reservation.checkoutdate < CURRENT_DATE);
EOF
}
maintainenceHis()
{
	export LD_LIBRARY_PATH=/usr/lib/oracle/....
	sqlplus64 "g85singh/04145229@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))"<<EOF
	SELECT Vehicle.PlateNum, Vehiclehis.MaintenanceHistory, Vehiclehis.CollisionReport
	        FROM Vehicle, Vehiclehis
	        WHERE ((Vehiclehis.MaintenanceHistory IS NOT NULL) OR (Vehiclehis.CollisionReport IS NOT NULL)) AND vehicle.platenum = Vehiclehis.PLATENUM
	ORDER By Vehicle.PlateNum DESC;
EOF
}
initialDep()
{
	export LD_LIBRARY_PATH=/usr/lib/oracle/....
	sqlplus64 "g85singh/04145229@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))"<<EOF
	SELECT Customer.CusNum, Customer.cusName, Reservation.ResNum, Reservation.RentAmmount 
	FROM Customer, Reservation
	WHERE Reservation.Initial_Deposit > 100 AND Customer.cusnum = Reservation.CusNum
	ORDER BY Customer.CusNum ASC;
EOF
}
availableRentals()
{
 export LD_LIBRARY_PATH=/usr/lib/oracle/....
        sqlplus64 "g85singh/04145229@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))"<<EOF	
	SELECT * FROM available_Rental;
EOF
}
activeEmployees(){
export LD_LIBRARY_PATH=/usr/lib/oracle/....
        sqlplus64 "g85singh/04145229@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))"<<EOF   
SELECT * 
	FROM Employee
	WHERE active = 'y';
EOF
}
MainMenu()
{
   
   while [ "$CHOICE" != "START" ]
   do
      clear
      echo "================================================================="
      echo "|                    Oracle All Inclusive Tool                  |"
      echo "|             Main Menu - Select Desired Operation(s):          |"
      echo "|        <CTRL-Z Anytime to Enter Interactive CMD Prompt>       |"
      echo "-----------------------------------------------------------------"
      echo " $IS_SELECTEDM M)  View Manual"
      echo " "
      echo " $IS_SELECTED1 1)  Check for aditional drivers"
      echo " $IS_SELECTED2 2)  View today's reservation"
      echo " $IS_SELECTED3 3)  View maintainence history"
      echo " $IS_SELECTED4 4)  Customers with initial deposit greater than 100"
      echo " $IS_SELECTED5 5)  Available Cars"     
      echo " $IS_SELECTED6 6)  Active Reservations"	
      echo " $IS_SELECTED7 7)  Active Employees" 
      echo " "
      echo " $IS_SELECTEDX X)  Force/Stop/Kill Oracle DB"
      echo " "
      echo " $IS_SELECTEDE E)  End/Exit"
      echo "Choose: "

      read CHOICE

      if [ "$CHOICE" == "0" ]
      then
		  echo "nothing here";
		  Pause  
      elif [ "$CHOICE" == "1" ]
      then
         additionaDrivers
	echo "Press Enter to Continue"
         read junk
                 
      elif [ "$CHOICE" == "2" ]
      then
         todayReservations
	echo "Press Enter to Continue"
         read junk
                 
      elif [ "$CHOICE" == "3" ]
      then
		 maintainenceHis
echo "Press Enter to Continue"
         read junk
                 
      elif [ "$CHOICE" == "4" ]
      then
         initialDep
echo "Press Enter to Continue"	
         read junk
      elif [ "$CHOICE" == "5" ]
      then
         availableRentals
echo "Press Enter to Continue"  
         read junk
      elif [ "$CHOICE" == "6" ]
      then
         initialDep
echo "Press Enter to Continue"  
         read junk
      elif [ "$CHOICE" == "7" ]
      then
         initialDep
echo "Press Enter to Continue"  
         read junk
      elif [ "$CHOICE" == "8" ]
      then
         initialDep
echo "Press Enter to Continue"  
         read junk
      elif [ "$CHOICE" == "9" ]
      then
         initialDep
echo "Press Enter to Continue"  
         read junk
      elif [ "$CHOICE" == "10" ]
      then
         initialDep
echo "Press Enter to Continue"  
         read junk
      elif [ "$CHOICE" == "11" ]
      then
         initialDep
echo "Press Enter to Continue"  
         read junk
      elif [ "$CHOICE" == "12" ]
      then
         initialDep
echo "Press Enter to Continue"  
         read junk
      elif [ "$CHOICE" == "13" ]
      then
         initialDep
echo "Press Enter to Continue"  
         read junk
      elif [ "$CHOICE" == "14" ]
      then
         initialDep
echo "Press Enter to Continue"  
         read junk
      elif [ "$CHOICE" == "15" ]
      then
         initialDep
echo "Press Enter to Continue"  
         read junk
   
	         elif [ "$CHOICE" == "E" ] || [ "$CHOICE" == "e" ]
	         then
		Start=0
	        return
	         fi

	      done

	   }



	   #--COMMENTS BLOCK--
	   # Main Program 
	   #--COMMENTS BLOCK--

	   ProgramStart()
	   {
	      StartMessage
	      while [ "$Start" == 1 ]
	      do
	         MainMenu
      
	      done
	   }
Start=1
ProgramStart
