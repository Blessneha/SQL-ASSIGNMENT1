
 create database Assign1
 use Assign1

 create table Customers( Customerid char(5) not null ,CompanyName varchar(40) not null,contactName char(30) null,
              Address varchar(60) null,City char(15) null,Phone char(24) null,Fax char(24) null )


create table Orders(Orderid integer not null,customerid varchar(10) not null, orderdate datetime null,
freight money null,shipname varchar(40) null, shipaddress varchar(60) null, quantity integer null)

alter table Orders add shipregion integer null
alter table Orders alter column shipregion char(8) null

alter table Orders add shippeddate datetime null
alter table Orders drop column sh
ipregion

insert into Orders values( 10,'ord01', getdate(), 100.0, 'Windstar', 'Ocean' ,1, getdate()) 


sp_rename 'Orders','Town'

select*from Town

create table Department(Dept_no varchar(8),Deptname varchar(20),location varchar(20))



insert into Department values('d1','Research','Dallas')
insert into Department values('d2','Accounting','Seattle')
insert into Department values('d3','Marketing','Dallas')

select* from Department
create table Employee(emp int,emp_fna varchar(20),emp_lna varchar(20),dept varchar(8))

insert into Employee values(25348,'Matthew','Smith','d3')
insert into Employee values(10102,'Ann','Jones','d3')
insert into Employee values(18316,'John','Barrimor','d1')
insert into Employee values(29346,'James','James','d2')

select* from Employee

create table Project(project_no varchar(8),project_name varchar(20),Budget int)

insert into Project values('p1','Apollo',120000)
insert into Project values('p2','Gemini',95000)
insert into Project values('p3','Mercury',185600)
select*from Project
create table Works_on(emp_no int,project_no varchar(8),Job varchar(20),enter_date date)


 select*from Works_on

insert into Works_on values(10102,'p1','Analyst','1997.10.1')
insert into Works_on values(10102,'p3','manager','1999.1.1')
insert into Works_on values(25348,'p2','Clerk','1998.2.15')
insert into Works_on values(18316,'p2',NULL,'1998.6.1')
insert into Works_on values(29346,'p2',NULL,'1997.12.15')
insert into Works_on values(2581,'p3','Analyst','1998.10.15')
insert into Works_on values(9031,'p1','Manager','1998.4.15')
insert into Works_on values(28559,'p1',NULL,'1998.8.1')
insert into Works_on values(28559,'p2','Clerk','1992.2.1')
insert into Works_on values(9031,'p3','Clerk','1997.11.15')
insert into Works_on values(29346,'p1','Clerk','1998.1.4')

select* from Works_on

select emp_no from Works_on where Job='Clerk'
select emp_no from Works_on where project_no='p2' and emp_no<10000
select emp_no from Works_on where not YEAR(enter_date)='1998'
select emp_no from Works_on where project_no='p1' and Job in('Analyst','Manager')
select enter_date from Works_on where project_no='p2' and Job is NULL
select emp,emp_lna from Employee where emp_fna like '%tt%'
select emp,emp_fna from Employee where emp_lna like '_[a,o]%[e,s]'

select emp from Employee left join Department on Employee.dept=Department.Dept_no where Department.location='Seattle'

select Employee.emp_fna,Employee.emp_lna from Employee inner join Works_on on Employee.emp=Works_on.emp_no where Works_on.enter_date='1998-04-01'

select location,count(Employee.dept) from Department inner join Employee on Department.Dept_no=Employee.dept group by Department.location
select max(emp) from Employee



select job from Works_on group by job having count(*)>2
select Works_on.emp_no from Works_on inner join Employee on Works_on.emp_no=Employee.emp where Works_on.Job='Clerk'and Employee.dept='d3'





 


















