USE w3schools;

-- ALTER TABLE : 테이블 수정

-- 컬럼 추가, 변경, 삭제

-- 제약 사항 변경
-- NOT NULL, UNIQUE, PRIMARY KEY, DEFAULT, FOREIGN KEY ..

-- 컬럼 추가
ALTER TABLE products
ADD COLUMN col1 INT;
ALTER TABLE products
ADD COLUMN col2 VARCHAR(10);

ALTER TABLE products
ADD COLUMN col3 VARCHAR(10) AFTER ProductName;
-- 특정 컬럼 뒤에 새로운 컬럼을 추가하고 싶을때 AFTER를 쓴다
-- 코드들이 꼬일 수 있기 때문에 조심해야 하고 권장하지 않는다

ALTER TABLE products
ADD COLUMN col4 VARCHAR(10) FIRST ;
-- 컬럼 첫번째로 추가하겠다(FIRST)

ALTER TABLE products
ADD COLUMN col5 INT NOT NULL DEFAULT 1
REFERENCES employees(EmployeeID);

DESC products; -- 컬럼 2개 추가됨

-- 예) 직원 테이블에 salary 컬럼 마지막에 추가
-- data type은 dec(10, 2), null 허용 안하고, 기본값은 0.00
ALTER TABLE employees
ADD COLUMN salary DEC(10,2) NOT NULL DEFAULT 0.00;

DESC employees;

-- 컬럼 삭제
-- 경고 없이 바로 삭제해버리기 때문에 조심해야 한다
ALTER TABLE products
DROP COLUMN col1;

-- 예) products 테이블에서 col2 컬럼 삭제
ALTER TABLE products
DROP COLUMN col2;

DESC products;

-- 컬럼 변경 (타입 변경)
ALTER TABLE products
MODIFY COLUMN col3 INT;

INSERT INTO products (col4)
VALUE ('pizza');
-- 컬럼을 변경할때 이미 값이 부여되어 있다면 따른 타입일 경우 익셉션 발생
-- 예) String으로 된 row값이 있다면  int로 변환 불가
-- 단, 문자 허용 갯수를 늘리는건 가능, 줄이는건 위험!!!

ALTER TABLE products
MODIFY COLUMN col4 INT;

ALTER TABLE products
MODIFY COLUMN col4 VARCHAR(20);