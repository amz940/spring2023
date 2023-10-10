SELECT * FROM  customers
WHERE CustomerName = 'around the horn';
SELECT * FROM customers
WHERE CustomerName LIKE '%the%';
SELECT * FROM customers
WHERE CustomerName LIKE '%ch%';

-- lkie : 검색
-- %, _ 기호(wildcard)와 같이 사용
SELECT * FROM customers
WHERE CustomerName LIKE 'ch%'; -- % : 0개 이상의 문자 , -- ch로 시작하는 문자
SELECT * FROM customers
WHERE CustomerName LIKE '%er'; -- % : 0개 이상의 문자 ,  -er로 끝나는 문자
SELECT * FROM customers
WHERE CustomerName LIKE '%ch%'; -- % : 0개 이상의 문자 ,  - ch - 로 끝나는 문자

SELECT * FROM employees
WHERE FirstName LIKE '_____' ; -- _ : _만큼의 문자 아무거나
SELECT * FROM employees
WHERE LastName LIKE '_e%'; -- : 2번째 문자가 e인 문자 아무거나

-- 예) ch로 시작하는 상품명 조회
SELECT * FROM products
WHERE ProductName LIKE 'ch%';
# 예) es로 끝나는 상품명 조회
SELECT * FROM products
WHERE ProductName LIKE '%es';
# 중간에 use가 들어간 상품멸 조회
SELECT * FROM products
WHERE ProductName LIKE '%use%';
# 두번째 글자가 u인 상품명 조회
SELECT * FROM products
WHERE ProductName LIKE '_u%';