use p1g1;

CREATE SCHEMA COMPANY;

CREATE TABLE COMPANY.EMPLOYEE(
	Fname		VARCHAR(15) NOT NULL,
	Minit		CHAR,
	Lname		VARCHAR(15) NOT NULL,
	Ssn			CHAR(9)		NOT NULL,
	Bdate		DATE,
	[Address]	VARCHAR(30),
	Sex			CHAR,
	Salary		DECIMAL(10,2),
	Super_ssn	CHAR(9),
	Dno			INT,
	PRIMARY KEY (Ssn),
	FOREIGN KEY (Super_ssn) REFERENCES COMPANY.EMPLOYEE(Ssn),
);


CREATE TABLE COMPANY.DEPARTMENT(
	Dname	VARCHAR(15) NOT NULL,
	Dnumber	INT			NOT NULL,
	Mgr_ssn	CHAR(9),
	Mgr_start_date	DATE,
	PRIMARY KEY(Dnumber),
	UNIQUE (Dname),
	FOREIGN KEY (Mgr_ssn) REFERENCES COMPANY.EMPLOYEE (Ssn)
);

ALTER TABLE COMPANY.EMPLOYEE
ADD CONSTRAINT EMPDEPTFK FOREIGN KEY (Dno) REFERENCES COMPANY.DEPARTMENT(Dnumber);

CREATE TABLE COMPANY.DEPENDENT (
	Essn			CHAR(9)		NOT NULL,
	Dependent_name	VARCHAR(15) NOT NULL,
	Sex				CHAR,
	Bdate			DATE,
	Relationship	VARCHAR(8),
	PRIMARY KEY (Essn, Dependent_name),
	FOREIGN KEY (Essn) REFERENCES COMPANY.EMPLOYEE(Ssn)
);

CREATE TABLE COMPANY.DEPT_LOCATION(
	Dnumber		INT			NOT NULL,
	Dlocation	VARCHAR(15)	NOT NULL,
	PRIMARY KEY (Dnumber, Dlocation),
	FOREIGN KEY (Dnumber) REFERENCES COMPANY.DEPARTMENT(Dnumber)
);

CREATE TABLE COMPANY.PROJECT(
	Pname		VARCHAR(15)	NOT NULL,
	Pnumber		INT			NOT NULL,
	Plocation	VARCHAR(15),
	Dnum		INT			NOT NULL,
	PRIMARY KEY (Pnumber),
	UNIQUE (Pname),
	FOREIGN KEY (Dnum) REFERENCES COMPANY.DEPARTMENT(Dnumber)
);

CREATE TABLE COMPANY.WORKS_ON(
	Essn	CHAR(9)			NOT NULL,
	Pno		INT				NOT NULL,
	[Hours]	DECIMAL(3,1)	NOT NULL,
	PRIMARY KEY (Essn, Pno),
	FOREIGN KEY (Essn) REFERENCES COMPANY.EMPLOYEE(Ssn),
	FOREIGN KEY (Pno) REFERENCES COMPANY.PROJECT(Pnumber)
);


INSERT INTO COMPANY.EMPLOYEE VALUES
('Carlos','D','Gomes','21312332' ,'2000-01-01','Rua XPTO','M',1200.00,NULL,NULL),
('Juliana','A','Amaral','321233765','1980-08-11','Rua BZZZZ','F',1350.00,NULL,NULL),
('Maria','I','Pereira','342343434','2001-05-01','Rua JANOTA','F',1250.00,21312332,NULL),
('Joao','G','Costa','41124234' ,'2001-01-01','Rua YGZ','M',1300.00,21312332,NULL),
('Ana','L','Silva','12652121' ,'1990-03-03','Rua ZIG ZAG','F',1400.00,21312332,NULL),
('Paula','A','Sousa','183623612','2001-08-11','Rua da FRENTE','F',1450.00,NULL,NULL);

INSERT INTO COMPANY.DEPARTMENT VALUES
('RecursosHumanos',4,'12652121','2014-04-02'),
('Investigacao',1,'21312332' ,'2010-08-02'),
('Desporto',5,NULL,NULL),
('Comercial',2,'321233765','2013-05-16'),
('Logistica',3,'41124234' ,'2013-05-16');

INSERT INTO COMPANY.[DEPENDENT] VALUES
('21312332 ','Joana Costa','F','2008-04-01', 'Filho'),
('21312332 ','Maria Costa','F','1990-10-05', 'Neto'),
('21312332 ','Rui Costa','M','2000-08-04','Neto'),
('321233765','Filho Lindo','M','2001-02-22','Filho'),
('342343434','Rosa Lima','F','2006-03-11','Filho'),
('41124234 ','Ana Sousa','F','2007-04-13','Neto'),
('41124234 ','Gaspar Pinto','M','2006-02-08','Sobrinho');

INSERT INTO COMPANY.DEPT_LOCATION VALUES
(2,'AVEIRO'),
(3,'COIMBRA');

INSERT INTO COMPANY.PROJECT VALUES
('Aveiro Digital', 1, 'Aveiro', 3),
('BD Open Day', 2, 'Espinho', 2),
('Dicoogle', 3, 'Aveiro', 4),
('GOPACS', 4, 'Aveiro', 3);

INSERT INTO COMPANY.WORKS_ON VALUES
('183623612',1,20.0),
('183623612',3,10.0),
('21312332 ',1,20.0),
('321233765',1,25.0),
('342343434',1,20.0),
('342343434',4,25.0),
('41124234 ',2,20.0),
('41124234 ',3,30.0);

UPDATE COMPANY.EMPLOYEE
SET Dno=3
WHERE Ssn='183623612';

UPDATE COMPANY.EMPLOYEE
SET Dno=1
WHERE Ssn='21312332 ';

UPDATE COMPANY.EMPLOYEE
SET Dno=3
WHERE Ssn='321233765';

UPDATE COMPANY.EMPLOYEE
SET Dno=2
WHERE Ssn='342343434';

UPDATE COMPANY.EMPLOYEE
SET Dno=2
WHERE Ssn='41124234 ';

UPDATE COMPANY.EMPLOYEE
SET Dno=2
WHERE Ssn='12652121 ';

-- a)
-- π Pname, Fname, Minit, Lname, Ssn (project ⨝ Pnumber=Pno works_on ⨝ Essn=Ssn employee)
SELECT Pname, Fname, Minit, Lname, Ssn
FROM COMPANY.project JOIN COMPANY.works_on ON Pnumber=Pno JOIN COMPANY.employee ON Essn=Ssn;


-- b)
-- π Fname, Minit, Lname (π Fname, Minit, Lname, Super_ssn (employee) ⨝ Super_ssn=Ssn (πSsn (σ Fname='Carlos' and Minit='D' and Lname='Gomes' (employee))))
SELECT Fname, Minit, Lname
FROM COMPANY.EMPLOYEE JOIN (
	SELECT Ssn
	FROM COMPANY.EMPLOYEE
	WHERE Fname='Carlos' AND Minit='D' AND Lname='Gomes'						
	) AS T
ON Super_ssn=T.Ssn;

-- c)
-- π Pname, totalhours (γ Pname; sum(Hours) -> totalhours (project ⨝ Pnumber=Pno works_on))
SELECT Pname, sum([Hours]) as totalhours
FROM COMPANY.PROJECT JOIN COMPANY.WORKS_ON ON Pnumber=Pno
GROUP BY Pname;

-- d) 
-- π Fname, Minit, Lname, Ssn (π Fname, Minit, Lname, Ssn (σ Dno=3 (employee)) ⨝ Ssn=works_on.Essn (πPno, Essn (σ Hours>20 (works_on)) ⨝ Pno=Pnumber π Pnumber (σ Pname='Aveiro Digital' (project))))

SELECT Fname, Minit, Lname
FROM (
	SELECT Pno, Essn
	FROM COMPANY.WORKS_ON
	WHERE [Hours]>20
	) as W
JOIN
	(
	SELECT Pnumber
	FROM COMPANY.PROJECT
	WHERE Pname='Aveiro Digital'
	) as P
ON Pno=Pnumber
JOIN 
	(
	SELECT Fname, Minit, Lname, Ssn
	FROM COMPANY.EMPLOYEE
	WHERE Dno=3
	) AS E
ON Ssn=Essn;


-- e)
-- π Fname, Minit, Lname (σ Essn=null (π Fname, Minit, Lname, Ssn (employee) ⟕ Ssn=Essn works_on))

SELECT Fname, Minit, Lname
FROM COMPANY.EMPLOYEE LEFT OUTER JOIN COMPANY.WORKS_ON ON Ssn=Essn
WHERE Essn IS NULL;

-- f)
-- π Dname, avg_salary (γ Dname; avg(Salary) -> avg_salary (π Dnumber, Dname (department) ⨝ Dnumber=Dno π Salary, Dno (σ Sex='F' (employee)))) 

SELECT Dname, avg(Salary) as avg_Salary
FROM COMPANY.DEPARTMENT JOIN (
	SELECT Salary, Dno
	FROM COMPANY.EMPLOYEE
	WHERE Sex='F'
	) as E
	ON Dnumber=Dno
GROUP BY Dname;

-- g)
-- σ depend>2 (π Fname, Minit, Lname, depend (γ Ssn, Fname, Minit, Lname; Count(Ssn) -> depend (π Ssn, Fname, Minit, Lname (employee) ⨝ Ssn=Essn π Essn, Dependent_name (dependent))))

SELECT Fname, Minit, Lname, count(Essn) as Num_dep
FROM COMPANY.EMPLOYEE
	JOIN
	(
	SELECT Essn
	FROM COMPANY.[DEPENDENT]
	) AS D
	ON
	Ssn=Essn
GROUP BY Fname, Minit, Lname
HAVING count(Essn)>2;

-- h)
-- π Fname, Minit, Lname (π Mgr_ssn (department) ⨝ Mgr_ssn=Ssn σ Essn=null (π Ssn, Fname, Minit, Lname (employee) ⟕ Ssn=Essn π Essn, Dependent_name (dependent)))

SELECT Fname, Lname
FROM COMPANY.EMPLOYEE JOIN COMPANY.DEPARTMENT ON Ssn=Mgr_ssn
	LEFT OUTER JOIN COMPANY.[DEPENDENT] ON Ssn=Essn
WHERE Essn IS NULL;


-- i)
-- 

SELECT DISTINCT Fname, Minit, Lname, [Address]
FROM COMPANY.EMPLOYEE JOIN COMPANY.WORKS_ON ON Ssn=Essn JOIN 
	(
	SELECT Pname, Pnumber
	FROM COMPANY.PROJECT
	WHERE Plocation='AVEIRO'
	) as P
	ON Pno=P.Pnumber
WHERE 'AVEIRO' NOT IN (
	SELECT Dlocation
	FROM COMPANY.DEPT_LOCATION
	WHERE DEPT_LOCATION.Dnumber=EMPLOYEE.Dno
);

-------------------


-- 5.2 a)
-- π nif, nome (σ encomenda.numero=null (fornecedor ⟕ nif=fornecedor encomenda))
select F.nif, F.nome
from fornecedor as F left join encomenda as E on F.nif = E.fornecedor
where E.numero is null


-- b)
-- γ codProd; avg(unidades) -> media_unidades (item)
select codProd, avg(unidades) as media_unidades
from item
group by codProd

-- c)
-- γ avg(num_prod) -> avg_prod_enc (γ numEnc; sum(codProd) ->num_prod item)
select avg(num_prod) as avg_prod_enc
from
	(select sum(I.codProd) as num_prod
	from item as I) as I

-- d)
-- γ codigo, fornecedor; sum(item.unidades)->unid_por_produto (item ⨝ codProd=codigo produto ⨝ numEnc=numero encomenda)
select P.codigo, E.fornecedor, sum(I.unidades) as unid_por_produto 
from item as I join produto as P on I.codProd=P.codigo join encomenda as E on I.numEnc=E.numero
group by P.codigo, E.fornecedor

-- 5.3
-- a)
-- π numUtente, nome (σ numPresc=null (π numUtente, nome (paciente) ⟕ prescricao))
select PA.numUtente, PA.nome
from paciente as PA left join prescricao as PR on PA.numUtente=PR.numUtente
where PR.numPresc is null

-- b)
-- π especialidade, num (γ especialidade; count(especialidade) -> num ((prescricao ⨝ numMedico=numSNS medico)))
select especialidade, count(especialidade) as num
from prescricao join medico on numMedico=numSNS
group by especialidade

-- c)
-- π farmacia, num (γ farmacia; count(numPresc) -> num (σ farmacia != null (prescricao)))
select farmacia, count(numPresc) as num
from prescricao
where farmacia is not null
group by farmacia

-- d)
-- π farmaco.numRegFarm, nome (σ numPresc=null (σ numRegFarm=906 (farmaco) ⟕ nome=nomeFarmaco presc_farmaco))
select F.numRegFarm, F.nome
from farmaco as F left join presc_farmaco as P on F.nome=P.nomeFarmaco
where P.numPresc is null and F.numRegFarm=906

-- e)
-- π farmacia, numRegFarm, num (γ farmacia, numRegFarm; count(prescricao.numPresc) -> num (σ farmacia!=null (π prescricao.numPresc, farmacia (prescricao)) ⨝ prescricao.numPresc=presc_farmaco.numPresc (presc_farmaco)))
select P.farmacia, PF.numRegFarm, count(P.numPresc) as num
from
(
	select numPresc, farmacia
	from prescricao
	where farmacia is not null
) as P
join presc_farmaco as PF on P.numPresc=PF.numPresc
group by P.farmacia, PF.numRegFarm

-- f)
-- π numUtente (σ num>1 (π numUtente,num (γ numUtente; count(numUtente) -> num (π numUtente, numMedico, num (γ numUtente, numMedico; count(numUtente) -> num prescricao)))))
select numUtente
from (
	select numUtente, count(numUtente) as num
	from (
		select numUtente, numMedico, count(numUtente) as num
		from prescricao
		group by numUtente, numMedico
	) as P
	group by numUtente

) as P
where num > 1


