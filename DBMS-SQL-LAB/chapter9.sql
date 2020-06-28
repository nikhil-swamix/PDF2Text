--9.1
create table emp2(ename varchar2(10), mname varchar2(10), salary number, rating number);        
insert into emp2 values('&ename', '&mname', &salary, &rating);

--9.2
select ename, mname, salary, level from emp2 start with mname ='abhay' connect by prior ename=mname;

--9.3
select ename, mname, level from emp2 connect by prior ename =mname;

--9.4
select ename, mname, level from emp2 connect by prior mname =ename;

--9.5
select ename, connect_by_isleaf isleaf, sys_connect_by_path(ename,'/') abspath, level from emp2 start with ename ='chairman' connect by prior ename =mname;

--9.6
select ename, connect_by_isleaf isleaf, sys_connect_by_path(ename,'/') abspath, level, connect_by_iscycle cycle from emp2 start with ename ='vijay' connect by prior ename =mname;

--9.7
select ename, connect_by_isleaf isleaf, sys_connect_by_path(ename,'/') abspath, level from emp2 start with ename ='chairman' connect by prior ename =mname order siblings by ename;

--9.8
select ename from emp2 start with mname ='sunil' connect by prior ename = mname;

--9.9
select count(*), d.dname from (select ename from emp2 start with mname ='abhay' connect by prior ename=mname)z, dept d where z.ename =d.ename group by d.dname;

--9.10
select e1.ename from emp2 e1 where not exists (select distinct e2.mname from emp e2 where e2.mname = e1.mname);

--9.11
select count('no_of_emp'), level from emp2 start with ename = 'chairman' connect by prior ename =mname group by level;

--9.12
select z1.ename from (select ename e1, level l1 from emp2 start with ename ='chairman' connect by prior ename =mname)z, emp2 z1 where z.l1 =3 and z.e1 = z1.ename;

--9.13
select sum(salary) from emp2 z3 where z3.ename in(select distinct z1.ename from (select ename e1, level l1 from emp2 start with ename ='chairman' connect by prior ename =mname)z, emp2 z1 where z.l1 =3 and z.e1 = z1.ename);

--9.14
select z3.ename from emp2 z3 where z3.ename in (select z1.ename from (select ename e1, level l1 from emp2 start with ename ='chairman' connect by prior ename =mname)z, emp2 z1 where z.l1 =3 and z.e1 = z1.ename) and  z3.rating in (select max(rating) from emp2 z3 where z3.ename in (select z1.ename from (select ename e1, level l1 from emp2 start with ename ='chairman' connect by prior ename =mname)z, emp2 z1 where z.l1 =3 and z.e1 = z1.ename));

--9.15
select count(z3.e1) from (select ename e1, level l1 from emp2 connect by prior ename =mname start with ename = 'chairman')z3,  (select z2.l1 from (select distinct level l1 from emp2 connect by prior ename =mname start with ename = 'chairman')z1,(select distinct level l1 from emp2 connect by prior ename =mname start with ename = 'chairman')z2 where z2.l1 >= z1.l1 group by z2.l1 having count(*) =3)z4 where z3.l1= z4.l1;

--9.16
select count(z3.e1), sum(z3.s1) from (select ename e1, salary s1, level l1 from emp2 connect by prior ename =mname start with ename = 'chairman')z3,  (select z2.l1 from (select distinct level l1 from emp2 connect by prior ename =mname start with ename = 'chairman')z1,(select distinct level l1 from emp2 connect by prior ename =mname start with ename = 'chairman')z2 where z2.l1 >= z1.l1 group by z2.l1 having count(*) =2)z4 where z3.l1= z4.l1;

--9.17
select ename, mname, level from emp4 connect by prior mname=ename;

--9.18
create table z(sr number, amt number);

select z2.sr, z2.amt, sum(z1.amt) from z z1, z z2 where z1.sr <= z2.sr group by z2.sr, z2.amt;
--9.19
select z2.amt from z z1, z z2 where z2.amt <= z1.amt group by z2.amt having count(z2.amt) = 2;

--9.20
select z3.sr from(select z2.sr,sum(z1.amt)amt from z z1, z z2 where z1.sr <= z2.sr group by z2.sr)z3 where z3.amt in(select max(z4.amt) from (select z2.sr,sum(z1.amt)amt from z z1, z z2 where z1.sr <= z2.sr group by z2.sr)z4);

--9.21
select z2.sr2, sum(z1.amt1) from ( select sr sr1, sum(amt) amt1 from z group by sr)z1, ( select sr sr2, sum(amt) amt2 from z group by sr)z2 where z1.sr1 <= z2.sr2 group by z2.sr2, z2.amt2;

--9.22
select z1.bname, z1.tamt from(select d1.bname, sum(d1.amount)tamt from deposit d1 group by d1.bname)z1, (select distinct sum(d2.amount)tamt from deposit d2 group by d2.bname)z2 where z2.tamt >= z1.tamt group by z1.bname, z1.tamt having count(z1.bname) = 5;

--9.23
select d3.cname from deposit d3 where not exists (select c2.city from customer c2 where c2.cname = d3.cname) minus (select c1.city from customer c1 where c1.cname ='ANIL');

--9.24
delete z z1 where(z1.sr, z2.amt from z z2 group by z2.sr, z2.amt having count(*) >1);

--9.25
delete z z1 where z1.rowid < any (select z2.rowid from z z2 where z1.sr = z2.sr and z1.amt = z2.amt);

--9.26
select distinct c1.cname from company c1 where not exists ((select c2.city from company c2 where c2.cname='ACC')minus (select c3.city from company c3 where c3.cname =c1.cname));

--9.27
select * from marks;

--9.28
select rn,phy decode((trunc(phy/25)),0, 'A', 1, 'B', 2, 'C', 'D') from marks;

--9.29
select cname, sum(salary) from emp_company group by cname;

--9.30
select ename, salary from(select ename , nvl(salary,0)salary from emp_company order by salary des) where rownum <4;


-- EXERCISES
--2
 select count(ename)no_of_employee,sum(salary) from emp2 ;
--3
 select distinct c1.cname from company c1 where not exists ((select c2.city from company c2 where c2.cname='HLL')minus (select c3.city from company c3 where c3.cname =c1.cname));
--4
 select ename, salary from(select ename , nvl(salary,0)salary from emp_company order by salary des) where rownum <4;
