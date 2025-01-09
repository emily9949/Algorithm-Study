-- stored procedure
-- 저장해둔 일련의 sql 문장을 불러와 반복 재사용함으로써 반복적인 작업을 효율화 할 수 있다
-- 네트워크 트래픽을 줄일 수 있다 (DB에서 일어나는 일이기 때문)
-- 쿼리를 날리는 자동화 매크로

-- delimiter : SQL 명령어 구분자를 기본 ;에서 //로 변경 프로시저 내부에 (;)이 존재하기 때문에 따로 정의를 해주어야 함
-- 사원 조회 프로시저

-- begin ... end 구문 : 여러 SQL 명령어를 하나의 블록으로 묶음 (하나의 단위로 처리)

delimiter //

CREATE OR REPLACE PROCEDURE getAllEmployees()
BEGIN
	SELECT emp_id, emp_name, salary
	FROM employee;
END //

delimiter;

CALL getAllEmployees();

-- ---------------------------------------------
-- IN 매개변수
-- dept 변수에 char(2) 조건 지정


delimiter //

CREATE OR REPLACE PROCEDURE getEmployeesByDepartment (
	IN dept CHAR (2)
)
BEGIN 
	SELECT emp_id, emp_name, salary, dept_code
	FROM employee
	WHERE dept_code = dept;
END //

delimiter;


CALL getEmployeesByDepartment('D5');
CALL getEmployeesByDepartment('D6');
CALL getEmployeesByDepartment('D7');


-- -----------------------------------------------
-- OUT 매개변수
-- out 과 into 
-- 명시적으로 return 은 없지만 반환값을 내보낼 수 있다 
delimiter //

CREATE OR REPLACE PROCEDURE getEmployeeSalary (
		IN id VARCHAR(3),
		 OUT sal DECIMAL(10,2) -- 10개의 숫자 중에 소수점 2자리포함
)
BEGIN 
	SELECT salary INTO sal
	FROM employee
	WHERE emp_id = id;
END //

delimiter ;

-- sal 변수 생성
SET @sal =0;
CALL getEmployeeSalary('205', @sal);
SELECT @sal;



-- ----------------------------------------------
-- IN OUT 매개변수
-- IN : 입력 파라미터
-- OUT : 출력 파라미터. 인자에 값을 할당
-- INOUT : 입출력 파라미터 

delimiter //

CREATE OR REPLACE PROCEDURE updateAndReturnSalary (
	IN id VARCHAR(3),
	INOUT sal DECIMAL (10,2)
)
BEGIN 
	UPDATE employee 
	SET salary = sal
	WHERE emp_id = id;
	
	SELECT salary + (salary * ifnull(bonus, 0)) INTO sal
	FROM employee
	WHERE emp_id = id;
END //

delimiter;

-- new_sal 의 값 9000000을 프로시저의 sal 변수 쪽에 넘긴다
SET @new_sal = 9000000;
CALL updateAndReturnSalary('200', @new_sal);
SELECT @new_sal;


-- ----------------------------------------------
-- null 이 포함된 연산은 결과값이 무조건 null 이므로 ifnull 또는 nvl 함수를 사용해야 한다
SELECT 
	salary AS 급여
	, salary * bonus AS 보너스
	, salary + salary * ifnull(bonus, 0) AS 보너스포함급여
	, salary + salary * nvl(bonus, 0) AS 보너스포함급여
FROM employee;


-- @ 변수의 의미
-- 1) '사용자 정의형 변수'
-- 2) 크기를 따로 정하지 않지만 대입되는 값에 맞춰진다
-- 3) 전역 변수의 의미를 가짐



-- --------------------------------------------
-- if-else 활용;

delimiter //

CREATE OR REPLACE PROCEDURE checkEmployeeSalary (
		IN id VARCHAR(3),
		 IN threshold DECIMAL(10, 2),
		 OUT result VARCHAR(50)
)
BEGIN 
	-- 지역변수 선언
	DECLARE sal DECIMAL(10,2);
	
	-- 쿼리의 결과를 변수에 저장
	SELECT salary INTO sal -- salary를 본인의 지역변수 sal 에 저장한다 
	FROM employee
	WHERE emp_id = id;
	
	IF sal > threshold THEN
		SET result = '기준치를 넘는 급여입니다';
	ELSE 
		SET result = '기준치와 같거나 기준치 미만의 급여입니다';
	END IF;
	
END //

delimiter;


SET @result = '';
CALL checkEmployeeSalary('200', 3000000, @result);
SELECT @result;

-- --------------------------------------------
-- case 
delimiter //

CREATE OR REPLACE PROCEDURE getDepartmentMessage(
		IN id VARCHAR(3),
		 OUT message VARCHAR(100)
)
BEGIN 
	DECLARE dept VARCHAR(50);
	
	SELECT dept_code INTO dept
	FROM employee
	WHERE emp_id = id;

	-- 하나의 조건을 만족하면 case문을 나감. 양자택일의 구조
	CASE
		WHEN dept = 'D1' THEN 
			SET message = '인사 관리부 직원이시군요';
		WHEN dept = 'D2' THEN 
			SET message = '회계 관리부 직원이시군요';
	   WHEN dept = 'D3' THEN 
			SET message = '마케팅부 관리부 직원이시군요';
		ELSE
			SET message = '어떤 부서 직원이신지 모르겠어요';
	END CASE;
END //

delimiter;

SET @message = '';
CALL getDepartmentMessage('221', @message);
SELECT @message;

-- --------------------------------------------
-- while 활용
delimiter //

CREATE OR REPLACE PROCEDURE calculateSumUpTo(
		IN max_num INT,
		 OUT sum_result INT 
)
BEGIN 
	DECLARE current_num INT DEFAULT 1; -- 1로 초기값 설정
	DECLARE total_sum INT DEFAULT 0; -- 0으로 초기값 설정
	
	WHILE current_num <= max_num DO 
		SET total_sum = total_sum + current_num; -- 대입이 되는 값 : 리터럴 -> 변수(공간)에 대입
		SET current_num = current_num +1;
	END WHILE;
	
	SET sum_result = total_sum;
END //

delimiter;

SET @result = 0;
CALL calculateSumUpTo(10, @result);
SELECT @result;

-- -----------------------------------------------
-- 예외처리 
-- signal 구문 사용
delimiter //

CREATE PROCEDURE divideNumbers(
		IN numerator DOUBLE,
		 IN denominator DOUBLE,
		 OUT result DOUBLE 
)
BEGIN 
	  -- declare .. condition for 구문 
	   -- DECLARE condition_name CONDITION FOR condition_value (sqlstate 'value ')
	  DECLARE division_by_zero CONDITION FOR SQLSTATE '45000';
	  -- 45000 : 처리되지 않은 사용자 정의 예외
	 	DECLARE EXIT HANDLER FOR division_by_zero
	 	-- division_by_zero 예외가 발생했을 때 처리할 핸들러 선언 
	 	-- exit handler : 예외가 발생한 후 즉시 프로시저 실행 종료
	 	BEGIN
	 		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '0으로 나눌 수 없습니다';
	 		-- sqlstate '45000'을 메세지와 함께 신호로 보냄
	 	END;
	 	
	 	IF denominator = 0 THEN
	 		SIGNAL division_by_zero; -- 0인 경우 예외를 발생시킴
	 	ELSE
	 		SET result = numerator / denominator; -- 0이 아닌 경우 정상적으로 연산 수행
	 	END IF; -- if 절 종료
END //

delimiter;

SET @result = 0;
CALL divideNumbers(10, 2, @result); 
SELECT @result;
CALL divideNumbers(10, 0, @result); -- 나누는 수가 0일 때 division_by_zero  예외처리가 발생


-- ----------------------------------------------
-- stored function 
-- 함수를 정의해서 사용할 수 있음 
delimiter //

CREATE OR REPLACE FUNCTION getAnnualSalary (
		id VARCHAR (3)
)
RETURNS DECIMAL(15, 2) -- 함수가 반환할 데이터 타입을 정의
DETERMINISTIC -- 결정론적 함수 (같은 입력에 대해 항상 동일한 값 반환) / 비결정론 
BEGIN 
	DECLARE monthly_salary DECIMAL(10,2);
	 DECLARE annual_salary DECIMAL(15,2);
	 
	 SELECT salary INTO monthly_salary
	 FROM employee
	 WHERE emp_id = id; -- 사원번호가 바뀌기 때문에 매번 select절이 실행됨
	 
	 SET annual_salary = monthly_salary * 12;
	 
	 RETURN annual_salary;
END //


delimiter;

SELECT
	 emp_name
	, getAnnualSalary(emp_id) AS 연봉
	FROM employee;



