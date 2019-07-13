CREATE OR REPLACE PACKAGE triggerPackage as

   PROCEDURE updateEmployeeSalary(id employee.EID%type,salary employee.salary%type);
   PROCEDURE deleteEmployee(id employee.EID%type);
   PROCEDURE updateItemPrice(id menuitems.ItemID%type, price menuitems.Price%type);
   PROCEDURE deleteItem(id menuitems.ItemID%type);
   
END triggerPackage;
/

CREATE OR REPLACE PACKAGE BODY triggerPackage as

	PROCEDURE updateEmployeeSalary(id employee.EID%type,salary employee.salary%type) IS
	   BEGIN
	    
		Update employee set Salary = salary where EID = id;
		
	   END updateEmployeeSalary;
	PROCEDURE deleteEmployee(id employee.EID%type)
	  BEGIN
	    
		delete form employee where EID = id;
	  
	  END deleteEmployee;
    PROCEDURE updateItemPrice(id menuitems.ItemID%type, price menuitems.Price%type)
		BEGIN
		  Update menuitems set Price = price where ItemID = id;
		  
		END updateItemPrice;
		
	PROCEDURE deleteItem(id menuitems.ItemID%type)
	   BEGIN
	    
		delete form menuitems where ItemID = id;
	  
	  END deleteItem;
END triggerPackage;
commit;
/