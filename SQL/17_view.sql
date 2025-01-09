-- view
-- 테이블을 활용한 가상 테이블
-- view는 원본 테이블을 참조해서 보여주는 용도. 테이블은 실제 데이터를 갖고 있지만 view는 쿼리만 저장한다
-- DBA가 view를 건네주면 보안성 측면에서 좋음

SELECT 
	 menu_name
	, menu_price
	FROM tbl_menu;

DROP VIEW v_menu;

-- view를 사용하는 목적
-- 1) DBA가 일반 개발자 각각에게 필요한 만큼의 정보를 제공하기 위해 
-- 2) 실제 비즈니스에서 사용되는 용어로 별칭을 달아 이해하기 쉽게 하기 위해
-- 3) 복잡한 db 관계를 고민하지 않고 사용할 수 있게 하기 위해



-- create or replace : view를 drop할 필요가 없어짐
CREATE OR REPLACE VIEW v_menu
AS 
SELECT 
	  menu_name AS '메뉴'
	 , menu_price AS '메뉴단가'
	 FROM tbl_menu;
	 
	 
SELECT * FROM v_menu;

-- view 는 DML 작업이 가능하지만 사용을 비추천 (경우에 따라 불가능한 경우들이 있음)
-- 베이스 테이블 (tbl_menu)


-- '한식' 카테고리만 담은 hansik 뷰 생성
-- 원래는 view를 쓸 때 별칭을 달아줘야한다
CREATE OR REPLACE VIEW hansik
AS
SELECT
		menu_code
		,menu_name
		,menu_price
		,category_code
		,orderable_status
FROM tbl_menu
WHERE category_code = 4;

SELECT * FROM hansik;

-- hansik 뷰를 통해 tbl_menu 베이스 테이블에 영향을 주는지 확인해보자
-- view를 통해 값을 넣으면 기존 테이블에 들어감 (비추천)
-- view는 조회 용도로 씀
INSERT 
INTO hansik
VALUES 
(NULL, '식혜맛국밥', 5500, 4, 'Y');

SELECT * FROM tbl_menu;

UPDATE hansik
SET menu_name = '버터맛국밥'
	, menu_price = 6000
WHERE menu_name = '식혜맛국밥';


-- --------------------------------------
CREATE OR REPLACE VIEW v_test
AS
SELECT 
		AVG(menu_price) + 3
  FROM tbl_menu;
  
  
SELECT * FROM v_test;











