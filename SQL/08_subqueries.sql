-- subqueries

-- '민트 미역국'의 카테고리 번호 조회 (서브 쿼리)

SELECT
	category_code
	FROM tbl_menu
	WHERE menu_name = '민트미역국';
	
-- '민트 미역국'과 같은 카테고리의 메뉴를 조회 (메인 쿼리)
SELECT
	menu_name
	FROM tbl_menu
	WHERE category_code = 4;
	
SELECT
		 menu_name
	FROM tbl_menu
   WHERE category_code = (SELECT category_code
							FROM tbl_menu
							WHERE menu_name = '민트미역국');
							
							
-- 서브쿼리의 종류
-- 1) 다중행 다중열 서브쿼리
SELECT
	*
	FROM tbl_menu;
	
-- 2) 다중행 단일열 서브쿼리
SELECT
	menu_name
	FROM tbl_menu;

-- 3) 단일행 다중열 서브쿼리
SELECT
	*
	FROM tbl_menu
	WHERE menu_name = '우럭스무디';

-- 4) 단일행 단일열 서브쿼리
SELECT
	category_code
	FROM tbl_menu
	WHERE menu_name = '우럭스무디';						
-- 가장 많은 메뉴가 포함된 카테고리의 메뉴 개수를 구해보자 (count(), max())

SELECT
	count(*)
	, category_code
	FROM tbl_menu
	GROUP BY category_code;			

-- from 절에 쓴 서브쿼리는 꼭 별칭을 달아야한다 (별칭 안넣으면 에러)
-- count 라는 별칭을 꼭 써서 서브쿼리를 돌릴 것
SELECT
		max(a.count) -- a테이블의 count를 세어달라
		, category_code
	FROM(SELECT	count(*) AS count 
			   ,category_code
		 FROM tbl_menu
		 GROUP BY category_code) a;	
	
		 
-- count(*)을 넣어버리면 from 절의 행의 갯수를 카운트 해버리기 때문		 
SELECT
		count(*) -- 총 8개의 행을 계산
		 FROM(SELECT	count(*) AS count
		 FROM tbl_menu
		 GROUP BY category_code) a;	

SELECT
		 count 
		 FROM(SELECT	count(*) AS count
		 FROM tbl_menu
		 GROUP BY category_code) a;	
		 
-- 선행해서 쿼리에서 동작해야 할 쿼리를 '서브쿼리'로 작성한다
-- mariadb에서는 서브쿼리를 from절에 사용시 반드시 별칭을 달아줘야한다(->a)
-- 서브쿼리의 그룹함수의 결과를 메인쿼리에서 쓰기 위해서는 역시나 반드시 별칭을 달아야 한다 (-> count)
-- -------------------------------------------------------------		 

-- 가격이 가장 비싼 메뉴 조회		 
-- 같이 나올 수 없는 조합. menu_name은 랜덤으로 하나를 뽑은 것이기 때문에 오류임		 
SELECT max(menu_price) FROM tbl_menu; -- 서브 쿼리
SELECT menu_name, max(menu_price) FROM tbl_menu; -- 잘못된 쿼리

-- 올바른 쿼리 구문
SELECT
		*
	FROM tbl_menu
	WHERE menu_price = (SELECT max(menu_price)
							FROM tbl_menu);


-- 상관 서브쿼리
-- 1) 메뉴가 존재하는 카테고리 별로 평균 구하기
SELECT 
	AVG(menu_price)
	FROM tbl_menu
	WHERE category_code = 6;




-- 2) 메뉴별 각 메뉴가 속한 카테고리의 평균보다 높은 가격의 메뉴들만 조회

-- 매번 해당 메뉴의 카테고리의 평균이 서브쿼리의 결과값으로 나옴. 메인 쿼리의 결과값이 서브쿼리에 활용됨

SELECT 
	a.menu_code
	, a.menu_name
	, a.menu_price
	FROM tbl_menu a
	WHERE a.menu_price > (SELECT AVG(b.menu_price)
								FROM tbl_menu b
								WHERE b.category_code = a.category_code);
-- -----------------------------------------------
/* exists
	결과가 하나라도 존재하면 (한 행이라도 조회가 되면) true, 아니면 false
	카테고리 중에 메뉴에 부여된 카테고리들의 카테고리 이름 조회 후 오름차순 정렬
 */
 
 
SELECT
	category_name
FROM tbl_category a
WHERE EXISTS (SELECT menu_code
				FROM tbl_menu b
					WHERE b.category_code = a.category_code)
ORDER BY 1;





							
							
							