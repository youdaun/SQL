--문제 1
select count(*) haveMngCnt
from employees
where manager_id is not null;

--문제 2
select min_salary || ',' || max_salary "최고임금,최저임금",
       max_salary-min_salary "최고임금-최저임금"
from jobs;

--문제 3
select to_char(max(hire_date), 'yyyy"년" mm"월" dd"일"')
from employees;

--문제 4
select department_id,
       round(avg(salary),0),
       max(salary),
       min(salary)
from employees
group by department_id
order by department_id desc;

--문제 5
select job_id,
       round(avg(salary),0),
       max(salary),
       min(salary)
from employees
group by job_id
order by min(salary) desc, 
         round(avg(salary),0) asc;

--문제 6
select to_char(min(hire_date), 'yyyy-mm-dd day')
from employees;

--문제 7
select        department_id,
              round(avg(salary),0),
              min(salary),
              round(avg(salary) - min(salary),0)
from          employees
group by      department_id
having        round(avg(salary),0) - min(salary) < 2000
order by      round(avg(salary),0) - min(salary) desc;


--문제 8
select        job_title,
              max_salary - min_salary
from          jobs
order by      max_salary - min_salary desc;

--문제 9
select        manager_id,
              round(avg(salary),0),
              min(salary),
              max(salary)
from          employees
where         hire_date >= '2005-01-01'
group by      manager_id
having        round(avg(salary),0) >= 5000
order by      round(avg(salary),0) desc;

--문제 10
select        first_name,
              hire_date,
              case when hire_date <= '02/12/31' then '창립멤버'
                   when hire_date <= '03/12/31' then '03년입사'
                   when hire_date <= '04/12/31' then '04년입사'
              else '상장이후입사'
              end optDate
from          employees
order by      hire_date asc;
