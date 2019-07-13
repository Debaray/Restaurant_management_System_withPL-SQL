clear screen;

drop table employee cascade constraints;
drop table catagories cascade constraints;
drop table menuitems cascade constraints;
drop table customer cascade constraints;
drop table reservation cascade constraints;
drop table diningTables cascade constraints;
drop table orders cascade constraints;
drop table diningTableTrack cascade constraints;
drop table reserves cascade constraints;
drop table bills cascade constraints;

CREATE TABLE employee(
  EID int,
  EName varchar(50),
  Address varchar(50),
  Phone number,
  Position varchar(50),
  Salary number,
  PRIMARY KEY(EID)
);

CREATE TABLE auditEmployee(
  EID int,
  EName varchar(50),
  Address varchar(50),
  Phone number,
  Position varchar(50),
  OldSalary number,
  NewSalary number,
  PRIMARY KEY(EID)
);

CREATE TABLE catagories(
    CID int,
	CName varchar(50),
    PRIMARY KEY(CID)
);

CREATE TABLE menuitems(
    ItemID int,
	ItemName varchar(500),
	Price number,
	Description varchar(500),
	CID int,
	PRIMARY KEY(ItemID),
	FOREIGN KEY(CID) REFERENCES catagories(CID)
);
CREATE TABLE auditMenuitems(
    ItemID int,
	ItemName varchar(500),
	OldPrice number,
	NewPrice number,
	Description varchar(500),
	CID int,
	PRIMARY KEY(ItemID),
	FOREIGN KEY(CID) REFERENCES catagories(CID)
);

CREATE TABLE customer(
    CustomerID int,
	CustomerName varchar(30),
	Address varchar(30),
	PRIMARY KEY(CustomerID)
);

CREATE TABLE reservation(
    RID int,
	duration varchar(10),
	RDate date,
	RTime varchar(15),
	CustomerID int,
	PRIMARY KEY(RID),
	FOREIGN KEY(CustomerID) REFERENCES customer(CustomerID)
);

CREATE TABLE diningTables(
	DID int,
	WID int,
	ChairCount int,
	PRIMARY KEY(DID),
	FOREIGN KEY(WID) REFERENCES employee(EID)
	ON DELETE CASCADE
);

CREATE TABLE orders(
    OID int,
	ODate varchar(50),
	Quantity int,
	CustomerID int,
	ItemID int,
	PRIMARY KEY(OID),
	FOREIGN KEY(CustomerID) REFERENCES customer(CustomerID),
    FOREIGN KEY(ItemID) REFERENCES menuitems(ItemID)
	ON DELETE CASCADE
);

CREATE TABLE diningTableTrack(
    Serial int,
	Status char(1) check (Status in ('B','F')),
	OID int,
	DID int,
	TableServesDate date,
	TableServesTime varchar(50),
	PRIMARY KEY(Serial),
	FOREIGN KEY(OID) REFERENCES orders(OID),
	FOREIGN KEY(DID) REFERENCES diningTables(DID)
);

CREATE TABLE reserves(
   RID int,
   DID int,
   FOREIGN KEY(DID) REFERENCES diningTables(DID),
   FOREIGN KEY(RID) REFERENCES reservation(RID)
);

CREATE TABLE bills(
   BID int,
   OID int,
   CustomerID int,
   Discount number,
   Amount number,
   BDate varchar(50),
   BTime varchar(50),
   PRIMARY KEY(BID),
   FOREIGN KEY(OID) REFERENCES orders(OID),
   FOREIGN KEY(CustomerID) REFERENCES customer(CustomerID)
);

commit;












