package com.example.spring2023.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.sql.DataSource;
import java.sql.*;

@Controller
@RequestMapping("main21")
public class Controller21 {

    @Autowired
    private DataSource dataSource;

    @RequestMapping("sub1")
    public void method1() throws SQLException {
        String sql = """
                SELECT CustomerName name, Country
                FROM customers
                WHERE CustomerID <= 3
                """;
        Connection connection = dataSource.getConnection();
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery(sql);

        try(connection; statement; resultSet){
            System.out.println("고객 목록");
            while (resultSet.next()){
//                String name = resultSet.getString(1);
//                String country = resultSet.getString(2);

                // sql이 변경 될 수도 있기 때문에 숫자보단
                // 이름을 적어주는게 훨씬더 직관적이고 안전하다
                // 대소문자 상관없다
                String name = resultSet.getString("name");
                String country = resultSet.getString("Country");

                System.out.println( name + ":" + country);
            }
        }

    }

    @GetMapping("sub2")
    public void method2() throws SQLException {
        String sql = """
                SELECT CONCAT(LastName, ', ', FirstName) AS fullName,
                BirthDate AS birth,
                Notes as `DESC`
                FROM employees
                WHERE EmployeeID <= 5
                """;

        Connection connection = dataSource.getConnection();
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery(sql);

        try(connection; statement; resultSet) {
            System.out.println("직원 목록");
            while (resultSet.next()){
                String name = resultSet.getString("fullName");
                String birth = resultSet.getString("Birth");
                String note = resultSet.getString("DESC");

                System.out.println(name + ": " + birth + " " +note);

            }
        }
    }
}
