-- column에 넣을 수 있는 제약 사항
-- NULL 허용 여부
-- 유일한 값 여부
-- 기본값 지정
-- 값 체크

USE mydb1;

CREATE TABLE my_table13(
  col1 INT NULL ,  -- NULL 허용 (생략 가능)
  col2 INT NOT NULL  -- NULL 허용 안함
);

INSERT INTO my_table13(col1, col2)
VALUE (33 , 34); -- 가능

INSERT INTO my_table13 (col2)
VALUE (55); -- 가능

INSERT INTO my_table13 (col1)
VALUE (66); -- 불가능 , col2는 null이 안되게금 설정해서

SELECT * FROM my_table13;

-- UNIQUE : 해당 컬럼에 유일한 값만 허용
CREATE TABLE my_table14(
  con1 INT,
  con2 INT UNIQUE  -- 이 컬럼에 중복된 값을 넣을 수 없다
);
INSERT INTO my_table14 (con1, con2)
VALUE (11, 22); -- 가능
INSERT INTO my_table14 (con1, con2)
VALUE (11, 33); -- 가능
INSERT INTO my_table14 (con1, con2)
VALUE (11, 33); -- 불가능

SELECT * FROM my_table14;

CREATE TABLE my_table15(
    col1 INT,
    col2 INT NOT NULL ,
    col3 INT UNIQUE ,
    col4 INT NOT NULL UNIQUE
);
INSERT INTO my_table15(col1, col2, col3, col4)
VALUE (11,22,33,44);
INSERT INTO my_table15(col1, col2, col3, col4)
value (11,22,33,44); -- 안된다, 중복 허용 안됨
INSERT INTO my_table15(col1, col2, col3, col4)
VALUE (11,22,44,NULL); -- 안된다
INSERT INTO my_table15(col1, col2, col3, col4)
VALUE (11,22,44, 55); -- 된다
INSERT INTO my_table15(col2, col3, col4)
VALUE (22, 44, 66); -- 된다 , col명과 value 값 의 갯수가 같아야 한다

SELECT * FROM my_table15;

-- 예) my_table16 로 연습
CREATE TABLE my_table16(
  col1 INT,
  col2 INT NOT NULL ,
  col3 INT UNIQUE
);

-- DEFAULT : 기본값
CREATE TABLE my_table17(
  col1 INT,
  col2 INT DEFAULT 100, -- 값을 넣지 않으면 100
  col3 VARCHAR(10) DEFAULT 'empty', -- 값을 넣지 않으면 'empty'
  col4 DATETIME DEFAULT NOW() -- 값을 넣지 않으면 현재 일시
);

INSERT INTO my_table17 (col1, col2, col3, col4)
VALUE (22,33,'son','2023-11-11 22:23:24');
INSERT INTO my_table17(col1)
VALUE (222);
INSERT INTO my_table17(col1, col2, col3, col4)
VALUE (333,NULL,NULL,NULL);

CREATE TABLE my_table18 (
  col1 INT,
  col2 INT DEFAULT 300,
  col3 INT NOT NULL DEFAULT 500 -- null 허용 안하면서 기본값 500
);
INSERT INTO my_table18(col1, col2, col3)
VALUE (4);
SELECT * FROM my_table18;

CREATE TABLE my_table19(
  col1 INT NOT NULL UNIQUE DEFAULT 100
);

-- 테이블의 컬럼과 타입, 제약사항 등을 확인
-- DESCRIBE, DESC
DESCRIBE my_table18;
DESC my_table18; -- 둘이 같은 명령어

-- TABLE 생성 쿼리 확인
SHOW CREATE TABLE my_table15;
CREATE TABLE `my_table15` (
                              `col1` int(11) DEFAULT NULL,
                              `col2` int(11) NOT NULL,
                              `col3` int(11) DEFAULT NULL,
                              `col4` int(11) NOT NULL,
                              UNIQUE KEY `col4` (`col4`),
                              UNIQUE KEY `col3` (`col3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- CHECK : 값의 유효 범위 체크
CREATE TABLE my_table20(
    col1 INT,
    col2 INT CHECK ( col2 > 100 ),
    col3 INT CHECK ( col3 > 1000 AND col3 < 2000)
);
DESC my_table20; -- 여기선 check 범위가 뜨지 않는다
SHOW CREATE TABLE my_table20; -- create table에서 확인 가능
CREATE TABLE `my_table20` (
                              `col1` int(11) DEFAULT NULL,
                              `col2` int(11) DEFAULT NULL CHECK (`col2` > 100),
                              `col3` int(11) DEFAULT NULL CHECK (`col3` > 1000 and `col3` < 2000)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO my_table20 (col1, col2, col3)
VALUE (10000, 50, -10); -- 범위 벗어나서 안됨

INSERT INTO my_table20 (col1, col2, col3)
VALUE (10000, 150, 1500); -- 가능

SELECT * FROM my_table20;