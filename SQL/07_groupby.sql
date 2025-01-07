-- group by
-- 메뉴가 존재하는 카테고리 그룹 조회
-- 그룹 함수(sum, avg, count, max, min)를 적용하기 위한 설정

SELECT 
	category_code
	FROM tbl_menu
	GROUP BY category_code;

-- count 함수 활용
SELECT
	COUNT(*) -- 해당되는 그룹의 행의 갯수를 세어준다
	, category_code
	FROM tbl_menu
	GROUP BY category_code;
	
-- count 함수
-- count (컬럼명 또는 *)
-- count (컬럼명) : 해당 컬럼에 null 이 없는 행의 갯수
-- count (*) : 모든 행의 갯수


SELECT
	count(*)
	,count(ref_category_code)
	FROM tbl_category;
	
-- sum 함수 활용
SELECT
	category_code
	, menu_name -- 카테고리 코드 별 메뉴는 여러개인데, 하나만 보여주게 됨. 의미없는 코드
	FROM tbl_menu
	GROUP BY category_code;
	
SELECT
	category_code 
	, sum(menu_price) -- group 함수
	FROM tbl_menu
	GROUP BY category_code;
	
-- group by에서 사용된 컬럼 외에 다른 컬럼은 select절에 작성하지 말자(의미x)
-- group by 절에서 사용된 컬럼 + group 함수만 select 절에 작성할 것

-- avg 함수 활용
-- round : 반올림, ceil : 올림, floor : 버림
SELECT
	category_code
	, floor(AVG(menu_price)) 
	FROM tbl_menu
	GROUP BY category_code;
	
	
-- having 절
-- group에 대한 조건을 지정 
-- where는 모든 행마다 지정하는 조건, having 은 그룹별로 적용되는 조건
SELECT
	sum(menu_price)
	, category_code
	FROM tbl_menu
	GROUP BY category_code
	HAVING category_code BETWEEN 5 AND 9;
	
	
SELECT
	sum(menu_price)
	, category_code
	FROM tbl_menu
	GROUP BY category_code
	HAVING sum(menu_price)>= 20000;

-- 6가지 절 모두 활용하기
SELECT
	category_code
	, AVG(menu_price)
	FROM tbl_menu
	WHERE menu_price > 10000
	GROUP BY `category_code`
	HAVING AVG(menu_price) > 12000 -- 그룹별로 조건을 건다
	ORDER BY 1 DESC; -- SELECT 목록에서 첫 번째 열인 category_code를 기준으로 정렬
	
-- 6가지 sql 쿼리문 	
-- select (5)
-- from (join) (1)
-- where (2, 모든 행에 대한 조건)
-- group by (3)
-- having (4, 그룹에 대한 조건)
-- order by (limit) (6)
		
	
-- roll up
-- group을 묶을 때 하나의 기준(하나의 컬럼)으로 그룹화하여 rollup을 하면 
-- 총 합계의 개념이 나온다
SELECT
	sum(menu_price)
	, category_code
	FROM tbl_menu
	GROUP BY category_code
	WITH ROLLUP;

-- group 을 묶을 때 두 개 이상의 기준(컬럼들)으로 그룹화하여 rollup
-- rollup 을 하면 중간 합계를 제공
SELECT
	sum(menu_price)
	, menu_price
	, category_code
	FROM tbl_menu
	GROUP BY menu_price, category_code 
	WITH ROLLUP;
	
	


	