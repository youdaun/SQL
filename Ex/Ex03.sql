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

