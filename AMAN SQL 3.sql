 create database company21;
use company21;
create table Employees0(
emp_id int,
first_name varchar(50),
last_name varchar(50),
department varchar(20),
salary float,
hire_date date);

select * from Employees0;
insert into Employees0(emp_id,first_name,last_name,department,salary,hire_date)
values(1,"John","Doe","IT",60000.00,"2019-01-10"),
      (2,"Jane","Smith","HR",55000.00,"2018-03-05"),
      (3,"Emily","Jones","IT",62000.00,"2020-07-23"),
      (4,"Michael","Brown","Finance",70000.00,"2016-05-14"),
      (5,"Sarah","Davis","Finance",69000.00,"2017-09-10"),
      (6,"David","Johnson","HR",48000.00,"2021-09-10");
      
 ###1. Find the average salary of employees in each department.###      
select department, AVG(salary) AS average_salary FROM Employees0 GROUP BY department;
###2. Find the total number of employees hired after 2019.### 
select COUNT(*) AS total_employees_hired_after_2019 FROM Employees0 WHERE hire_date > '2019-01-10';
##3. List the departments and the total salary of all employees in each department, ordered by the total salary.### 
select department, SUM(salary) AS total_salary from Employees0 group by department order by total_salary DESC;
###4. Find the highest salary in the Finance department.### 
select MAX(salary) as highest_salary  from Employees0 where department = 'Finance';
###5. Get the top 3 highest-paid employees.### 
select emp_id, salary from Employees0 order by salary desc limit 3;
###6. Find the department with the minimum average salary.###  
select department, avg(salary) as average_salary from Employees0 group by department order by average_salary asc limit 1;
###7. Display the total number of employees in each department, ordered by the number of employees.### 
select department, COUNT(*) as total_employees from Employees0 group by department order by total_employees desc;
###8. Find the average salary of employees who were hired before 2020.### 
select avg(salary) as average_salary_before_2020 from Employees0 where hire_date < '2020-07-23';
###9. List the names of employees in the IT department ordered by hire date, with the most recently hired employees first.### 
select first_name from Employees0 where department = 'IT' order by hire_date desc;
###10. Find the sum of salaries for all employees hired after January 1, 2019, ordered by salary.### 
select salary, SUM(salary) as total_salary from Employees0 where hire_date > '2019-01-10' group by salary order by salary;
###11. Get the employee with the lowest salary in the HR department.### 
select SUM(salary) as total_salary_after_2019 from Employees0 where hire_date > '2019-01-10';
###12. Find the total salary paid to employees in each department, but limit the result to the top 2 highest-paying departments.### 
select department, SUM(salary) as total_salary from Employees0 group by department order by total_salary desc limit 2;
###13. List all employees hired after 2018, ordered by salary, and show only the first 4 employees.###  
select emp_id, first_name, salary from Employees0 where hire_date > '2018-03-05' order by salary desc limit 4;
###14. Find the highest salary in the IT department, but limit the results to the top 1 result.###   
select MAX(salary) as highest_salary from Employees0 where department = 'IT' limit 1;
###15. Get the average salary of employees in each department and list only departments with an average salary greater than $60,000.###  
select  department, avg(salary) as average_salary from Employees0 group by department having avg(salary) > 60000 order by average_salary desc;