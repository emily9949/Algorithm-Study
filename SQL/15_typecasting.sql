-- type casting (명시적 형변환)



-- 1) 숫자 -> 숫자
-- CAST (expression AS 데이터형식 [(길이)]) 
-- unsigned integer는 부호없는 정수형으로 바꿈으로써 소수점 이하를 제거할 수도 있다
SELECT cast(AVG(menu_price)AS UNSIGNED INTEGER) AS '가격 평균'
	FROM tbl_menu;
	
SELECT CONVERT(AVG(menu_price), DOUBLE) AS '가격 평균12'
	FROM tbl_menu;
	
-- 2) 문자 -> 날씨
SELECT cast('2025#01#07' AS DATE); -- #은 구분자
SELECT cast('2025/01/07' AS DATE);
SELECT cast('202?01?07' AS DATE);


-- 3) 숫자 -> 문자
SELECT concat(cast(1000 AS CHAR), '원');

-- 암시적 형변환
SELECT concat(1000, '원');

SELECT 1 + '2'; 
SELECT 5 > '반가워';
