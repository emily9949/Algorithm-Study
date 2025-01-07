-- where 절
-- 주문가능한 메뉴만 조회
SELECT * FROM tbl_menu;

-- 테이블의 구조(스키마)를 바로 파악할 수 있다
DESC tbl_menu;

SELECT 
	menu_name
	FROM tbl_menu
	WHERE orderable_status = 'y';
	
-- '기타' 카테고리에 해당하지 않는 메뉴를 조회하시오

SELECT
	category_code
	FROM tbl_category
	WHERE category_name != '기타';
	
-- 카테고리 테이블을 통해 메뉴에도 있는 카테고리 코드 번호를 알게 됨 (10번)

SELECT
	*
	FROM tbl_menu
	WHERE category_code = 10;
	
	
-- 서브 쿼리로 한 번에 작성	
SELECT
	*
	FROM tbl_menu
	WHERE category_code != (SELECT category_code
							  FROM tbl_category
							  WHERE category_name = '기타');
							  
							  
							  
-- 비교 연산자를 통해서 where 절에 활용할 수 있다
-- 5000원 이상의 메뉴 모든 컬럼 보기

SELECT
		*
	FROM tbl_menu
	WHERE menu_price >= 5000
	ORDER BY menu_price ASC;
	
-- 5000원 이상이면서 7000원 미만인 메뉴 조회(AND)

SELECT 
	*
	FROM tbl_menu
	WHERE menu_price >= 5000
	AND menu_price < 7000;
	

-- 10000원보다 초과이거나 5000원 이하인 메뉴 조회 (OR)

SELECT
	*
	FROM tbl_menu
	WHERE menu_price > 10000
	OR menu_price <= 5000;
	
-- between 연산자 활용하기 (같은 column 내에서만 사용 가능)


SELECT 
	*
	FROM tbl_menu
	WHERE menu_price BETWEEN 5000 AND 9000;
	
	
-- like 문
-- 제목, 작성자 등을 검색할 때 사용

SELECT
	*
	FROM `tbl_menu`
	WHERE menu_name LIKE '%밥%'; -- %는 앞 뒤로 0개 이상을 의미
	
	
SELECT
	*
	FROM `tbl_menu`
	WHERE menu_name NOT LIKE '%밥%';
	
	
-- in 연산자
-- 카테고리가 '중식', '커피', '기타'인 메뉴 조회하기

SELECT *
	FROM tbl_menu
	WHERE category_code = 5
	OR category_code = 8
	OR category_code = 10;
	
	
SELECT
	*
	FROM tbl_menu
	WHERE category_code IN (5, 8, 10);
	

-- is null 연산자 활용
-- 1) 상위 카테고리 조회
SELECT
	 *
	 FROM tbl_category
	 WHERE ref_category_code IS NULL; 
	 
-- 2) 하위 카테고리 조회
SELECT
	 *
	 FROM tbl_category
	 WHERE ref_category_code IS NOT NULL; 
	 

