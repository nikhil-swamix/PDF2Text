--13.1
select e.ename, e.city, c.salary from employee e, emp_company c where e.ename = c.ename;
--13.2
select ename,city, salary from employee natural join emp_company; 
--13.3
select e.ename,city, salary from employee e cross join emp_company;
--13.4
select c.ename, m.mname, c.salary from manager m, emp_company c where c.ename = m.ename and salary < 3000;
--13.5
select ename, mname, salary from manager join emp_company using(ename) where salary < 3000;
select c.ename, m.mname, c.salary from manager m join emp_company c on (c.ename = m.ename and salary < 3000);
--13.6
select * from emp_shift;
--13.7
select * from manager;
--13.8
select ename, mname, shift from manager natural join emp_shift;
--13.9
select ename, mname, shift from manager left outer join emp_shift using(ename);
--13.10
select ename, mname, shift from manager right outer join emp_shift using(ename);
--13.11
select ename, mname, shift from manager full outer join emp_shift using(ename);
--13.12
select decode(trunc(phy/25), 4,'a',3,'b',2,'c',1,'d') grade from marks;
--13.13
select decode(trunc(phy/25), 4,'a',3,'b',2,'c',1,'d') grade, count(1) cnt from marks group by decode(trunc(phy/25), 4,'a',3,'b',2,'c',1,'d');
--13.14
select g.g, nvl(m.cnt,0) from(select decode(trunc(phy/25), 4,'a',3,'b',2,'c',1,'d') grade, count(1) cnt from marks group by decode(trunc(phy/25), 4,'a',3,'b',2,'c',1,'d'))m, grademaster g where g.g=m.grade(+);

/*EXCERCISES*/
--1
select ename from emp_company natural join company where city= 'NAGPUR';
--2
select ename from emp_company natural join company natural join emp_shift where city ='NAGPUR' and shift='B';
--3
select ec.ename from emp_company ec join company c on(ec.cname =c.cname) join emp_shift s on(ec.ename=s.ename) join employee e on(ec.ename=e.ename) where c.city ='NAGPUR' and shift='B' and e.city='MUMBAI';
--4
select ename from employee natural join emp_company natural join company;
--5
select ename from employee natural join emp_company where city ='NAGPUR' and salary >2000;

