create or replace procedure reservationCheck(givendate in date)
 is
  id reservation.RID%Type;
  Rtime reservation.RTime%Type;
  duration reservation.duration%Type;
  cursor R_cur is SELECT RID,duration,RTime From reservation WHERE RDate = givendate;
  
BEGIN
	open R_cur;
	loop
	  fetch R_cur into id,duration,Rtime;
	  exit when R_cur%notfound;
			DBMS_OUTPUT.PUT_LINE(TO_CHAR(id)||' -'||TO_CHAR(givendate)||' -'||TO_CHAR(Rtime) ||' -'||TO_CHAR(duration));
		end loop;
	close R_cur;
end;
/