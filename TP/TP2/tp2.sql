DROP SCHEMA IF EXISTS distribill1 CASCADE;
CREATE SCHEMA distribill1;
SET SCHEMA 'distribill1';

CREATE TABLE dept (
  nodept INTEGER NOT NULL PRIMARY KEY,
  nomDept CHARACTER VARYING(40),
  lieu CHARACTER VARYING(40)
);
  
CREATE TABLE emp (
  matr INTEGER NOT NULL PRIMARY KEY,
  nomE CHARACTER VARYING(40),
  sal NUMERIC(10,2),
  poste CHARACTER VARYING(40),
  dateEmb DATE,
  comm NUMERIC(10,2),
  nodept INTEGER REFERENCES dept(nodept)
);


CREATE TABLE dirige (
  sup INTEGER NOT NULL REFERENCES emp(matr),
  sub INTEGER NOT NULL REFERENCES emp(matr)
);


INSERT INTO dept (nodept, nomDept, lieu) VALUES
(10,'FINANCES','PARIS'),
(20,'RECHERCHES','GRENOBLE'),
(30,'VENTES','LYON'),
(40,'FABRICATION','ROUEN');

--  \copy emp FROM '/home/etuinfo/esmmartin/Documents/S2/R2.06/TP/TP2/employe.csv';
-- DELETE FROM emp;
