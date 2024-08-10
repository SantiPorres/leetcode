-- PostgreSQL

-- create
CREATE TABLE PERSONS (
  personId INTEGER PRIMARY KEY,
  lastName VARCHAR,
  firstName VARCHAR
);

CREATE TABLE ADDRESSES (
  addressId INTEGER PRIMARY KEY,
  personId INTEGER,
  city VARCHAR,
  state VARCHAR
  --CONSTRAINT fk_person
  --  FOREIGN KEY (personId)
  --    REFERENCES PERSONS(personId)
);

-- insert
INSERT INTO PERSONS VALUES (1, 'Cardona', 'Paula');
INSERT INTO PERSONS VALUES (2, 'Porres', 'Santiago');

INSERT INTO ADDRESSES VALUES (1, 2, 'New York City', 'New York');
INSERT INTO ADDRESSES VALUES (2, 3, 'LeetCode', 'California');

-- fetch 
SELECT * FROM PERSONS;
SELECT * FROM ADDRESSES;

-- solution: Both passed

SELECT PERSONS.firstName, PERSONS.lastName, ADDRESSES.city, ADDRESSES.state FROM PERSONS 
LEFT JOIN ADDRESSES ON PERSONS.personId = ADDRESSES.personId;

-- Better runtime
SELECT PERSONS.firstName, PERSONS.lastName, ADDRESSES.city, ADDRESSES.state FROM ADDRESSES 
RIGHT JOIN PERSONS ON PERSONS.personId = ADDRESSES.personId;