package com.example.spring2023.dao;

import com.example.spring2023.domain.MyDto40;
import com.example.spring2023.domain.MyDto41;
import org.apache.ibatis.annotations.*;
import org.springframework.web.bind.annotation.GetMapping;

import java.time.LocalDate;
import java.util.Map;

@Mapper
public interface MyDao7 {

    @Select("""
            SELECT * FROM customers
            WHERE CustomerID = #{id}
            """)

    Map<String, Object> selectByCustomerId(Integer id);

    @Select("""
            SELECT * FROM employees
            WHERE EmployeeID = #{id}
            """)
    Map<String, Object> selectByEmployeeId(Integer id);

    @Insert("""
            INSERT INTO employees (LastName, firstName, birthDate)
            VALUES (#{lastName}, #{firstName}, #{birthDate})
            """)
    int inserEmployee(String lastName, String firstName, LocalDate birthDate);

    @Insert("""
            INSERT INTO products (productName, price, categoryId)
            VALUES (#{name}, #{price}, #{category})
            """)
    int insertProduct(String name, Double price, Integer category);

    @Delete("""
            DELETE FROM products
            WHERE ProductID = #{id}
            """)
    int deletByProductId(Integer pid);

    @Delete("""
            DELETE FROM customers
            WHERE CustomerID = #{id}
            """)
    int deleteByCustomerId(Integer cid);

    @Update("""
UPDATE products
SET price = #{price},
    CategoryID = #{category},
    productName = #{name}
WHERE ProductID = #{id}
""")
    int updateProduct(MyDto40 dto);

    @Update("""
            UPDATE employees
            SET LastName = #{lastName},
                FirstName = #{firstName},
                BirthDate = #{birthDate}
            WHERE EmployeeID = #{id}
            """)
    int updateEmployee(MyDto41 dto);
}
