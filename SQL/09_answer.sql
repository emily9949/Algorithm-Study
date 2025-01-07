-- 1)
SELECT *
	FROM employee;
	
-- 2)
SELECT emp_id, emp_name
	FROM employee;
	
-- 3)
SELECT emp_id, emp_name
	FROM employee
	WHERE emp_id = '201';
	
-- 4)
SELECT *
	FROM employee
	WHERE dept_code = 'D9';
	
-- 5)
SELECT *
	FROM employee
	WHERE job_code = 'J1'
	
-- 6)
SELECT emp_id, emp_name, dept_code, salary
	FROM employee
	WHERE salary >= 3000000;
	
-- 7)
SELECT emp_name, dept_code, salary
	FROM employee
	WHERE dept_code = 'D6' AND salary > 3000000;
	
-- 8)
SELECT emp_name, emp_id, salary, bonus
	FROM employee
	WHERE bonus IS NULL;
	
-- 9)
SELECT emp_id, emp_name, dept_code
	FROM employee
	WHERE dept_code != 'D9';	-- where dept_code <> 'D9'
		
-- 10)
SELECT emp_id AS '사번'
		, emp_name AS '이름'
		, hire_date AS '입사일'
	FROM employee
	WHERE ent_yn = 'N';
	
-- 11) 
SELECT 
		 emp_name AS '이름'
	  , emp_id AS '사번'
	  , salary AS '급여'
	  , dept_code AS '부서코드'
	  , job_code AS '직급코드'
	  FROM employee
	  WHERE salary BETWEEN 3500000 AND 5500000;
	  
-- 12)
SELECT emp_name
		,emp_id
		 ,hire_date
		 FROM employee
		 WHERE emp_name LIKE '김%';
		 
-- 13)
SELECT 
		 emp_name
		,emp_id
		,hire_date
 FROM employee
WHERE emp_name NOT LIKE '김%';
		 
-- 14)
SELECT 
		  emp_name
		, emp_no
		 , dept_code
  FROM employee
WHERE emp_name LIKE '%하%';

-- 15)
SELECT 
		 emp_name
		, salary
		, job_code
FROM employee
WHERE job_code = 'J7' OR (salary >= 2000000 AND job_code = 'J2'); 


-- 16)
SELECT
		 emp_name
		, salary
		, job_code
FROM employee
WHERE salary >= 2000000 AND (job_code = 'J7' OR job_code = 'J2');

	
-- 17)
SELECT
		 emp_name
		, salary
		, job_code
FROM employee
WHERE salary >= 2000000 AND job_code IN ('J7', 'J2');	
	

-- -----------------------------------------
-- join 문제

-- 1)left join 사용
SELECT 
		 a.emp_name
		, a.emp_id
		, b.dept_title
FROM employee a
LEFT JOIN department b ON (a.dept_code = b.dept_id)
WHERE a.emp_name LIKE '%형%';


-- 2) 3개의 테이블 join
SELECT 
	 a.emp_name AS '사원명'
	 ,b.job_name AS '직급명'
	 ,a.dept_code AS '부서코드'
	 ,c.dept_title AS '부서명'
FROM employee a
JOIN job b ON (a.job_code = b.job_code) 
JOIN department c ON (a.dept_code = c.dept_id)
WHERE a.dept_code IN ('D5', 'D6', 'D7');


-- 3) 3개의 테이블 INNER JOIN (a와 b를 조인한 결과에 c를 조인)
SELECT 
	 a.emp_name AS '사원명'
	, a.bonus AS '보너스 포인트'
	, b.dept_title AS '부서명'
	, c.local_name AS '근무 지역명'
FROM employee a
JOIN department b ON (a.dept_code = b.dept_id)
JOIN location c ON (b.location_id = c.local_code)
WHERE a.bonus IS NOT NULL;


-- 4) 4개의 테이블 join
SELECT
	 a.emp_name AS '사원명'
	, b.job_name AS '직급명'
	, c.dept_title AS '부서명'
	, d.local_name AS '근무 지역명'
FROM employee a
JOIN job b ON (a.job_code = b.job_code)
JOIN department c ON (a.dept_code = c.dept_id)
JOIN location d ON (c.location_id = d.local_code)
WHERE c.dept_id = 'D2';


-- 5) 칼럼이 같을 때는 on 대신 using 사용 / ifnull(컬럼명, null일 경우 대체값)
SELECT 
		 a.emp_name AS '사원명'
		,b.job_name AS '직급명'
		 , a.salary AS '급여'
		 , a.salary * 12 * (1+IFNULL(a.bonus,0)) AS '연봉' -- ifnull 함수 사용
FROM employee a
JOIN job b USING (job_code)
JOIN sal_grade c USING (sal_level)
WHERE a.salary > c.min_sal;


-- 6) 부서가 없는 직원들도 있으니 left join 사용 
SELECT 
		a.emp_name AS '사원명'
		, b.dept_title AS '부서명'
		, c.local_name AS '지역명'
		, d.national_name AS '국가명'
FROM employee a
LEFT JOIN department b ON (a.dept_code = b.dept_id)
INNER JOIN location c ON (b.location_id = c.local_code)
INNER JOIN NATIONAL d USING (national_code)
WHERE d.national_name IN ('한국', '일본');


-- 7) self join 사용 / 사원명과 동료이름이 같은 것은 중복 제거
SELECT 
		 a.emp_name AS '사원명'
		, a.dept_code AS '부서코드'
		, b.emp_name AS '동료이름'
FROM employee a
JOIN employee b ON (a.dept_code = b.dept_code)
WHERE a.emp_name != b.emp_name; -- 나 자신을 제외한 동료만 조회


-- 8) join 과 in 사용
SELECT 
		 a.emp_name AS '사원명'
		, b.job_name AS '직급명'
		, a.salary AS '급여'
FROM employee a
INNER JOIN job b USING (job_code) 
WHERE a.bonus IS NULL AND job_code IN ('J4', 'J7');


-- 9) 모든 테이블 join 후 where 절로 조건 작성
SELECT 
		 a.emp_id AS '사번'
		, a.emp_name AS '이름'
		, b.job_name AS '직급명'
		, c.dept_title AS '부서명'
		, d.local_name AS '근무지역명'
		, a.salary AS '급여'
FROM employee a
INNER JOIN job b USING (job_code)
INNER JOIN department c ON (a.dept_code = c.dept_id)
INNER JOIN location d ON (c.location_id = d.local_code)
WHERE d.local_name IN ('ASIA1', 'ASIA2', 'ASIA3') AND b.job_name = '대리';

	
	