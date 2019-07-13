create or replace procedure all_branch_selling(s in varchar)
	is
	branchName branch.Location%type;
	SellingAmount bills.Amount%type;
	
	cursor B_cur is SELECT branch.Location,sum(bills.Amount) AS Selling_Amount FROM branch,receives,bills
		WHERE branch.BranchID = receives.BranchID AND receives.BID = bills.BID GROUP BY Location;
begin

	open B_cur();
	loop
	  fetch B_cur into branchName,SellingAmount;
	  exit when B_cur%notfound;
			DBMS_OUTPUT.PUT_LINE(TO_CHAR(branchName)||' -'||TO_CHAR(SellingAmount)||' taka');
	end loop;
	close B_cur;
end;
/