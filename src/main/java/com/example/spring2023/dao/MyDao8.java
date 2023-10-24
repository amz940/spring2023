package com.example.spring2023.dao;

import com.example.spring2023.domain.MyDto33Employee;
import com.example.spring2023.domain.MyDto45;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.Map;

@Mapper
public interface MyDao8 {

    @Select("""
            SELECT *
            FROM products
            WHERE ProductID = #{id}
            """)
    Map<String, Object> selectProductById(Integer id);

    @Select("""
            SELECT EmployeeID,
                   FirstName,
                   LastName,
                   BirthDate,
                   Photo,
                   Notes
            FROM employees
            WHERE EmployeeID = #{id}
            """)
    MyDto33Employee selectByEmplyeeId(Integer id);

//    id(상품 id)
//    price(상품 가격)
//    category(카테고리명)
//    unit(단위)
    @Select("""
            SELECT p.ProductID id, p.Price, c.CategoryName category, p.Unit
            FROM products p
                JOIN categories c
                    ON p.CategoryID = c.CategoryID
            WHERE ProductID = #{id}
            """)
    MyDto45 selectByProductId(Integer id);
}
