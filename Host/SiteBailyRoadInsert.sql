SET SERVEROUTPUT ON;
DECLARE 
    CURSOR employee_cur is 
      SELECT EID,EName,Address,Phone ,Position ,Salary FROM employee where EID >= 3000; 
    employee_rec employee_cur%rowtype; 
	
    CURSOR categories_cur is 
	  SELECT CID,CName FROM catagories where CID >=3000;
    categories_rec categories_cur%rowtype;
	
    CURSOR menuitems_cur is
	   SELECT ItemID,ItemName,Price,Description,CID FROM menuitems where ItemID >= 3000;
	menuitems_rec menuitems_cur%rowtype;
	
    CURSOR customer_cur is
		SELECT CustomerID,CustomerName,Address FROM customer where CustomerID >= 3000;
	customer_rec customer_cur%rowtype;
	
	CURSOR reservation_cur is
		SELECT  RID,duration,RDate,RTime,CustomerID FROM reservation where RID >= 3000;
	reservation_rec reservation_cur%rowtype;
	
	CURSOR diningTables_cur is
		SELECT DID,WID,ChairCount FROM diningTables where DID >= 3000;
	diningTables_rec diningTables_cur%rowtype;
	
	CURSOR orders_cur is
		SELECT OID,ODate,Quantity,CustomerID,ItemID FROM orders where OID >=2998;
	orders_rec orders_cur%rowtype;
	
	CURSOR diningTableTrack_cur is
		SELECT Serial,Status,OID,DID,TableServesDate,TableServesTime FROM diningTableTrack where Serial >= 3000;
	diningTableTrack_rec diningTableTrack_cur%rowtype;
	
	CURSOR reserves_cur is
		SELECT RID,DID FROM reserves where RID >= 3000;
	reserves_rec reserves_cur%rowtype;
	
	CURSOR is bills_cur is 
		SELECT  BID,OID,CustomerID,Discount,Amount,BDate,BTime FROM bills where BID >= 3000;
	bills_rec bills_cur%rowtype;
	
	  
BEGIN 

 OPEN employee_cur; 
   LOOP 
      FETCH employee_cur into employee_rec; 
      EXIT WHEN employee_cur%notfound; 
	  insert into employee2 at site1 VALUES(employee_rec.EID,employee_rec.EName,employee_rec.Address,employee_rec.Phone,employee_rec.Position,employee_rec.Salary);
   END LOOP; 
   CLOSE employee_cur;
   
    OPEN categories_cur; 
   LOOP 
      FETCH categories_cur into categories_rec; 
      EXIT WHEN categories_cur%notfound; 
	  insert into catagories2 at site1 VALUES(categories_rec.CID,categories_rec.CName);
   END LOOP; 
   CLOSE categories_cur;
   
    OPEN menuitems_cur; 
   LOOP 
      FETCH menuitems_cur into menuitems_rec; 
      EXIT WHEN menuitems_cur%notfound; 
	  insert into menuitems2 at site1 VALUES(menuitems_rec.ItemID,menuitems_rec.ItemName,menuitems_rec.Price,menuitems_rec.CID);
   END LOOP; 
   CLOSE menuitems_cur;
   
    OPEN customer_cur; 
   LOOP 
      FETCH customer_cur into customer_rec; 
      EXIT WHEN customer_cur%notfound; 
	  insert into customer2 at site1 VALUES(customer_rec.CustomerID,customer_rec.CustomerName,customer_rec.Address);
   END LOOP; 
   CLOSE customer_cur;
   
    OPEN reservation_cur; 
   LOOP 
      FETCH reservation_cur into reservation_rec; 
      EXIT WHEN reservation_cur%notfound; 
	  insert into reservation2 at site1 VALUES(reservation_rec.RID,reservation_rec.duration,reservation_rec.RDate,reservation_rec.RTime,reservation_rec.CustomerID);
   END LOOP; 
   CLOSE reservation_cur;
   
    OPEN diningTables_cur; 
   LOOP 
      FETCH diningTables_cur into diningTables_rec; 
      EXIT WHEN diningTables_cur%notfound; 
	  insert into diningTables2 at site1 VALUES(diningTables_rec.DID,diningTables_rec.WID,diningTables_rec.ChairCount);
   END LOOP; 
   CLOSE diningTables_cur;
   
    OPEN orders_cur; 
   LOOP 
      FETCH orders_cur into orders_rec; 
      EXIT WHEN orders_cur%notfound; 
	  insert into orders2 at site1 VALUES(orders_rec.OID,orders_rec.ODate,orders_rec.Quantity,orders_rec.CustomerID,orders_rec.ItemID);
   END LOOP; 
   CLOSE orders_cur;
   
    OPEN diningTableTrack_cur; 
   LOOP 
      FETCH diningTableTrack_cur into diningTableTrack_rec; 
      EXIT WHEN diningTableTrack_cur%notfound; 
	  insert into diningTableTrack2 at site1 VALUES(diningTableTrack_rec.Serial,diningTableTrack_rec.Status,diningTableTrack_rec.OID,diningTableTrack_rec.DID,diningTableTrack_rec.TableServesDate,diningTableTrack_rec.TableServesTime);
   END LOOP; 
   CLOSE diningTableTrack_cur;
   
    OPEN reserves_cur; 
   LOOP 
      FETCH reserves_cur into reserves_rec; 
      EXIT WHEN reserves_cur%notfound; 
	  insert into reserves2 at site1 VALUES(reserves_rec.RID,reserves_rec.DID);
   END LOOP; 
   CLOSE reserves_cur;
   
   OPEN bills_cur; 
   LOOP 
      FETCH bills_cur into bills_rec; 
      EXIT WHEN bills_cur%notfound; 
	  insert into customer2 at site1 VALUES(bills_rec.BID,bills_rec.OID,bills_rec.CustomerID,bills_rec.Discount,bills_rec.Amount,bills_rec.BDate,bills_rec.BTime);
   END LOOP; 
   CLOSE bills_cur;
END; 
commit;
/