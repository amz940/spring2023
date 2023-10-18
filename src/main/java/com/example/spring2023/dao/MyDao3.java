package com.example.spring2023.dao;

import com.example.spring2023.domain.*;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

@Mapper
public interface MyDao3 {

    // 1god 1열
    @Select("""
        SELECT CustomerName FROM customers
        WHERE CustomerID = 1
    """)
    String select1();

    @Select("""
        SELECT price FROM products
        WHERE ProductID = 1
    """)
    Double select2();

    @Select("""
        SELECT LastName FROM employees
        WHERE EmployeeID = 1
    """)
    String select3();

    @Select("""
        SELECT BirthDate FROM employees
        WHERE EmployeeID = 2
    """)
    LocalDate select4();

    @Select("""
        SELECT DISTINCT Country FROM customers
        ORDER BY 1
    """)
    // 여러개의 행 , 하나의 열
    List<String> select5();

    @Select("""
        SELECT BirthDate FROM employees
        ORDER BY 1
    """)
    List<LocalDate> select6();

    @Select("""
        SELECT Price FROM products
        ORDER BY 1
    """)
    List<Double> select7();

    // 하나의 행 , 여러개의 열
    @Select("""
        SELECT CustomerID, CustomerName, Address
        FROM customers
        WHERE CustomerID = 1
    """)
    // map 에는 순서가 보장되지 않아서 컬럼 순대로 안나올수도 있다
    Map<String, Object> select8();

    @Select("""
        SELECT p.ProductName, p.Price, c.CategoryName
        FROM products p JOIN categories c on p.CategoryID = c.CategoryID
        WHERE ProductID = 1
    """)
    Map<String,Object> select9();

    // 여러 열, 하나의 행
    @Select("""
        SELECT EmployeeID, LastName, FirstName FROM employees
        WHERE EmployeeID = 1
    """)
    // javabean을 활용할 수 있다.
    MyDto19 select10();
//    Map<String, Object> select10();

    @Select("""
        -- DTO랑 맞게 별칭을 넣어주면 된다
        SELECT ProductName `name`, Price, CategoryName `category`
        FROM products p JOIN categories c ON p.CategoryID = c.CategoryID
        WHERE ProductID = 1;
    """)
    MyDto20 select11();

    @Select("""
        SELECT CustomerID id, CustomerName name, Country
        FROM customers
        WHERE CustomerID = 2
    """)
    MyDto21 select12();

    @Select("""
        SELECT ProductID id, ProductName name, Price
        FROM products
        WHERE CategoryID = 2
        ORDER BY Price
    """)
    List<Map<String, Object>> select13();

    @Select("""
        SELECT p.ProductName, od.Quantity, p.Price 
        FROM orderdetails od JOIN products p ON p.ProductID = od.ProductID
                             JOIN orders o ON  o.OrderID = od.OrderID
        WHERE o.OrderDate = '1996-07-04'
    """)
    List<Map<String, Object>> select14();

    @Select("""
        SELECT p.ProductName name, od.Quantity, p.Price
        FROM orderdetails od JOIN products p ON p.ProductID = od.ProductID
                             JOIN orders o ON  o.OrderID = od.OrderID
        WHERE o.OrderDate = '1996-07-04'
    """)
    List<MyDto22> select15();

    @Select("""
        SELECT o.OrderDate date, p.ProductName name, c.CategoryName cname, od.Quantity, p.Price
        FROM products p
            JOIN categories c 
                ON p.CategoryID = c.CategoryID
            JOIN orderdetails od 
                ON p.ProductID = od.ProductID
            JOIN orders o 
                ON o.OrderID = od.OrderID
       
        WHERE c.CategoryID = 1 AND o.OrderDate BETWEEN '1996-01-01' AND '1997-01-01'
        ORDER BY date, name, Quantity
    """)
    List<MyDto23> select16();

    @Select("""
        SELECT CustomerName
        FROM customers
        WHERE CustomerID = 100   
    """)
    String select17();

    @Select("""
        SELECT CustomerName
        FROM customers
        WHERE CustomerID = 100   
    """)
    Integer select18();

    @Select("""
        SELECT CustomerID id, CustomerName name, Country
        FROM customers
        WHERE CustomerID = 1
    """)
    // dto 이름과 dao 이름이 일치 하지 않으면 익셉션 발생
    MyDto24 select19();

    @Select("""
        SELECT CustomerID id, CustomerName name, Country
        FROM customers
        -- WHERE CustomerID > 1
        WHERE CustomerID = 1
    """)
        // where 절이 2개 이상일땐 항상 list에 담자
    MyDto24 select20();
}
