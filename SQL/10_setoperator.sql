-- set operator
-- 1) union (합집합)
-- 같은 테이블이고, 구조가 똑같아야함
SELECT
		 menu_code
		, menu_name
		, menu_price
		, category_code
		, orderable_status
  FROM  tbl_menu
 WHERE category_code = 10
 UNION 
SELECT
		 menu_code
		, menu_name
		, menu_price
		, category_code
		, orderable_status
  FROM  tbl_menu
 WHERE menu_price < 9000;
 
 
-- union all (중복 포함)
SELECT
		 menu_code
		, menu_name
		, menu_price
		, category_code
		, orderable_status
  FROM  tbl_menu
 WHERE category_code = 10
 UNION ALL 
SELECT
		 menu_code
		, menu_name
		, menu_price
		, category_code
		, orderable_status
  FROM  tbl_menu
 WHERE menu_price < 9000;
 
 
-- 2) intersect (교집합)
-- mysql 과 mariadb는 intersect가 공식적으로 지원되지 않는다
-- -- 1) INNER JOIN + 서브쿼리 활용 
-- select from where 절이 하나의 테이블 / 서브쿼리 총 두개의 테이블을 join
SELECT
		  a.menu_code
		, a.menu_name
		, a.menu_price
		, a.category_code
		, a.orderable_status
  FROM  tbl_menu a
INNER JOIN (SELECT b.menu_code
				,  b.menu_name
				   ,  b.menu_price
				   ,  b.category_code
				   ,  b.orderable_status
				FROM tbl_menu b
				WHERE b.menu_price <9000) c ON (a.menu_code = c.menu_code)
WHERE a.category_code = 10; 
 
 
-- -- 2) in 연산자 활용 (= 과 or을 합침)
SELECT
		  a.menu_code
		, a.menu_name
		, a.menu_price
		, a.category_code
		, a.orderable_status
  FROM  tbl_menu a
 WHERE a.category_code = 10
 AND a.menu_code IN (SELECT b.menu_code
 						 FROM tbl_menu b
 						 WHERE b.menu_price <9000);
 						 
 						 
-- minus
SELECT
		  a.menu_code
		, a.menu_name
		, a.menu_price
		, a.category_code
		, a.orderable_status
  FROM tbl_menu a
  LEFT JOIN (SELECT b.menu_code
  					 , b.menu_name
  					 , b.menu_price
  					 , b.category_code
  					 , b.orderable_status
  				FROM tbl_menu b
  				WHERE b.menu_price < 9000) c ON (a.menu_code = c.menu_code)
 WHERE a.category_code = 10
 AND c.menu_code IS NULL;
 
 
