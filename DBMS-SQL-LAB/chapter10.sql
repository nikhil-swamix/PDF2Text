--10.1

create table student_marks
(rn number(3) not null,
year number(1) not null,
marks number(S,2) not null,
remarks varchar2(20) ,
Constraint ck_student_marks_rn
Check (rn between 1 and 250),
constraint ck_student_marks_year
check (year between 1 and 3),
Constraint ckstudent_marks_marks
check (marks between Q and 100));

--10.2
create table student
(rn number(3) not null,
city varchar2(20) not null,
name varchar2(30) not null,
constraint ck1_student_rn
check (rn between 1 and 250),
constraint ck2_student_name
check(name between 'a' and 'z'),
constraint ck3_student_city
check(length(city) between 1 and 3 and city between 'a' and 'z'),
check (substr(name,1,1) between 'a' and 'z' ),
constraint ck4_student_city
check (length (city) = 3 and city = upper(city)));

--10.3
create table student
(rn number(3), name varchar2(30), year date, univ varchar2(10),
branch varchar2(20), en number(4), constraint uk1_student_en unique(en),
constraint pk1_student primary key (rn, year, branch);

--10.4
create table abc
(a number(2), b number(2), c number(2), d number(2),
e number(2), constraint pkl_abc primary key (a,b),
constraint uk1_abc unique (e), constraint uk2_abc unique (c,d));

--10.5
insert into ABC values (1,1,1,1,1);

--10.6
select * from ABC;

--10.7
create table parent
(a number(2), b number(2), c number(2),
constraints pk_parent primary key(b,c));

--10.8
create table child
(d number(2), e number(2), f number(2),
constraints fk_child foreign key (e,f)
references parent (b,c));

--10.9
create Table employee_mgr
(mname varchar2(20), ename varchar2(20) primary key,
salary number(8,2), constraints FK_1employee_mgr foreign key (ename)
references employee (ename));

--10.10
alter table employee add constraint pk_employee primary key(ename)

--10.11
create Table T1
(A number(2), B number(2),
constraint PK_T1 primary key (A,8));

--10.12
CREATE TABLE S
(C NUMBER(2), D NUMBER(2):

--10.13
SELECT * FROM s;

--10.14
insert into TL (A,8)
select C,D from S;

--10.15
alter table Tl
enable constraint PK_T1;

--10.16
create table excp_table
(ronid rowid, owner varchar2(30),
table_name varchar2(30), constraint varchar2(30));

--10.17
desc EXCP_TABLE;

--10.18
alter table tl
enable constraint pk_tl
exceptions into excp_table;

--10.19
alter table t1
enable constraint pk_tl
exceptions into excp_table;

--10.20
create table t2
(a number(2), b number(2), c number(2),
constraint ch_a check (a>1), constraint ck_b check (b>1),
constraint ck_c check (c>1)
initially deferred deferrable):

--10.21
set constraint ck_c immediate;

--10.22
set constraint all 	immediate;

--10.23
select p.a pa,p.b pb,c.a ca,c.c cc
from newparent p,newchild c where p.a=c.a;

--10.24
create view parent_child as
select p.a pa, p.b pb, c.a ca, c.c cc
from newparent p,newchild.c
where p.a = c.a;
SELECT  * from parent_child;

--10.25
SELECT  * from parent_child;

--10.26
UPDATE parent_child set cc=1 WHERE cc=2;

/*EXCERCISE*/
--1 
alter table employee add constraint pk_employee primary key(ename);
--2 
alter table emp_company add constraint ck_emp_company_salary_acc check (salary > 3000 and cname ='ACC');
--3 
alter table emp_company add constraint fk_emp_company foreign key (ename) references employee (ename);











