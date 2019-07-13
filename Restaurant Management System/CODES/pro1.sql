create or replace procedure top_ordering(fromDate in date,toDate in date)
	is
	itemName varchar(200);
begin
	SELECT MI.ItemName into itemName FROM menuitems MI INNER JOIN orders O ON
	MI.ItemID = O.ItemID WHERE ODate between fromDate AND toDate AND ROWNUM <= 1
	GROUP BY ItemName ORDER BY sum(O.Quantity) DESC;
	DBMS_OUTPUT.PUT_LINE(itemName);
end;
/