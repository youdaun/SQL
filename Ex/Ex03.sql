/*그룹함수*/

select first_name, salary
from employees;

--오류발생 ---> 1개의 row에 표현할 수 없다
select first_name, avg(salary)
from employees;

--그룹함수 avg()
select avg(salary),
       round(avg(salary))
from employees;

--그룹함수 count()
select count(*),
       count(commission_pct) --컬럼을 써주면 null 값은 제외한 후 구한다
from employees;

select count(*)
from employees
where salary > 16000;

--부서번호가 100인 사람의 갯수
select count(*)
from employees
where department_id = 100;

--그룹함수 sum()
select sum(salary)
from employees;
 
--그룹함수 avg()
--*주의: null값이 있는 경우 아예 빼고계산해버림 ---> nvl함수와 같이사용한다
select sum(salary), count(*), round(avg(salary),0)
from employees
where salary > 16000;

select count(*),
       sum(nvl(salary,0)),
       sum(salary)/count(*) avg,
       avg(salary)
from employees;

--그룹함수 - max() / min()
select count(*), 
       max(salary), 
       min(salary)
from employees;


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