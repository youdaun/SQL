/*join*/
select *
from employees, departments
where employees.department_id = departments.department_id;

--예)
select em.first_name,
       de.department_name,
       jo.job_title
from employees em, departments de, jobs jo
where em.department_id = de.department_id
and em.job_id = jo.job_id;00

--outer join
--left outer join
select em.first_name,
       em.salary,
       em.department_id,
       de.department_id,
       de.department_name
from employees em left outer join departments de
on em.department_id = de.department_id;

--oracle 에서만 사용하는 문법
select *
from employees em, departments de
where em.department_id = de.department_id(+)
and em.employee_id = 178;

--right outer join
select *
from employees em right outer join departments de
on em.department_id = de.department_id;

select *
from employees em, departments de
where em.department_id(+) = de.department_id;

--full outer join
select em.first_name,
       em.salary,
       de.department_id,
       de.department_name
from employees em full outer join departments de
on em.department_id = de.department_id;

--self join  --> 직원테이블 부서테이블 조인 문과 비교
select em.employee_id,
       em.first_name,
       em.salary,
       em.phone_number,
       em.manager_id,
       ma.employee_id,
       ma.first_name,
       ma.phone_number
from employees em, employees ma
where em.manager_id = ma.employee_id;


select *
from employees em, location lo;

