/*
select 문
select 절
from 절
*/

--직원테이블 전체 조회
select * 
from employees;

--부서테이블 전체 조회
select * 
from departments;

--원하는 컬럼만 조회
select employee_id, 
       first_name, 
       last_name
from employees;

select first_name, 
       phone_number, 
       hire_date, 
       salary
from employees;

--출력할 컬럼명 별명적용하기
select employee_id as empNo, 
       first_name as "f-name",
       salary as "연 봉"
from employees;

select first_name 이름,
       phone_number as 전화번호, 
       hire_date as 입사일, 
       salary as 급여
from employees;

--논리 연산자 사용하기
select first_name || ' ' || last_name
from employees;

select first_name || ' ' || last_name as name
from employees;

select first_name || ' ' || last_name as name
from employees;

--산술 연산자 사용하기
select first_name,
       salary as 월급,
       salary*12 as 연봉,
       (salary+300)*12
from employees;

select first_name || '_' || last_name 성명,
       salary 급여,
       salary*12 연봉,
       (salary*12)+5000 연봉2,
       phone_number 전화번호
from employees;

/*where 절*/
--비교 연산자
--부서번호가 10인 사원의 이름을 구하시오
select department_id 부서번호,
       first_name || '_' || last_name 이름       
from   employees
where  department_id = 10;

--연봉이 15000 이상인 사원들의 이름과 월급을 출력하세요
select first_name, salary
from employees
where (salary*12) >= 15000;

--07/01/01 일 이후에 입사한 사원들의 이름과 입사일을 출력하세요
select first_name, hire_date
from employees
where hire_date > '07/01/01';

--이름이 Lex인 직원의 연봉을 출력하세요
select salary*12
from employees
where first_name = 'Lex';

--조건이 2개이상 일때 한꺼번에 조회하기
--연봉이 14000이상 17000이하인 사원의 이름과 연봉을 구하시오
select first_name, salary
from employees
where salary >= 14000
and salary <= 17000
;

--연봉이 14000 이하이거나 17000 이상인 사원의 이름과 연봉을 출력하세요
select first_name, salary
from employees
where salary <= 14000 
or salary >= 17000;

--입사일이 04/01/01 에서 05/12/31 사이의 사원의
--이름과 입사일을 출력하세요
select first_name, 
       hire_date
from employees
where hire_date >= '04/01/01'
and hire_date <= '05/12/31';

--between 연산자로 특정구간 값 출력하기
--연봉이 14000 이상 17000이하인 사원의 이름과 연봉을 출력하세요
select first_name, 
       salary
from employees
where salary >= 14000
and salary <= 17000;

--위에랑 같음
select first_name, 
       salary
from employees
where salary between 14000 and 17000;

--Like 연산자로 비슷한것을 모두 찾기
select *
from employees
where first_name like 'L%';

--이름에 am을 포함한 사원의 이름과 연봉을 출력하세요
select first_name,
       salary
from employees
where first_name like '%am%';

--이름의 두번째 글자가 a인 사원의 이름과 연봉을 출력하세요
select first_name,
       salary
from employees
where first_name like '_a%';

select first_name,
       salary
from employees
where first_name like '__a_';

--in 연산자로 여러 조건을 검사하기
select *
from employees
where first_name in ('Neena', 'Lex', 'John');

select first_name,
       salary
from employees
where salary in (2100, 3100, 4100, 5100);

select first_name,
       salary,
       commission_pct
from employees
where commission_pct is not null;

select first_name
from employees7
where commission_pct is null
and manager_id is null;

/*order by 절*/
--큰수부터 작은수(내림차순)
select *
from employees
order by salary desc;

--작은수부터 큰수(오름차순)
select *
from employees
order by salary asc;

--부서번호를 오름차순으로 정렬하고 부서번호, 급여, 이름을 출력하세요
select department_id, 
       salary, 
       first_name
from employees
order by department_id asc;

--급여가 10000 이상인 직원의 이름 급여를 급여가 큰직원부터 출력하세요
select first_name, 
       salary
from employees
where salary >= 10000
order by salary desc;

--부서번호를 오름차순으로 정렬하고 부서번호가 같으면 급여가 높은 사람부터 
--부서번호 급여 이름을 출력하세요  
select department_id, 
       salary, 
       first_name
from employees
order by department_id asc,
         salary desc;






