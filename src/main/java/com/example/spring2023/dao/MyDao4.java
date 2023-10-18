package com.example.spring2023.dao;

import com.example.spring2023.domain.*;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.time.LocalDate;
import java.util.List;

@Mapper
public interface MyDao4 {

    @Select("""
        SELECT CustomerName
        FROM customers
        WHERE CustomerID = #{아이디}
    """)
    // 파라미터가 하나면 이름이 일치하지 않아도 된다
    // 단 복수 일 경우 꼭 일치해야 한다
    String select1(Integer id);

    @Select("""
        SELECT ProductName
        FROM products
        -- WHERE Price BETWEEN ? AND ?
        WHERE Price BETWEEN #{from} AND #{to}
    """)
    List<String> select2(Double from, Double to);

    @Select("""
        SELECT DISTINCT (p.ProductName)
        FROM orders o
            JOIN orderdetails od ON o.OrderID = od.OrderID
            JOIN products p ON p.ProductID = od.ProductID
        WHERE o.OrderDate
        BETWEEN #{from} AND #{to}
        ORDER BY 1
    """)
    List<String> select3(LocalDate from, LocalDate to);

    @Select("""
        SELECT ProductName FROM products
        WHERE Price BETWEEN #{min} AND #{max}
        -- dto가 들고 있는 property (이름)을 입력
    """)
    List<String> select4(MyDto25 dto);

    @Select("""
        SELECT CustomerName FROM customers
        -- WHERE Country = #{country1} OR Country = #{country2}
        WHERE Country IN (#{country1}, #{country2})
    """)
    List<String> select5(MyDto26 dto);

    @Select("""
        SELECT COUNT(OrderID)
        FROM orders
        -- 2개 이상의 클래스에서 property를 받는다고 할때 
        WHERE OrderDate BETWEEN #{dto1.from} AND #{dto2.to}
    """)
    Integer select6(MyDto27 dto1, MyDto28 dto2);

    @Select("""
        SELECT CustomerName
        FROM customers
        WHERE CustomerName LIKE #{dto2.keyword}
        LIMIT #{dto1.from}, #{dto1.rows}
        
        
    """)
    List<String> select7(MyDto29 dto1, MyDto30 dto2);

    @Insert("""
        INSERT INTO customers (CustomerName, Country)
        VALUE (#{name}, #{country})
    """)
    Integer insert1(MyDto31 dto);

    @Insert("""
        INSERT INTO employees (LastName, FirstName)
        VALUE (#{lastName}, #{firstName})
    """)
    int insert2(MyDto32 emp);
}
