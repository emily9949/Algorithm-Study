-- trigger
delimiter //

-- 	
-- insert 시에  total_order_price 를 tbl_order 테이블에 계산해서 추가하는 트리거
CREATE OR REPLACE TRIGGER after_order_menu_insert 
	-- insert 이벤트가 발생하면 새로운 행이 new 로 들어옴
	AFTER INSERT 
	ON tbl_order_menu
	FOR EACH ROW -- insert 가 발생하면 행마다 begin-end 사이의 작업을 수행
BEGIN 
	UPDATE tbl_order
	SET total_order_price = total_order_price + NEW.order_amount * (SELECT menu_price FROM tbl_menu WHERE menu_code = NEW.menu_code)
	WHERE order_code = new.order_code;
END // 

delimiter;

-- 1) 주문 테이블 insert
INSERT 
	INTO tbl_order
(
	order_code, order_date
	, order_time, total_order_price
)
VALUES 
(
	NULL
	, concat(cast(YEAR(now())AS VARCHAR(4))
	, cast(lpad(dayofmonth(now()), 2, 0) AS VARCHAR(2))
	)
	, concat(cast(lpad(HOUR(now()), 2, 0) AS VARCHAR(2))
	, cast(lpad(MINUTE(now()), 2, 0) AS VARCHAR(2))
	, cast(lpad(SECOND(now()), 2, 0) AS VARCHAR(2))
	)
	, 0
);



SELECT * FROM tbl_order;

-- insert 를 할 때 자동으로 trigger가 실행
-- tbl_order 테이블에 total_order_price 를 추가해줌
INSERT 
	INTO tbl_order_menu
(order_code, menu_code, order_amount)
VALUES
(1,2,3);

-- ---------------------------------------------
-- 상품 입출고와 관련된 trigger 예제
-- 1) 이력 테이블 (update가 발생하는 테이블)
CREATE TABLE product(
		pcode INT PRIMARY KEY AUTO_INCREMENT,
		 pname VARCHAR(30),
		 brand VARCHAR(30),
		 price INT,
		 stock INT DEFAULT 0,
		 CHECK(stock >= 0)
);

-- 2) 내역 테이블 (insert 가 발생하는 테이블)
CREATE TABLE pro_detail(
	decode INT PRIMARY KEY AUTO_INCREMENT,
	pcode INT,
	pdate DATE,
	amount INT,
	STATUS VARCHAR(10) CHECK(STATUS IN ('입고', '출고')),
	FOREIGN KEY(pcode) REFERENCES product -- 무조건 부모 테이블의 pk가 넘어와야 되므로 (pcode)는 생략 가능
);

-- 입출고용 트리거 생성
delimiter //

CREATE OR REPLACE TRIGGER trg_productafter
	 AFTER INSERT
	  ON pro_detail
	  FOR EACH ROW
BEGIN
 -- 입고 물품과 동일한 제품의 재고량을 증가시킨다
	IF new.status = '입고' THEN
		UPDATE product
			SET stock = stock + new.amount
		 WHERE pcode = new.pcode;
	 ELSEIF new.status = '출고' THEN
	 	UPDATE product
			SET stock = stock + new.amount
		 WHERE pcode = new.pcode;
	 END IF; -- if문 종료
END // 

delimiter;

-- 만든 트리거 확인
SHOW TRIGGERS;


-- product 테이블에 기본 상품 추가

INSERT
	INTO product
(	pcode, pname, brand, price, stock
)	
VALUES 
(
	NULL, '갤럭시플립', '삼성', 900000, 5
),
(
	NULL, '아이폰16', '애플', 1000000, 5 
),
(
	NULL, '투명폰', '삼성', 2100000, 5
);

SELECT * FROM product;

-- 내역 테이블에 insert 실행 (입출고 진행)
-- product 테이블에 재고가 추가됨
INSERT
 INTO pro_detail
(
	decode, pcode, pdate, amount, STATUS
)
VALUES 
(
	NULL, 3, curdate(), 4, '입고'
);

SELECT * FROM product;






















