CREATE TABLE employee4 (
  emp_id INT PRIMARY KEY,
  first_name VARCHAR(40),
  last_name VARCHAR(40),
  birth_day DATE,
  sex VARCHAR(1),
  salary INT,
  super_id INT,
  branch_id INT
);

CREATE TABLE branch4 (
  branch_id INT PRIMARY KEY,
  branch_name VARCHAR(40),
  mgr_id INT,
  mgr_start_date DATE,
  FOREIGN KEY(mgr_id) REFERENCES employee4(emp_id) ON DELETE SET NULL
);

ALTER TABLE employee4
ADD FOREIGN KEY(branch_id)
REFERENCES branch4(branch_id)
ON DELETE SET NULL;

ALTER TABLE employee4
ADD FOREIGN KEY(super_id)
REFERENCES employee4(emp_id)
ON DELETE SET NULL;

CREATE TABLE client4 (
  client_id INT PRIMARY KEY,
  client_name VARCHAR(40),
  branch_id INT,
  FOREIGN KEY(branch_id) REFERENCES branch4(branch_id) ON DELETE SET NULL
);

CREATE TABLE works_with4 (
  emp_id INT,
  client_id INT,
  total_sales INT,
  PRIMARY KEY(emp_id, client_id),
  FOREIGN KEY(emp_id) REFERENCES employee4(emp_id) ON DELETE CASCADE,
  FOREIGN KEY(client_id) REFERENCES client4(client_id) ON DELETE CASCADE
);

CREATE TABLE branch_supplier4 (
  branch_id INT,
  supplier_name VARCHAR(40),
  supply_type VARCHAR(40),
  PRIMARY KEY(branch_id, supplier_name),
  FOREIGN KEY(branch_id) REFERENCES branch4(branch_id) ON DELETE CASCADE
);


-- -----------------------------------------------------------------------------

-- Corporate
INSERT INTO employee4 VALUES(100, 'David', 'Wallace', '1967-11-17', 'M', 250000, NULL, NULL);

INSERT INTO branch4 VALUES(1, 'Corporate', 100, '2006-02-09');

UPDATE employee4
SET branch_id = 1
WHERE emp_id = 100;

INSERT INTO employee4 VALUES(101, 'Jan', 'Levinson', '1961-05-11', 'F', 110000, 100, 1);

-- Scranton
INSERT INTO employee4 VALUES(102, 'Michael', 'Scott', '1964-03-15', 'M', 75000, 100, NULL);

INSERT INTO branch4 VALUES(2, 'Scranton', 102, '1992-04-06');

UPDATE employee4
SET branch_id = 2
WHERE emp_id = 102;

INSERT INTO employee4 VALUES(103, 'Angela', 'Martin', '1971-06-25', 'F', 63000, 102, 2);
INSERT INTO employee4 VALUES(104, 'Kelly', 'Kapoor', '1980-02-05', 'F', 55000, 102, 2);
INSERT INTO employee4 VALUES(105, 'Stanley', 'Hudson', '1958-02-19', 'M', 69000, 102, 2);

-- Stamford
INSERT INTO employee4 VALUES(106, 'Josh', 'Porter', '1969-09-05', 'M', 78000, 100, NULL);

INSERT INTO branch4 VALUES(3, 'Stamford', 106, '1998-02-13');

UPDATE employee4
SET branch_id = 3
WHERE emp_id = 106;

INSERT INTO employee4 VALUES(107, 'Andy', 'Bernard', '1973-07-22', 'M', 65000, 106, 3);
INSERT INTO employee4 VALUES(108, 'Jim', 'Halpert', '1978-10-01', 'M', 71000, 106, 3);


-- BRANCH SUPPLIER
INSERT INTO branch_supplier4 VALUES(2, 'Hammer Mill', 'Paper');
INSERT INTO branch_supplier4 VALUES(2, 'Uni-ball', 'Writing Utensils');
INSERT INTO branch_supplier4 VALUES(3, 'Patriot Paper', 'Paper');
INSERT INTO branch_supplier4 VALUES(2, 'J.T. Forms & Labels', 'Custom Forms');
INSERT INTO branch_supplier4 VALUES(3, 'Uni-ball', 'Writing Utensils');
INSERT INTO branch_supplier4 VALUES(3, 'Hammer Mill', 'Paper');
INSERT INTO branch_supplier4 VALUES(3, 'Stamford Lables', 'Custom Forms');

-- CLIENT
INSERT INTO client4 VALUES(400, 'Dunmore Highschool', 2);
INSERT INTO client4 VALUES(401, 'Lackawana Country', 2);
INSERT INTO client4 VALUES(402, 'FedEx', 3);
INSERT INTO client4 VALUES(403, 'John Daly Law, LLC', 3);
INSERT INTO client4 VALUES(404, 'Scranton Whitepages', 2);
INSERT INTO client4 VALUES(405, 'Times Newspaper', 3);
INSERT INTO client4 VALUES(406, 'FedEx', 2);

-- WORKS_WITH
INSERT INTO works_with4 VALUES(105, 400, 55000);
INSERT INTO works_with4 VALUES(102, 401, 267000);
INSERT INTO works_with4 VALUES(108, 402, 22500);
INSERT INTO works_with4 VALUES(107, 403, 5000);
INSERT INTO works_with4 VALUES(108, 403, 12000);
INSERT INTO works_with4 VALUES(105, 404, 33000);
INSERT INTO works_with4 VALUES(107, 405, 26000);
INSERT INTO works_with4 VALUES(102, 406, 15000);
INSERT INTO works_with4 VALUES(105, 406, 130000);
select * from employee4 order by salary;
select * from employee4 order by  first_name,last_name;
select * from employee4 limit 5;
select first_name,last_name from employee4;
select first_name as forename,last_name as surname from employee4;
select distinct sex from employee4;
select * from employee4 order by sex, first_name,last_name;
select count (emp_id) from employee4;
select count(super_id) from employee4;
select count(emp_id) from employee4 where sex="F" AND birth_day>'1970-01-01';
select avg(salary) from employee4 where sex="M";
select sum(salary) from employee4;
select count(sex) ,sex from employee4 group by sex;
select sum(total_sales),emp_id from works_with4 group by emp_id; 
select sum(total_sales),client_id from works_with4 group by client_id;
select * from client where client_name like '%llc';
select * from employee4;
select * from branch_supplier4 where supplier_name like '%Label%';
select * from employee4 where birth_day like '____-10%';
select * from client4 where client_name like '%school%';
