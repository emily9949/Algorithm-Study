-- DDL 
CREATE TABLE tb1 (
		pk INT PRIMARY KEY,
		 fk INT,
		 col1 VARCHAR(255),
		 CHECK(col1 IN ('Y', 'N')) -- col1 에 제약조건을 걸 수 있음
);

-- 존재하는 테이블을 요약해서 간략히 보고 싶다면 desc 키워드 사용
DESCRIBE tb1;
DESC tb1;

INSERT 
	INTO tb1
VALUES (
	1,2,'Y'
);

-- auto_increment 
-- if not exists 
-- drop 
CREATE TABLE tb2 IF NOT EXISTS tb2 (
	pk INT PRIMARY KEY AUTO_INCREMENT,
	fk INT,
	col1 VARCHAR(255)
	CHECK(col1 IN ('Y', 'N'))
);

DROP TABLE tb2;


INSERT
	INTO tb2
VALUES (
	NULL, 2, 'N'
);

SELECT * FROM tb2;
COMMIT; 


-- alter
-- 컬럼 추가
ALTER TABLE tb2 ADD col2 INT NOT NULL;

DESC tb2;

-- 컬럼 삭제
ALTER TABLE tb2 DROP COLUMN col2;

-- 컬럼 이름 및 컬럼 정의 변경
-- fk 를 change_fk 로 변경
ALTER TABLE tb2 CHANGE COLUMN fk change_fk INT NOT NULL; 
DESC tb2;

-- auto_increment 먼저 제거 (drop 아닌 modify)
ALTER TABLE tb2 MODIFY pk INT;

-- 다시 primary key 제거
ALTER TABLE tb2 DROP PRIMARY KEY;

DESC tb2;

-- truncate 
-- 절삭 (truncate) vs 삭제 (delete)
-- truncate 가 속도가 훨씬 빠름
-- 테이블의 초기화, 테이블의 데이터 및 관련 제약조건 제거
CREATE TABLE IF NOT EXISTS tb3 (
	pk INT AUTO_INCREMENT,
	fk INT,
	col1 VARCHAR(255) CHECK(col1 IN('Y', 'N')), -- 컬럼 레벨에 제약조건을 걸기
	PRIMARY KEY(pk) -- 테이블 레벨에 제약조건을 걸기
)

INSERT 
	INTO tb3
VALUES
(
	NULL, 1, 'N'
);

TRUNCATE TABLE tb3;








