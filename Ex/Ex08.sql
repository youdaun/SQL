/* rownum*/
--급여를 가장 많이 받는 5명의 직원의 이름을 출력하시오.

--정렬을 하면 rownum 이 섞인다(X) --> 정렬을 하고 rownum을 붙인다
select  rownum
        first_name,
        salary
from employees     --정렬되어있는 테이블이면???
order by salary desc;

---->정렬을 하고  rownum을 붙인다.
select rownum,
       first_name,
       salary
from (select  first_name,
              salary
      from employees 
      order by salary desc) ot  --정렬되어 있는 테이블
where rownum >= 1     --rownum >=2  --> 데이터가 없다
and rownum <= 5;

--->(1)정렬을 하고  (2)rowmum 붙이고  (3)where절 사용
select ort.rn,
       ort.first_name,
       ort.salary
from (select rownum rn,
              ot.first_name,
              ot.salary
       from (select  first_name,
                     salary
             from employees
             order by salary desc) ot   ----(1)
      ) ort  ----(2)
where rn >= 2
and rn <= 5;    ----(3)

--07년에 입사한 직원중 급여가 많은 직원중 3에서 7등의 이름 급여 입사일은?
select r.ro,
       r.first_name,
       r.salary,
       r.hire_date
from (select rownum ro,
             first_name,
             salary,
             hire_date
      from (select first_name,
                   salary,
                   hire_date
            from employees
            where hire_date >= '07/01/01'
            and hire_date <= '07/12/31'
            order by salary desc)) r
where r.ro between 3 and 7;

--07년에 입사한 직원중 급여가 많은 직원중 3에서 7등의 이름 급여 입사일 + 부서명은?
select r.ro,
       r.first_name,
       r.salary,
       r.hire_date || ' + ' || de.department_name
from (select rownum ro,
             department_id,
             first_name,
             salary,
             hire_date
      from (select first_name,
                   department_id,
                   salary,
                   hire_date
            from employees
            where hire_date >= '07/01/01'
            and hire_date <= '07/12/31'
            order by salary desc)) r,
       departments de
where de.department_id = r.department_id
and r.ro between 3 and 7;


