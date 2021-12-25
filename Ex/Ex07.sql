/*sub Query(단일행)*/

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
                
                
/*sub Query(다중행)*/
--부서번호가 110인 직원의 금여와 같은 모든 직원의 사번,이름,급여를 출력하세요
--1. 부서번호가 110인 직원의 급여리스트를 구한다.
select salary,
       department_id
from employees
where department_id = 110;

--2. 급여가 12008, 8300인 직원의 리스트를 구한다.
select employee_id,
       first_name,
       salary
from employees
where salary = 12008
or salary = 8300;

--위랑 같은 표현
select employee_id,
       first_name,
       salary
from employees
where salary in (12008, 8300);

--3. 값을 모를때 서브쿼리 사용(두식을 조합한다)
select employee_id,
       first_name,
       salary
from employees
where salary in(select salary
                from employees
                where department_id = 110);

--예제) 각 부서별로 최고급여를 받는 사원을 출력하세요.
select department_id,
       max(salary)
from employees
group by department_id;

select department_id,
       first_name,
       salary
from employees
where (department_id, salary) in (select department_id,
                                         max(salary)
                                  from employees
                                  group by department_id);
                                  
--any 연산자
--부서번호가 110인 직원의 급여 보다 큰 모든 직원의
--사번, 이름, 급여를 출력하세요.(or연사--> 8300보다 큰)

--1. 부서번호가 100인 직원의 급여
select salary
from employees
where department_id = 110;

--2. 부서번호가 110안(12008, 8300) 보다 급여가 큰직원 
select employee_id,
       first_name,
       salary
from employees
where salary > 12008
or salary > 8300;

--3. 조합
select employee_id,
       first_name,
       salary
from employees
where salary >any (select salary
                   from employees
                   where department_id = 110);
                   
--all 연산자
--부서번호가 110인 직원의 급여 보다 큰 모든 직원의 
--사번, 이름, 급여를 출력하세요.(and연산--> 12008보다 큰)
select first_name, 
       salary
from employees
where salary >all (select salary
                   from employees
                   where department_id = 110);
                   
--각 부서별로 최고급여를 받는 사원을 출력하세요.

--01. 각 부서별 최고 급여 리스트
select department_id,
       max(salary)
from employees
group by department_id;

--02. 직원리스트에서 부서별 최고 급여를 받는 사람을 구한다.
select first_name,
       salary,
       department_id
from employees
where salary = 4400;

--03. 조합
select department_id,
       salary,
       first_name
from employees
where (department_id, salary) in (select department_id,
                                         max(salary)
                                  from employees
                                  group by department_id);