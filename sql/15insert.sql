-- INSERT INTO tablename (columnName1 , columnName2 ....)
-- VALUES ( value1, value2 ...)

INSERT INTO employees (EmployeeID, LastName, FirstName, BirthDate, Photo, Notes)
VALUE (10, '손', '흥민', '2000-01-01', '사진 10', 'epl');

SELECT * FROM employees ORDER BY EmployeeID DESC ;

INSERT INTO employees (EmployeeID, LastName, FirstName, BirthDate, Photo, Notes)
    VALUE (11, '이', '강인', '2000-02-01', '사진 11', '드리블');

-- 모든 칼럼에 값 넣을 때 컬럼명 나열 생략 가능
INSERT INTO employees
VALUE (12, '김', '민재', '2000-03-03', '사진 12', '수비');

SELECT * FROM employees ORDER BY EmployeeID DESC ;

-- 특정 컬럼에만 값을 넣을 때 컬럼 명 나열 생략하면 안된다
INSERT INTO employees (EmployeeID, LastName, FirstName)
VALUE (13, '박', '지성');  -- 나열된 컬럼명과 값의 순서, 갯수가 같아야 함

SELECT * FROM employees ORDER BY EmployeeID DESC ;

INSERT INTO employees (EmployeeID, FirstName, LastName)
VALUE (14,'차','범근');

SELECT * FROM employees ORDER BY EmployeeID DESC ;

