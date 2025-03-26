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



WbImport -file=/home/etuinfo/esmmartin/Documents/S2/R2.06/TP/TP2/employe.csv
         -table=emp
         -filecolumns=matr,nomE,sal,poste,dateEmb,comm,nodept
         -dateformat="yyyy-MM-dd";
         
INSERT INTO dirige (sup,sub) VALUES
(7788,7876),
(7902,7369),
(7566,7788),
(7566,7902),
(7698,7499),
(7698,7521),
(7698,7844),
(7698,7654),
(7698,7900),
(7782,7934),
(7839,7566),
(7839,7698),
(7839,7782);


--INSERT INTO emp(matr,nomE,sal,poste,dateEmb,comm,nodept)VALUES
--(7499,'BIRAUD',12800.00,'COMMERCIAL','1991-02-20',2400.00,30);


--Partie 3 du TP2, Ecriture de requetes

--1
SELECT nome
FROM emp
INNER JOIN dept ON emp.nodept=dept.nodept
WHERE dept.nomdept='VENTES';

--2
SELECT nome
FROM emp
INNER JOIN dept ON emp.nodept=dept.nodept
WHERE dept.nomdept='VENTES' AND poste='DIRECTEUR';

--3
SELECT nomdept
FROM dept
WHERE nodept NOT IN (
  SELECT DISTINCT nodept
  FROM emp
);

--4
SELECT COUNT(*) AS effectif,nomdept
FROM emp
INNER JOIN dept ON emp.nodept=dept.nodept
GROUP BY nomdept;

--5
SELECT COUNT(matr) AS effectif,dept.nomdept
FROM dept
LEFT JOIN emp ON dept.nodept=emp.nodept
GROUP BY dept.nomdept;


--6
SELECT SUM(sal)+ SUM(comm) AS masse_salariale
FROM emp;

--7
SELECT SUM(sal) AS mass_sal_dept, nomdept
FROM dept
LEFT JOIN emp ON dept.nodept=emp.nodept
GROUP BY nomdept;

--8
SELECT SUM(sal)+ SUM(comm) AS mass_sal_dept, nomdept
FROM dept
LEFT JOIN emp ON dept.nodept=emp.nodept
GROUP BY nomdept;

--9
SELECT sub, nome
FROM(
SELECT sub
FROM emp
INNER JOIN dirige ON emp.matr=dirige.sup
WHERE poste='DIRECTEUR') AS temp
INNER JOIN emp ON sub=matr;

--10
SELECT sub, nome
FROM(
SELECT sub
FROM emp
INNER JOIN dirige ON emp.matr=dirige.sup
WHERE poste='DIRECTEUR') AS temp
INNER JOIN emp ON sub=matr
WHERE poste='INGENIEUR';

--11
SELECT sub, nome, dateemb
FROM(
SELECT sub
FROM emp
INNER JOIN dirige ON emp.matr=dirige.sup
WHERE poste='DIRECTEUR') AS temp
INNER JOIN emp ON sub=matr
WHERE poste='INGENIEUR';
--pas fini

--12


--Partie 3.2 Màj

--1
UPDATE emp
SET sal=(SELECT sal FROM emp)*1.10;
