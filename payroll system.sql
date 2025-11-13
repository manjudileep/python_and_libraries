create database payroll_system;
use payroll_system;
create table emp_table(emp_id int primary key,
                       emp_name varchar(255),
                       department varchar(100),
                       position varchar(100),
                       hire_date date,
                       base_salary decimal(10,2));
create table attendance(att_id int primary key,
                        emp_id int,
                        att_date date,
                        status enum('present','absent','leave'));      
create table salaries(salary_id int primary key,
                      employee_id int,
                      base_salary decimal(10,2),
                      bonus decimal(10,2),
                      deductions decimal(10,2),
                      month varchar(20),
                      year int);
create table payroll(payroll_id int primary key,
                     emp_id int,
                     total_salary decimal(10,2),
                     payment_date date);
insert into emp_table(emp_id,emp_name,department,position,hire_date,base_salary)
values
(1,"vijay","sales","manager","2022-5-13",20000),
(2,"vineeth","sales","bm","2024-2-03",18000),
(3,"vinu","technician","assistant","2025-10-05",12000),
(4,"anju","telecaller","staff","2025-11-15",9000),
(5,"siva","store","staff","2023-4-22",10000),
(6,"arjun","sales","jmc","2022-6-27",15000);

insert into attendance(att_id,emp_id,att_date,status)
values
(1,1,"2025-11-12",'present'),
(3,2,"2025-11-12",'absent'),
(5,3,"2025-11-12",'present'),
(2,4,"2025-11-12",'leave'),
(4,5,"2025-11-12",'present'),
(6,6,"2025-11-12",'present');
insert into salaries(salary_id,employee_id,base_salary,bonus,deductions,month,year)
values
(1,1,20000,1000,150,"march","2023"),
(2,3,12000,1000,0,"october","2022"),
(3,2,18000,1000,200,"november","2025"),
(4,4,9000,1000,100,"december","2025"),
(5,6,15000,1000,0,"may","2023"),
(6,5,10000,1000,200,"june","2023");
insert into payroll(payroll_id,emp_id,total_salary,payment_date)
values
(1,1,20000,'2025-01-01'),
(2,2,12000,'2025-01-01'),
(3,3,18000,'2025-01-01'),
(4,4,9000,'2025-01-01'),
(5,5,15000,'2025-01-01'),
(6,6,10000,'2025-01-01');

SET SQL_SAFE_UPDATES = 0;
#add new employee

insert into emp_table(emp_id ,emp_name,department,position,hire_date,base_salary)
value
(7,"manju","accounts","HOD","2025-12-12",25000);

#update employee information

update emp_table
set position="am"
where emp_name="arjun";

#delete employee records

delete from emp_table where emp_id=6;

#track employee attendance

select emp_table.emp_id,emp_table.emp_name,attendance.att_date,attendance.status 
from emp_table
inner join attendance
on emp_table.emp_id=attendance.emp_id;

#calculate salary

select emp_table.emp_id,emp_table.emp_name,salaries.base_salary,salaries.bonus,salaries.deductions,salaries.month,salaries.year,(salaries.base_salary+salaries.bonus-salaries.deductions)as net_salary
from emp_table
inner join salaries
on emp_table.emp_id=salaries.employee_id;

#manage deductions and bonuses

SET SQL_SAFE_UPDATES = 0;
update salaries
set bonus=2000
where employee_id=4;
update salaries
set deductions=150
where employee_id=5;

#update payroll records

select payroll.emp_id,emp_table.emp_name,payroll.payroll_id,payroll.total_salary,payroll.payment_date,(salaries.base_salary+salaries.bonus-salaries.deductions)as net_salary
from emp_table
inner join payroll
on emp_table.emp_id=payroll.emp_id
inner join salaries
on emp_table.emp_id=salaries.employee_id;
#generate payslips

select emp_table.emp_id,emp_name,salaries.base_salary,salaries.bonus,salaries.deductions,(salaries.base_salary+salaries.bonus-salaries.deductions)as net_amount
from emp_table
inner join salaries
on emp_table.emp_id=salaries.employee_id
where emp_id=1;
select emp_table.emp_id,emp_name,salaries.base_salary,salaries.bonus,salaries.deductions,(salaries.base_salary+salaries.bonus-salaries.deductions)as net_amount
from emp_table
inner join salaries
on emp_table.emp_id=salaries.employee_id
where emp_id=2;
select emp_table.emp_id,emp_name,salaries.base_salary,salaries.bonus,salaries.deductions,(salaries.base_salary+salaries.bonus-salaries.deductions)as net_amount
from emp_table
inner join salaries
on emp_table.emp_id=salaries.employee_id
where emp_id=3;
select emp_table.emp_id,emp_name,salaries.base_salary,salaries.bonus,salaries.deductions,(salaries.base_salary+salaries.bonus-salaries.deductions)as net_amount
from emp_table
inner join salaries
on emp_table.emp_id=salaries.employee_id
where emp_id=4;
select emp_table.emp_id,emp_name,salaries.base_salary,salaries.bonus,salaries.deductions,(salaries.base_salary+salaries.bonus-salaries.deductions)as net_amount
from emp_table
inner join salaries
on emp_table.emp_id=salaries.employee_id
where emp_id=5;

#generate payroll reports

select emp_table.emp_id,emp_table.emp_name,emp_table.department,emp_table.position,emp_table.hire_date,emp_table.base_salary,attendance.att_date,
   salaries.bonus,salaries.deductions,salaries.month,salaries.year,
    payroll.payment_date,(salaries.base_salary+salaries.bonus-salaries.deductions)as net_amount
from emp_table
inner join attendance
on emp_table.emp_id=attendance.emp_id
inner join salaries
on emp_table.emp_id=salaries.employee_id
inner join payroll
on emp_table.emp_id=payroll.emp_id


