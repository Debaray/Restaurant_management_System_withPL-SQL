CREATE OR REPLACE trigger updateAuditmenuItems
before delete or update on menuitems
for each row
when(old.id > 0)
BEGIN

insert into auditMenuitems values(:old.ItemID,:old.ItemName,:old.OldPrice,:new.NewPrice,:old.Description,:old.CID);

END
commit;
/