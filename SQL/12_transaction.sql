/* transaction */
-- 논리적 일의 단위
-- 될꺼면 같이되고 실패하면 같이 안되야 되는 단위
-- 요청당 처리해야 되는 단위

-- autocommit 비활성화 하고 시작
SET autocommit = 0;

START TRANSACTION;
INSERT
  INTO tbl_menu
VALUES
(
  NULL, '바나나해장국', 8500
, 4, 'Y'
);

UPDATE tbl_menu
   SET menu_name = '수정된 메뉴'
 WHERE menu_code = 5;
 
SELECT * FROM tbl_menu ORDER BY 1 desc;

-- rollback;
commit;

-- 경우에 따라 번호발생기인 auto_increment 개념을 내가 원하는 숫자로 초기화 해야 할 수 있다.
ALTER TABLE tbl_menu AUTO_INCREMENT = 30;

-- 잘못 작성한 게 있다면 삭제하고 commit을 해 주어야 실제 베이스 테이블에 반영된다.
DELETE FROM tbl_menu WHERE menu_code = 40;
COMMIT;