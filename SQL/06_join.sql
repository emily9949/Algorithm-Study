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
SELECT emp_name, dept_code
	FROM employee
	WHERE dept_code = 'D9';
	
-- 5)
SELECT emp_name, job_code
	FROM employee
	WHERE job_code = 'J1'
	
-- 6)
SELECT emp_id, emp_name, dept_code, salary
	FROM employee
	WHERE salary >= 3000000;
	
-- 7)
SELECT emp_name, dept_code, salary
	FROM employee
	WHERE dept_code = 'D6' AND salary >= 3000000;
	
-- 8)
SELECT emp_name, emp_id, salary, bonus
	FROM employee
	WHERE bonus IS NULL;
	
-- 9)
SELECT emp_id, emp_name, dept_code
	FROM employee
	WHERE dept_code != 'D9';	
		
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

-- 1)








	
	
	
	