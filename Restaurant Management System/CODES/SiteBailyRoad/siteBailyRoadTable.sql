clear screen;

drop table employee2 cascade constraints;
drop table catagories2 cascade constraints;
drop table menuitems2 cascade constraints;
drop table customer2 cascade constraints;
drop table reservation2 cascade constraints;
drop table diningTables2 cascade constraints;
drop table orders2 cascade constraints;
drop table diningTableTrack2 cascade constraints;
drop table reserves2 cascade constraints;
drop table bills2 cascade constraints;

CREATE TABLE employee2(
  EID int,
  EName varchar(50),
  Address varchar(50),
  Phone number,
  Position varchar(50),
  Salary number,
  PRIMARY KEY(EID)
);

CREATE TABLE catagories2(
    CID int,
	CName varchar(50),
    PRIMARY KEY(CID)
);

CREATE TABLE menuitems2(
    ItemID int,
	ItemName varchar(500),
	Price number,
	Description varchar(500),
	CID int,
	PRIMARY KEY(ItemID),
	FOREIGN KEY(CID) REFERENCES catagories(CID)
);

CREATE TABLE customer2(
    CustomerID int,
	CustomerName varchar(30),
	Address varchar(30),
	PRIMARY KEY(CustomerID)
);

CREATE TABLE reservation2(
    RID int,
	duration varchar(10),
	RDate date,
	RTime varchar(15),
	CustomerID int,
	PRIMARY KEY(RID),
	FOREIGN KEY(CustomerID) REFERENCES customer(CustomerID)
);

CREATE TABLE diningTables2(
	DID int,
	WID int,
	ChairCount int,
	PRIMARY KEY(DID),
	FOREIGN KEY(WID) REFERENCES employee(EID)
);

CREATE TABLE orders2(
    OID int,
	ODate varchar(50),
	Quantity int,
	CustomerID int,
	ItemID int,
	PRIMARY KEY(OID),
	FOREIGN KEY(CustomerID) REFERENCES customer(CustomerID),
    FOREIGN KEY(ItemID) REFERENCES menuitems(ItemID)
);

CREATE TABLE diningTableTrack2(
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

CREATE TABLE reserves2(
   RID int,
   DID int,
   FOREIGN KEY(DID) REFERENCES diningTables(DID),
   FOREIGN KEY(RID) REFERENCES reservation(RID)
);

CREATE TABLE bills2(
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












