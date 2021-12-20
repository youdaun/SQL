/*group by절*/
select department_id, 
       avg(salary)
from employees
group by department_id

select department_id , job_id, count(*), avg(salary)
from employees
group by department_id, job_id;

-- having
select department_id,
       count(*),
       sum(salary)
from employees
group by department_id
having sum(salary) >= 20000
and department_id = 100;

--case ~ end 문
select employee_id 사번,
       first_name,
       salary,
       job_id,
       case when job_id = 'AC_ACCOUNT' then salary + salary*0.1
            when job_id = 'SA_REP' then salary + salary*0.2 
            when job_id = 'ST_CLERK' then salary + salary*0.3
       end realSalary
from employees;

--decode()
select employee_id,
       first_name,
       salary,
       job_id,
       decode(job_id, 'AC_ACCOUNT',  salary + salary*0.1,
                       'SA_REP',     salary + salary*0.2,
                       'ST_CLERK',   salary + salary*0.3,
              salary) realSalary
from employees;

/*
[예제1]
직원의 이름, 부서, 팀을 출력하세요팀은 코드로 결정하며 
부서코드가 10~50 이면 ‘A-TEAM’60~100이면 ‘B-TEAM’  
110~150이면 ‘C-TEAM’ 나머지는 ‘팀없음’ 으로 출력하세요.
*/
select first_name,
       department_id,
       case when  department_id >= 10  and   department_id <= 50  then 'A-TEAM'
            when  department_id >= 60  and   department_id <= 100 then 'B-TEAM'
            when  department_id >= 110 and   department_id <= 150 then 'c-TEAM'
            ELSE '팀없음'
       end team
from employees;