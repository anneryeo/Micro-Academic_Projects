/*  SQL Part 1, PG. 22 (Oracle Syntax 1)

SELECT firstname || ' ' || lastname AS "Customer"
FROM customers
WHERE state = 'FL';


================================================= */ 

SELECT CONCAT(firstname, ' ', lastname) AS Customer
FROM customers
WHERE state = 'FL';

/*  SQL Part 1, PG. 30 (Oracle Syntax 2)

CREATE TABLE acctmanager
	(amid CHAR(4),
	amfirst VARCHAR2(12),
	amlast VARCHAR2(12),
	amedate DATE DEFAULT SYSDATE,
	amsal NUMER(8,2),
	amcomm NUMER(7,2) DEFAULT 0,
	region CHAR(2)
	);


================================================= */ 

CREATE TABLE acctmanager
    (amid CHAR(4),
    amfirst VARCHAR(12),
    amlast VARCHAR(12),
    amedate DATE DEFAULT CURRENT_DATE,
    amsal DECIMAL(8,2),
    amcomm DECIMAL(7,2) DEFAULT 0,
    region CHAR(2)
    );

/*  SQL Part 1, PG. 37 (Oracle Syntax 3)

RENAME oldtablename TO newablename;

================================================= */ 

RENAME TABLE 
    oldtable1 TO newtable1,
    oldtable2 TO newtable2;

/*  SQL Part 2, PG. 4 (Oracle Syntax 1)

CREATE TABLE acctmanager
(
amid CHAR(4),
amfirst VARCHAR2(12)
	CONSTRAINT acctmanager_amfirst_nn NOT NULL,
amlast VARCHAR2(12)
	CONSTRAINT acctmanager_amlast_nn NOT NULL,
amedate DATE DEFAULT SYSDATE,
amsal NUMBER(8,2)
	CONSTAINT acctmanager_amsal NOT NULL
	CONSTRAINT acctmanager_amsal_ck CHECK (amsal > 0),
amcomm NUMBER(7,2) DEFAULT 0,
region CHAR(2)
	CONSTRAINT acctmanager_region_ck
	CHECK (region IN
		('N','NW','NE','S','SE','SW','W','E')),
CONSTRAINT acctmanager_amid_pk PRIMARY KERY (amid)
);


================================================= */ 

CREATE TABLE acctmanager
(
amid CHAR(4) PRIMARY KEY,
amfirst VARCHAR(12) NOT NULL,
amlast VARCHAR(12) NOT NULL,
amedate DATE DEFAULT CURRENT_DATE,
amsal DECIMAL(8,2) NOT NULL CHECK (amsal > 0),
amcomm DECIMAL(7,2) DEFAULT 0,
region CHAR(2) CHECK (region IN ('N','NW','NE','S','SE','SW','W','E'))
);

/*  SQL Part 2, PG. 7 (Oracle Syntax 2)

INSERT INTO acctmanager
VALUES
('T500','Nick','Taylor',DATE '2017-09-05',42000,3500,'NE');

INSERT INTO acctmanager
(amid, amfirst, amlast, amedate, amsal, amcomm)
VALUES ('L500','Mandy','Lope','01-OCT-17',47000,1500);

INSERT INTO acctmanager
(amid, amfirst, amlast, amsal, amcomm, region)
VALUES('J500','Samie','Jones',39500,2000,'NW');

================================================= */ 

INSERT INTO acctmanager
VALUES
('T500','Nick','Taylor','2017-09-05',42000,3500,'NE');

INSERT INTO acctmanager
(amid, amfirst, amlast, amedate, amsal, amcomm)
VALUES ('L500','Mandy','Lope','2017-10-01',47000,1500);

INSERT INTO acctmanager
(amid, amfirst, amlast, amsal, amcomm, region)
VALUES('J500','Samie','Jones',39500,2000,'NW');

/*  SQL Part 2, PG. 12 (Oracle Syntax 3)

UPDATE acctmanager
SET amedate = '10-OCT-17'
WHERE amid = 'J500';

UPDATE acctmanager
SET region = 'W'
WHERE region = 'NE' OR region = 'NW';

UPDATE acctmanager
SET amedate = '10-OCT-17', region = 'S'
WHERE amid = 'L500';

================================================= */ 

UPDATE acctmanager
SET amedate = '2017-10-10'
WHERE amid = 'J500';

UPDATE acctmanager
SET region = 'W'
WHERE region = 'NE' OR region = 'NW';

UPDATE acctmanager
SET amedate = '2017-10-10', region = 'S'
WHERE amid = 'L500';

/*  SQL Part 2, PG. 32 (Oracle Syntax 4)

SELECT customer# || ': ' || firstname || ' ' || lastname
AS "Customer", state
FROM customers
WHERE state = 'CA' OR state = 'FL';

================================================= */ 

SELECT CONCAT(customer#, ': ', firstname, ' ', lastname)
AS Customer, state
FROM customers
WHERE state = 'CA' OR state = 'FL';