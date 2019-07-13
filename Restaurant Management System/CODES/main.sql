SET SERVEROUTPUT ON;

declare

begin

DBMS_OUTPUT.PUT_LINE('
	  ');
DBMS_OUTPUT.PUT_LINE('Item Name');
   top_ordering('25-MAR-2018','25-JUL-2018');
     DBMS_OUTPUT.PUT_LINE('
	  ');
	 DBMS_OUTPUT.PUT_LINE('ID - Date - Time - Duration'); 
   reservationCheck('25-MAR-2018');
       DBMS_OUTPUT.PUT_LINE('
	  ');
	   DBMS_OUTPUT.PUT_LINE('Customer Name - Amount(Taka)'); 
    daily_customer('25-MAR-2018');
	  DBMS_OUTPUT.PUT_LINE('
	  ');
	  DBMS_OUTPUT.PUT_LINE('ItemName'||' -'||'Price(taka)'||' -'||'Description');
	searchItem(200,300);
	  DBMS_OUTPUT.PUT_LINE('
	  ');
	  DBMS_OUTPUT.PUT_LINE('Branch Name -'||'SellingAmount'||' taka');
	all_branch_selling('hello');
	  DBMS_OUTPUT.PUT_LINE('
	  ');
	  
	triggerPackage.updateEmployeeSalary(3000,56623);
 
end;
/