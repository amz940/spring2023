# 테이블 끼리 서로 참조하는 경우

USE mydb1;
-- 1 : n
# 가장 자주 쓰임

-- 책 (347쪽)
-- 1 : 1
# 자주 사용하진 않는다
# 공유하길 원치 않는(민감한 정보를 담은) 컬럼을 따로 뺄 수 있다
CREATE TABLE my_table37_employee(
    id Int PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(20),
    birth DATE,
    salary INT,
    address VARCHAR(20)
);

CREATE TABLE my_table_38_employee_info (
    id INT REFERENCES my_table37_employee(id),
    salary INT,
    address VARCHAR(20)
) ;

-- 책 (350쪽)
-- n : m ( 다 대 다)
#  다 대 다 방식은 기존에 있는 2개의 테이블 말고도
#  2개의 테이블에 1 : n 방식으로 추가하는 테이블이 하나 더 필요하다

CREATE TABLE my_table39_person (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(20),
    skill VARCHAR(20)
);

CREATE TABLE my_table40_skill (
    id INT PRIMARY KEY AUTO_INCREMENT,
    skill_name VARCHAR(20)
);

CREATE TABLE my_table41_person_skill (
    person_id INT REFERENCES my_table39_person(id),
    skill_id INT REFERENCES my_table40_skill(id),
    PRIMARY KEY (person_id,skill_id)
);