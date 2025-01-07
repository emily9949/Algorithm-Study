-- limit
-- 4번 인덱스부터 3개를 잘라라 (페이지네이션에 사용)
SELECT
	menu_code
	, menu_name
	, menu_price
	FROM tbl_menu
	ORDER BY menu_price DESC, menu_code DESC
	LIMIT 4,3; 