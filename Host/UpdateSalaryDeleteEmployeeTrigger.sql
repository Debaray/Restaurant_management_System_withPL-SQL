CREATE OR REPLACE trigger updateAuditEmployee
before delete or update on employee
for each row
when(old.id > 0)
BEGIN

insert into auditEmployee values(:old.EID,:old.EName,:old.Address,:old.Phone,:old.Position,:old.Salary,:new.Salary);

END
commit;
/