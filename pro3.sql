create or replace procedure daily_customer(givenDate in date)
	is
	customerName customer.CustomerNmae%type;
	amount bills.Amount%type;
	cursor DC_cur is SELECT customer.CustomerNmae , sum(bills.Amount) AS Amount FROM customer,bills
	WHERE customer.CustomerID = bills.CustomerID AND bills.BDate = givenDate GROUP BY CustomerNmae;
begin

	open DC_cur;
	loop
	  fetch DC_cur into customerName,amount;
	  exit when DC_cur%notfound;
			DBMS_OUTPUT.PUT_LINE(TO_CHAR(customerName) ||' -'||TO_CHAR(amount)||' taka');
		end loop;
	close DC_cur;
end;
/