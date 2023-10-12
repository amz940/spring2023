USE mydb1;

-- PRIMANY KEY ( 주키 , 기본키 , PK ) 로 불린다
CREATE TABLE my_table27(
    id INT PRIMARY KEY ,
    name VARCHAR(20)
);
CREATE TABLE my_table28( -- 27 테이블이랑 같은 코드
    id INT,
    name VARCHAR(10),
    PRIMARY KEY (id)
);
CREATE TABLE my_table29 (
    name VARCHAR(10),
    birth DATE,
    PRIMARY KEY (name, birth) -- 특별한 이유가 있으면 키를 2개 이상 지정가능
                              -- 보통은 하나만 지정한다
);
CREATE TABLE my_table30 (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(10)
);
INSERT INTO my_table30( name)
VALUE ('son');
INSERT INTO my_table30(  name)
    VALUE ('kim');
INSERT INTO my_table30(  name)
    VALUE ('lee');
INSERT INTO my_table30(  name)
    VALUE ('park');
INSERT INTO my_table30(name)
VALUE ('kim');

SELECT * FROM my_table30;
DELETE FROM my_table30 WHERE id = 4;
-- 4번을 지운다고 다음번 생성되는게 4번이 되는게 아니라
-- 5번으로 간다. 굳이 4번으로 채울려고 하지 마라 버그 생긴다

