create or replace procedure searchItem(fromPrice in number,toPrice in number)
	is
	ItemName menuitems.ItemName%type;
	Price menuitems.Price%type;
	Description menuitems.Description%type;
	
	cursor I_cur is SELECT ItemName,Price,Description From menuitems WHERE Price Between fromPrice AND toPrice;
begin

	open I_cur();
	loop
	  fetch I_cur into ItemName,Price,Description;
	  exit when I_cur%notfound;
			DBMS_OUTPUT.PUT_LINE(TO_CHAR(ItemName)||' -'||TO_CHAR(Price)||' taka'||' -'||TO_CHAR(Description));
		end loop;
	close I_cur;
end;
/