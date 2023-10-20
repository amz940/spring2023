USE w3schools;

CREATE TABLE bank(
  name VARCHAR(10) PRIMARY KEY,
  money INT NOT NULL DEFAULT 0
);

INSERT INTO bank (name, money)
VALUE ('son', 10000),
      ('kim', 10000);


-- 송금 업무 son -> kim 1000원 송금
-- DML처럼 반드시 한번에 일어나야 할 업무 순서 = transaction 이라고 한다
-- DML(삭제, 추가, 수정)을 할때 tx(transaction): manual로 바꿔주면 된다
-- 완료하지 않으면 따른 테이블에선 완료하기 전 결과값만 나온다
UPDATE bank
SET money = money - 1000
WHERE name = 'son';
UPDATE bank
SET money = money + 1000
WHERE name = 'kim';

-- manual에서 완료하는 방법
-- 되돌리기
ROLLBACK ;
-- 반영하기
COMMIT ;


SELECT * FROM bank;
