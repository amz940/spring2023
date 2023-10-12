USE mydb1;
-- normalization : 정규화
# 하나의 칼럼에 하나의 데이터값만 들어가게 한다

-- atomic data (원자적 데이터) 책 209쪽
-- 예) 이름, 최종학력, 특기

-- 원자적 데이터로 구성된 테이블은 같은 타입의 데이터를 여러 열에 가질 수 없다.
CREATE TABLE my_table21_person(
    name VARCHAR(100) NOT NULL,
    학력 VARCHAR(100),
    특기 VARCHAR(1000)
);
INSERT INTO my_table21_person (name, 학력, 특기)
VALUE ('손흥민', '대학', '축구,노래');
INSERT INTO my_table21_person (name, 학력, 특기)
VALUE ('이강인', '대학원', '노래');
INSERT INTO my_table21_person (name, 학력, 특기)
VALUE ('김민재', '대학원', '농구,야구');
SELECT * FROM my_table21_person;

-- 책 209쪽 규칙 2
-- 원자적 데이터로 구성된 테이블은 같은 타입의 데이터를 여러 열에 가질 수 없다.
CREATE TABLE my_table22_person  (
   name VARCHAR(20) NOT NULL ,
   schools VARCHAR(100),
   skill1 VARCHAR(100),
   skill2 VARCHAR(100),
   skill3 VARCHAR(100)
);
INSERT INTO my_table22_person (name, schools, skill1, skill2, skill3)
VALUE ('흥민','대학','축구','노래', null);
INSERT INTO my_table22_person (name, schools, skill1, skill2, skill3)
VALUE ('강인','대학원','노래',null,null);
INSERT INTO my_table22_person (name, schools, skill1, skill2, skill3)
VALUE ('민재','대학원','농구','배구','탁구');

SELECT * FROM my_table22_person;

CREATE TABLE my_table23_person (
   name VARCHAR(100) NOT NULL,
   학력 VARCHAR(100),
   특기 VARCHAR(1000)
);
INSERT INTO my_table23_person (name, 학력, 특기)
VALUE ('손흥민', '대학', '축구');
INSERT INTO my_table23_person (name, 학력, 특기)
VALUE ('손흥민', '대학', '노래');
INSERT INTO my_table23_person (name, 학력, 특기)
VALUE ('강인', '대학', '야구');
INSERT INTO my_table23_person (name, 학력, 특기)
VALUE ('강인', '대학', '농구');

SELECT * FROM my_table23_person;

-- KEY : 각 행(rows)을 구분하는 컬럼(들)

-- 정규화란?
-- 각 행의 데이터는 원자적 값을 가져야 한다. (하나의 값만)
-- 각 행은 유일한 식별자인 key를 들고 있어야 한다

CREATE TABLE my_table_24_person (
  주민번호 VARCHAR(13) NOT NULL UNIQUE , -- key 컬럼
  name VARCHAR(10) NOT NULL,
  school VARCHAR(10),
  skill VARCHAR(10)
);

-- 기본키(primary key) 조건
-- 각 레코드를 다른 레코드와 구분하는 열
# 1. 기본키는 각 레코드를 식별하는데 사용
# 2. 기본키는 NULL 값이 될 수없다.
# 3. 기본키는 레코드가 삽입될 때 값이 있어야 한다.
# 4. 기본키는 간결해야 한다
# 5. 기본키는 변경 불가(finally) 값이여야 한다 ( 해킹 위험 )
-- 가장 좋은 기본키는 기본키를 위해 새로 만든 열이다! ( ID number 등)

CREATE TABLE my_table25_person(
    id INT NOT NULL UNIQUE AUTO_INCREMENT,
    -- auto_increment : 값이 삽입될때 자동으로 1부터 증가된 값 입력해준다
    ssn VARCHAR(10) NOT NULL ,-- 값이 비어도 안되고 중복되도 안된다
    name VARCHAR(20) NOT NULL ,
    school VARCHAR(20),
    skill VARCHAR(10)
);
DROP TABLE my_table25_person; -- 데이터 삭제

INSERT INTO my_table25_person (ssn, name, school, skill)
VALUE ('940001','도현','대학','게임');
INSERT INTO my_table25_person (ssn, name, school, skill)
VALUE ('940001','강인','대학','축구');
INSERT INTO my_table25_person (ssn, name, school, skill)
VALUE ('870001','민재','대학원','농구');
INSERT INTO my_table25_person (ssn, name, school, skill)
VALUE ('860001','흥민',null,null);

SELECT * FROM my_table25_person;

CREATE TABLE my_table26_person(
    -- NOT NULL UNIQUE  =  PRIMARY KEY 같은 코드
  id INT PRIMARY KEY AUTO_INCREMENT,
-- auto_increment : 값이 삽입될때 자동으로 1부터 증가된 값 입력해준다
  ssn VARCHAR(10) NOT NULL ,-- 값이 비어도 안되고 중복되도 안된다
  name VARCHAR(20) NOT NULL ,
  school VARCHAR(20),
  skill VARCHAR(10)
);
DESC my_table25_person;
DESC my_table26_person;

