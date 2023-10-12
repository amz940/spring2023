-- 정규화 ( NORMALIZATION )
-- 첫번째 정규화 (FIRST NORMAL FORM) 1NF
-- 원자적 데이터를 가진 테이블, PRIMARY KEY 컬럼이 있어야 한다

-- 두번째 정규화 (SECOND NORMAL FORM) 2NF
-- 1NF + 부분적 함수 의존이 없어야 한다.
-- 부분적 함수 의존이란?
-- !!!!! 키가 아닌 컬럼의 값이 키 컬럼 일부에 종속되지 않아야 한다.
-- 컬럼의 값이 변경되었을때 키 값이 바뀌면 안된다
-- 그렇기 때문에 키 값에 의미가 담기면 안좋다
-- 키의 일부가 변경될 때 키가 아닌 컬럼이 변경되어야 한다면 부분적 함수 의존

-- 세번째 정규화 (THIRD NORMAL FORM) 3NF
-- 2NF + 이행적 종속이 없어야 한다.
-- 이행적 종속( transitive dependency) 이란?
-- 키가 아닌 컬럼이 키가 아닌 다른 컬럼에 의존
-- 키가 아닌 컬럼이 변경될때 다른 키가 아닌 컬럼이 변경되어야 할때 이행적 종속이라 한다

-- 입사지원자
-- 이름, 학교, 학교주소
USE mydb1;

CREATE TABLE my_table30_person(
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(10),
  school VARCHAR(30),
  school_address VARCHAR(50)
);
INSERT INTO my_table30_person (name, school, school_address)
VALUES ('김도현','정처기','이대'),
       ('강인','연세','신촌'),
       ('민재','연세','신촌'),
       ('지성','고려','안암')
; -- 2NF 까진 만족했지만 ( PK에 종속되는 칼럼이 없기 때문)
-- 3NF는 만족하지 못했다 ( school과 address가 연결되어 있기 때문)

SELECT * FROM my_table30_person;

CREATE TABLE my_table31_person (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(10),
    school VARCHAR(20)
);
INSERT INTO my_table31_person (name, school)
VALUES ('김도현','서울대'),
       ('강인','연세'),
       ('민재','연세'),
       ('지성','고려');

CREATE TABLE my_table32_school (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR (10),
    address VARCHAR (10)
);
INSERT INTO my_table32_school (name, address)
VALUES ('seoul univ','관악'),
       ('연세','신촌'),
       ('고려','안암');


CREATE TABLE my_table33_person (
   id INT PRIMARY KEY AUTO_INCREMENT,
   name VARCHAR(10),
   school_id INT -- 따른 테이블에 있는걸 사용할땐 컬럼값이 아니라 PK 값을 참조해서 사용해야 한다
);
INSERT INTO my_table33_person (name, school_id)
    VALUE ('흥민', 1),
    ('강인',2),
    ('민재',3);

CREATE TABLE my_table34_school (
   id INT PRIMARY KEY AUTO_INCREMENT,
   name VARCHAR (10),
   address VARCHAR (10)
);
INSERT INTO my_table34_school (name, address)
VALUE ('서울대','관악'),
    ('연세대','신촌'),
    ('고려대','안암');

INSERT INTO my_table33_person (name, school_id)
    VALUE ('지성', 4); -- 안됨

SELECT * FROM my_table34_school;


CREATE TABLE my_table35_person (
   id INT PRIMARY KEY AUTO_INCREMENT,
   name VARCHAR(10),
   school_id INT REFERENCES my_table36_school(id)
-- 36번 테이블을 참조해서 만들어져야 한다
-- 외래키(foreign key) 제약사항이라고 한다
);

INSERT INTO my_table35_person (name, school_id)
    VALUE ('흥민', 1),
    ('강인',2),
    ('민재',3);

CREATE TABLE my_table36_school (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR (10),
    address VARCHAR (10)
);

INSERT INTO my_table36_school (name, address)
    VALUE ('서울대','관악'),
    ('연세대','신촌'),
    ('고려대','안암');



INSERT INTO my_table35_person (name, school_id)
VALUE ('지성',4);

SELECT * FROM my_table35_person;

DELETE FROM my_table36_school WHERE id =1;
DELETE FROM my_table36_school WHERE id =3;
DESC my_table35_person;
SHOW CREATE TABLE my_table35_person;
CREATE TABLE `my_table35_person` (
                                     `id` int(11) NOT NULL AUTO_INCREMENT,
                                     `name` varchar(10) DEFAULT NULL,
                                     `school_id` int(11) DEFAULT NULL,
                                     PRIMARY KEY (`id`),
                                     KEY `school_id` (`school_id`),
                                     CONSTRAINT `my_table35_person_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `my_table36_school` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci

-- 외래키 , 참조키 , FK (foreign key)