/*문제 1
직원들의 사번(employee_id), 이름(firt_name), 성(last_name)과 부서명(department_name)을 
조회하여 부서이름(department_name) 오름차순, 사번(employee_id) 내림차순 으로 정렬하세요.
(106건)
*/

select        em.employee_id,
              em.first_name,
              em.last_name,
              de.department_id
from          employees em, departments de
where         em.department_id = de.department_id
order by      department_id asc,employee_id desc;

/*문제 2
employees 테이블의 job_id는 현재의 업무아이디를 가지고 있습니다.
직원들의 사번(employee_id), 이름(firt_name), 급여(salary), 부서명(department_name), 
현재업무(job_title)를 사번(employee_id) 오름차순 으로 정렬하세요.
부서가 없는 Kimberely(사번 178)은 표시하지 않습니다.
(106건)
*/

select        em.employee_id,
              em.first_name,
              em.salary,
              em.department_id,
              jo.job_title
from          employees em, jobs jo
where         em.job_id = jo.job_id
and           em.department_id is not null
order by      em.employee_id asc;

/*문제 2-1
문제2에서 부서가 없는 Kimberely(사번 178)까지 표시해 보세요
(107건)
*/
select        em.employee_id,
              em.first_name,
              em.salary,
              em.department_id,
              jo.job_title
from          employees em, jobs jo
where         em.job_id = jo.job_id
order by      em.employee_id asc;

/*문제 3
도시별로 위치한 부서들을 파악하려고 합니다.
도시아이디, 도시명, 부서명, 부서아이디를 도시아이디(오름차순)로 정렬하여 출력하세요 
부서가 없는 도시는 표시하지 않습니다.
(27건)
*/

select        de.location_id,
              lo.city,
              de.department_name,
              de.department_id
from          departments de, locations lo
where         de.location_id = lo.location_id
order by      lo.location_id asc;

/*문제 3-1
문제3에서 부서가 없는 도시도 표시합니다. 
(43건)
*/
select        de.location_id,
              lo.city,
              de.department_name,
              de.department_id
from          departments de right outer join locations lo
on            de.location_id = lo.location_id
order by      lo.location_id asc;


/*문제4
지역(regions)에 속한 나라들을 지역이름(region_name), 나라이름(country_name)으로 
출력하되 지역이름(오름차순), 나라이름(내림차순) 으로 정렬하세요.
(25건)
*/

select        re.region_name,
              co.country_name
from          countries co, regions re
where         re.region_id = co.region_id
order by      re.region_name asc, co.country_name desc;



/*문제5 
자신의 매니저보다 채용일(hire_date)이 빠른 사원의 
사번(employee_id), 이름(first_name)과 채용일(hire_date), 매니저이름(first_name), 
매니저입사일(hire_date)을 조회하세요.(37건)
*/

select        em.employee_id,
              em.first_name,
              em.hire_date,
              ma.first_name,
              ma.hire_date
from          employees em, employees ma
where         em.manager_id = ma.employee_id
and           em.hire_date < ma.hire_date;


/*문제 6
나라별로 어떠한 부서들이 위치하고 있는지 파악하려고 합니다.
나라명, 나라아이디, 도시명, 도시아이디, 부서명, 부서아이디를 나라명(오름차순)로 
정렬하여 출력하세요. 값이 없는 경우 표시하지 않습니다.
(27건)
*/

select        co.country_name,
              co.country_id,
              lo.city,
              lo.location_id,
              de.department_name,
              de.department_id
from          departments de, locations lo, countries co
where         de.location_id = lo.location_id
and           lo.country_id = co.country_id
order by      co.country_name asc;


/*문제 7
job_history 테이블은 과거의 담당업무의 데이터를 가지고 있다.
과거의 업무아이디(job_id)가 ‘AC_ACCOUNT’로 근무한 사원의 
사번, 이름(풀네임), 업무아이디, 시작일, 종료일을 출력하세요.
이름은 first_name과 last_name을 합쳐 출력합니다.
*/

select        em.department_id,
              em.first_name || em.last_name 풀네임,
              jh.job_id,
              jh.start_date,
              jh.end_date
from          employees em, job_history jh
where         em.employee_id = jh.employee_id
and           jh.job_id = 'AC_ACCOUNT';


/*문제 8
각 부서(department)에 대해서 부서번호(department_id), 부서이름(department_name), 
매니저(manager)의 이름(first_name), 위치(locations)한 도시(city), 나라(countries)의 
이름(countries_name) 그리고 지역구분(regions)의 이름(resion_name)까지 전부 출력해 보세요.
(11건)
*/

select        de.department_id,
              de.department_name,
              em.first_name,
              lo.city,
              co.country_name,
              re.region_name
from          employees em, departments de, locations lo, countries co, regions re
where         em.employee_id = de.manager_id       
and           de.location_id = lo.location_id
and           lo.country_id = co.country_id
and           co.region_id = re.region_id;


/*문제 9
각 사원(employee)에 대해서 사번(employee_id), 이름(first_name), 부서명(department_name), 
매니저(manager)의 이름(first_name)을 조회하세요.부서가 없는 직원(Kimberely)도 표시합니다.
(106명)
*/

select        em.employee_id,
              em.first_name,
              de.department_name,
              ma.first_name
from          employees em, employees ma, departments de
where         em.manager_id = ma.employee_id
and           em.department_id = de.department_id(+); 

