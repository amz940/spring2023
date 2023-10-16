USE mydb1;

CREATE TABLE my_table46 (
    col1 INT,
    col2 INT,
    col3 INT,
    col4 INT,
    col5 INT
);

-- NOT NULL 제약 사항 추가
ALTER TABLE my_table46
MODIFY col1 INT NOT NULL ;

-- NOT NULL 제약 사항 변경
ALTER TABLE my_table46
MODIFY col1 INT NULL ;

-- 예) col2에 not null 제약사항 추가
ALTER TABLE my_table46
MODIFY col2 INT NOT NULL ;
-- 예) col2에 not null 제약사항 삭제
ALTER TABLE my_table46
MODIFY col2 INT NULL ;

-- DEFAULT 제약 사항 추가
ALTER TABLE my_table46
ALTER col3 SET DEFAULT 100;

-- DEFAULT 제약 사항 삭제
ALTER TABLE my_table46
ALTER col3 DROP DEFAULT ;

-- 예) col4에 기본값 0 제약사항 추가
ALTER TABLE my_table46
ALTER col4 SET DEFAULT 0;
-- 예) col4에 default 제약사항 삭제
ALTER TABLE my_table46
ALTER col4 DROP DEFAULT;

-- UNIQUE 제약 사항 추가
ALTER TABLE my_table46
ADD UNIQUE (col5);

-- UNIQUE 제약 사항 삭제
SHOW CREATE TABLE my_table46;

CREATE TABLE `my_table46` (
                              `col1` int(11) DEFAULT NULL,
                              `col2` int(11) NOT NULL,
                              `col3` int(11),
                              `col4` int(11),
                              `col5` int(11) DEFAULT NULL,
                              UNIQUE KEY `col5` (`col5`)
                            -- `col5`에 해당되는 함수명으로 삭제한다
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

ALTER TABLE my_table46
DROP INDEX col5;

-- PRIMARY KEY 제약 사항 추가
ALTER TABLE my_table46
ADD PRIMARY KEY (col1); -- 2개 이상의 컬럼도 가능

-- PRIMARY KEY 제약 사항 삭제
ALTER TABLE my_table46
DROP PRIMARY KEY ; -- PRIMARY KEY는 어차피 하나이기 때문에 바로 드랍하면된다
                -- key는 없어져도 NOT NULL은 남아 있기 때문에 따로 지정해줘야함

ALTER TABLE my_table46
MODIFY col1 INT NULL ;

CREATE TABLE my_table47 (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(10)
);

-- FOREIGN KEY 제약사항 추가
ALTER TABLE my_table46
ADD FOREIGN KEY (col5) REFERENCES my_table47(id);

-- FOREIGN KEY 제약사항 삭제
SHOW CREATE TABLE my_table46;
CREATE TABLE `my_table46` (
                              `col1` int(11) DEFAULT NULL,
                              `col2` int(11) NOT NULL,
                              `col3` int(11),
                              `col4` int(11),
                              `col5` int(11) DEFAULT NULL,
                              KEY `col5` (`col5`),
                              CONSTRAINT `my_table46_ibfk_1` FOREIGN KEY (`col5`) REFERENCES `my_table47` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

ALTER TABLE my_table46
DROP FOREIGN KEY `my_table46_ibfk_1`; -- FOREIGN KEY 함수명을 가져와서 드랍시킨다

ALTER TABLE my_table46
DROP INDEX col5; -- 함수명뿐만 아니라 index로 컬럼까지 지정해서 마저 다 드랍시켜야 된다

DESC my_table46;

