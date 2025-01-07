-- distinct
-- 메뉴가 할당된 카테고리들 조회
SELECT
	`category_code`
	FROM tbl_menu
	ORDER BY category_code; 

-- 중복된 값 제거 (distinct 를 활용해 메뉴가 할당된 카테고리들의 종류를 조회)
SELECT
	DISTINCT `category_code`
	FROM tbl_menu
	ORDER BY category_code; 
	
-- 다중열 distinct
SELECT
	DISTINCT  
	 category_code
	, orderable_status
	FROM tbl_menu;
	

	
	
	
	
	
	