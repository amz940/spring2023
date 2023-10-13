USE mydb1;

CREATE TABLE my_table42_a (
    col1 VARCHAR(1)
);

INSERT INTO my_table42_a (col1)
VALUE ('a'),
    ('b'),
    ('c');

CREATE TABLE my_table43_b (
    col1 VARCHAR(1)
);

INSERT INTO my_table43_b (col1)
VALUE ('b'),
    ('c'),
    ('d'),
    ('e');

SELECT *
FROM my_table42_a a INNER JOIN my_table43_b b
ON a.col1 = b.col1;
# USING (col1);  -- Inner join (교집합) 이라고 한다
-- 보통은 생략해서 그냥 JOIN 이라고만 쓴다

SELECT *
FROM my_table42_a a LEFT JOIN my_table43_b b
ON a.col1 = b.col1;

SELECT *
FROM my_table42_a a LEFT OUTER JOIN my_table43_b b
ON a.col1 = b.col1;
-- LEFT JOIN : 교집합 + 왼쪽 테이블에만 있는 ROW 값
-- LEFT OUTER JOIN 이라고도 쓰인다

SELECT *
FROM my_table42_a a RIGHT JOIN my_table43_b b
ON a.col1 = b.col1;

SELECT *
FROM my_table42_a a RIGHT OUTER JOIN my_table43_b b
ON a.col1 = b.col1;
-- RIGHT JOIN : 교집합 + 오른쪽 테이블에만 있는 row 값
-- RIGHT OUTER JOIN 이라고도 쓰인다

CREATE TABLE my_table44_a (
    col1 VARCHAR(1),
    name VARCHAR(10),
    address VARCHAR(10)
);

CREATE TABLE my_table45_b (
    col1 VARCHAR(1),
    product VARCHAR(10),
    country VARCHAR(10)
);
DROP TABLE my_table45_b;

INSERT INTO my_table44_a (col1, name, address)
VALUE ('a','흥민','런던'),
    ('b','강인','파리'),
    ('c','민재','뮌헨');
INSERT INTO my_table45_b (col1, product, country)
VALUE ('b','축구공','한국'),
    ('c','컴퓨터','미국'),
    ('d','전화기','호주'),
    ('e','햄버거','영국');

SELECT *
FROM my_table44_a a JOIN my_table45_b b
ON a.col1 = b.col1;
SELECT *
FROM my_table44_a a LEFT JOIN my_table45_b b
ON a.col1 = b.col1;
SELECT *
FROM my_table44_a a RIGHT JOIN my_table45_b b
ON a.col1 = b.col1;

SELECT *
FROM my_table44_a NATURAL JOIN my_table45_b;