-- index
-- index로 조회하는게 성능이 좋음
-- 면접 단골 질문 !!
SELECT * FROM tbl_menu;

DELETE FROM tbl_menu WHERE menu_code = 41;

-- 고유 인덱스 : 중복된 값이 없는 컬럼에 달리는 인덱스 (pk, uk)
-- 비고유 인덱스 : 중복된 값이 있는 컬럼에 달리는 인덱스

CREATE TABLE phone (
	phone_code INT PRIMARY KEY,
	 phone_name VARCHAR(100),
	 phone_price DECIMAL(10,2)
);


INSERT 
	INTO phone
VALUES 
(1, 'galaxyS24', 1200000),
(2, 'iphone16pro', 1430000),
(3, 'galaxyfold7', 1730000);

SELECT * FROM phone;

-- 숨겨져있는 Index 보기
SHOW INDEX FROM phone;

-- pk 컬럼은 고유 인덱스가 있으므로 pk컬럼을 활용한 (where절에) 조회를 하자
-- 검색 속도 향상을 위함
SELECT * FROM phone WHERE phone_code = 1;
EXPLAIN SELECT * FROM phone WHERE phone_code = 1;

-- 다른 컬럼으로 조회 성능 향상을 위해서는 인덱스를 수동으로 달자
CREATE INDEX idx_name ON phone(phone_name);
SHOW INDEX FROM phone;

-- 인덱스가 달린 컬럼을 조건으로 조회
SELECT * FROM phone WHERE phone_name = 'iphone16pro';
-- explain 절을 활용할 것
EXPLAIN SELECT * FROM phone WHERE phone_name = 'iphone16pro';

-- 인덱스는 필요한 곳에 달아야 한다.
-- 1) 조건으로 활용할 컬럼 (where절, having 절, join 시 on에 사용하는 컬럼)
-- 2) '=' 같다는 조건으로 쓰일 컬럼
-- 3) 데이터가 자주 수정되지 않는 컬럼에 달아야 한다 
-- 4) 전체 데이터의 10~15% 정도의 범위에 해당하는 조건이 가장 효율이 좋음 (비고유 인덱스)
-- 5) 카디널리티가 높은 (중복되지 않는 데이터일수록) 컬럼일 수록 좋다
-- 카디널리티 : 구분되는 행의 갯수 
--  인덱스에서의 카디널리티와 모델링에서의 카디널리티는 의미가 조금 다르다. 인덱스에서는 중복되지 않는 행을 의미. 모델링에서는 모든 행의 갯수

-- 인덱스 단점
-- 1) 별도의 저장공간 필요
-- 2) 주기적으로 인덱스를 다시 달아줘야 된다
-- (주기가 정해져있진 않지만 한달에 한번은 권장 (ex: 스프링 스케줄러 활용)

-- 인덱스 최적화(다시 인덱스 달기)
OPTIMIZE TABLE phone;

DROP INDEX idx_name ON phone;
SHOW INDEX FROM phone;












