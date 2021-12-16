/*단일행 함수*/

--문자함수 - INITCAP(컬럼명)
--앞글자만 대문자
select email,
       initcap(email) email2,
       department_id
from employees
where department_id = 100
;

--문자함수 – LOWER(컬럼명) / UPPER(컬럼명)
--대문자 / 소문자
select first_name,
       lower(first_name),
       upper(first_name)
from employees
where department_id = 100
;

--문자함수 – SUBSTR(컬럼명, 시작위치, 글자수)
--특정길이의 문자열 가져오기
select first_name,
       substr(first_name,1,3),
       substr(first_name,-3,2)
from employees
where department_id = 100
;

--문자함수 – LPAD(컬럼명, 자리수, ‘채울문자’) /  RPAD(컬럼명, 자리수, ‘채울문자’)
select first_name,
       lpad(first_name, 10, '*'),
       rpad(first_name, 10, '*')
from employees
;

--문자함수 – REPLACE (컬럼명, 문자1, 문자2)
select first_name,
       replace(first_name, 'a', '*****'),
       replace(first_name, substr(first_name, 2, 3), '***')
from employees
where department_id = 100;
   
--주어진 숫자의 반올림을 하는 함수
select round(123.346, 2) "r2",
       round(123.456, 0) "r0",
       round(123.456, -1) "r-1"
from dual;

--숫자함수 – TRUNC(숫자, 출력을 원하는 자리수) 
select trunc(123.346, 2) "r2",
       trunc(123.956, 0) "r0",
       trunc(123.456, -1) "r-1"
from dual; 

--날짜함수 – SYSDATE()
--현재날짜와 시간을 출력해주는 함수
select sysdate
from dual;

--단일함수>날짜함수 – MONTH_BETWEEN(d1, d2) 
--d1날짜와 d2날짜의 개월수를 출력하는 함수 
select sysdate,
       months_between(sysdate, hire_date),
       round(months_between(sysdate, hire_date), 0),
       trunc(months_between(sysdate, hire_date), 0)
from employees
where department_id = 100;

--1900/01/01 00:00:00 -----> 0
--"1900/01/01 00:00:01" ------> 12313123213113


--TO_CHAR(숫자, ‘출력모양’)  숫자형문자형으로 변환하기
select first_name,
       salary,
       salary*12,
       to_char(salary*12,'$99999999'),
       to_char(salary*12,'$099999')
from employees
where department_id = 100;

--단일함수>변환함수>TO_CHAR(날짜, ‘출력모양’)  날짜문자형으로 변환하기
select sysdate,
       to_char(sysdate, 'YYYY'),
       hire_date,
       to_char(hire_date, 'mm')
from employees;

select sysdate,
       to_char(sysdate, 'yyyy"년"mm-dd day hh24:mi:ss')
from dual;

--일반함수>NVL(컬럼명, null일때값)/NVL2(컬럼명, null아닐때값, null일때 값)
select first_name,
       commission_pct,
       nvl(commission_pct,0),
       nvl2(commission_pct,100,0) --null은 0 null이 아닌건 100
from employees;
