/*sub Query*/

--1) den의 급여
select salary
from employees
where first_name = 'Den';

--2) 전체 쿼리문 구조
select first_name,
       salary
from employees
where salary >= 11000;

--3) 쿼리문 완성  ----> 들여쓰기 잘할것
select first_name,
       salary
from employees
where salary >= (select salary
                 from employees
                 where first_name = 'Den');
                 
--급여를 가장 적게 받는 사람의 이름,금여,사원번호는?
select first_name,
       salary,
       employee_id
from employees
where salary = (select min(salary)
                from employees);
                
--평균 급여보다 적게 받는 사람의 이름, 급여를 출력하세요
select first_name,
       salary
from employees
where salary < (select avg(salary)
                from employees);