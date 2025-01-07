-- order by (정렬)

-- 오름차순 (ASC)
-- 내림차순 (DESC)

select
	menu_code
	,menu_name
	,menu_price
	from tbl_menu
	order by menu_price, menu_name desc; -- order by는 기본으로 오름차순, menu_name은 내림차순 적용
	
SELECT 
	menu_code AS 메뉴코드
	,menu_name AS 메뉴명
	,menu_price AS 메뉴단가
	FROM tbl_menu
	ORDER BY 메뉴코드 DESC; 				     -- 별칭에 특수기호가 있을 시 별칭을 활용한 정렬이 안됨 (특수기호 사용 x)
	
-- field 함수를 활용한 정렬 가능

SELECT FIELD ('a', 'b', 'c', 'a');

-- 주문 불가능한 메뉴부터 보기
SELECT 
	orderable_status
	, FIELD(orderable_status, 'Y', 'N') AS 가능여부 -- Y는 1, N은 2로 매핑되어서 정렬할 수 있음
	FROM tbl_menu
	ORDER BY 가능여부 desc;
	

-- ----------------------

-- null 값에 대한 정렬

SELECT * FROM tbl_category;

-- 1) 오름차순 시 : null 값이 먼저 나옴
SELECT 
	*
	FROM tbl_category
	ORDER BY ref_category_code ASC; 
	
-- 2) 내림차순 시 : null 값이 마지막에 나옴
SELECT 
	*
	FROM tbl_category
	ORDER BY ref_category_code DESC; 
	
	
-- 3) 오름차순 시 : null 값이 먼저 나옴
SELECT 
	*
	FROM tbl_category
	ORDER BY -ref_category_code DESC;  -- desc를 통해 null의 위치(나중)을 선정하고 desc와 반대(asc)로 컬럼값 정렬. (앞에 -를 붙임으로써 asc가 됨)
	
-- 4) 내림차순 시 : null 값이 마지막에 나옴
SELECT 
	*
	FROM tbl_category
	ORDER BY -ref_category_code ASC; -- null이 먼저 나옴(asc) 대신 desc로 정렬

