create database assignment6;
use assignment6;
create table employee(emp_id int,
                      name varchar(50),
                      department varchar(50),
                      salary int);
insert into employee(emp_id, name, department, salary)
values (1,'John','HR',5000),
	   (2,'Alice','IT',7000),
       (3,'Bob','Finance',6000),
       (4,'Eve','IT',8000),
       (5,'Charlie','Finance',7500);
   select * from employee;                    
create table departments(dept_id int,dept_name varchar(50));
insert into    departments(dept_id,dept_name)
values(1,'HR'),
      (2,'IT'),
      (3,'Finance');
select * from departments;      

#. Find employees with salaries greater than the average salary of all employees. 
select name from employee where salary >(select avg(salary) from employee);

#2. Find employees whose salary is higher than the salary of 'Alice'. 
select name from employee where salary > (select salary from employee where name = 'Alice');

#3. List employees who belong to a department that has the name 'IT'. 
select name from employee where department = 'IT';

#4. Get the names of employees who earn the highest salary in their department.
select department,name from employee where department = (select department from employee group by department having salary = max(salary));
 
#5. Retrieve the departments where at least one employee earns more than 7000.
select department from employee where emp_id in (select emp_id from employee group by emp_id having salary>7000 );
 
#6. List employees who do not belong to any department in the departments table. 
select name from employee where department not in (select dept_name from departments );

#7. Find the second-highest salary among employees.
select max(salary) from employee where salary < (select max(salary) from employee); 
 
#8. Retrieve the names of employees who work in the department with the highest number of employees. 
#select name from employee where department = (select department from employee group by department order by count(emp_id) desc limit 1);
select e.name,e.department from employee e where e.emp_id =(select d.dept_id from departments d join employee e on d.dept_id = e.emp_id group by d.dept_id order by count(*) desc limit 1);
with DepartmentCounts as (select department,COUNT(*) as EmployeeCount from employee group by Department)select e.name from employee e inner join DepartmentCounts dc on e.Department = dc.Department where dc.employeeCount = (select max(employeeCount) from DepartmentCounts);
select name from employee where department =(select department from(select department,count(*)as employee_count from employee group by department order by employee_count desc limit 1)as Top_department);
#select name from employee where department = (select department from employee group by department having count(*)  =
        # (select max(count(*)) from (select count(*)  from employee group by department) )  );

#9. Find employees who earn more than the average salary in their department. 
select e.name, e.Department, e.Salary, d.AvgSalary from employee e join (select Department, avg(Salary) as AvgSalary from employee group by Department) d on e.Department = d.Department where e.Salary > d.AvgSalary;
select name,department,salary from employee e1 where salary > (select avg(salary) from employee e2 where e1.department = e2.department); 

#10. Retrieve employees whose salary is above 7000 and belong to departments in the departments table. 
select name, department from employee e where emp_id in (select e.emp_id from departments d group by  d.dept_id having salary>7000 );

#11. List all departments that have no employees. 
select name,department from employee where department  in (select  department from employee where emp_id is  null);
select d.dept_id,d.dept_name from departments d left join employee e on d.dept_id=e.emp_id where e.department is null;
select  department from employee where emp_id is  null;
#12. Find employees who have the same salary as another employee in a different department.
select name from employee e1 where salary  in (select salary from employee e2 where e1.department<>e2.department);
select e1.emp_id as emp_id_1,e1.name as Employee_name_1,e1.department as dept_id_1,e2.emp_id as employee_id_2,e2.name as Employee_name_2,e2.dept_id as department_id_2,e1.salary from employee e1 join employee e2 on e1.salary = e2.salary and e1.dept_id <> e2.dept_id where e1.id <e2.id order by e1.salary;

#13. Get the total salary of the department with the maximum total salary. 
select sum(salary) from employee where department = 
                  (select department from employee group by department  order by sum(salary) desc limit 1);

#14. Retrieve employees whose department has more than two employees.
select name from employee where department = (select department from employee group by department having count(emp_id)>2);
 
#15. Find employees whose salary is higher than the average salary of employees in the IT department. 
select name from employee where salary > (select avg(salary) from employee where department = "IT");