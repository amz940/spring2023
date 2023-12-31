package com.example.spring2023.controller;

import com.example.spring2023.domain.MyDto00;
import com.example.spring2023.domain.MyDto15;
import com.example.spring2023.domain.MyDto16;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("main20")
public class Controller20 {

    @Autowired
    private DataSource dataSource;

    @GetMapping("sub1")
    public void method1(){

    }

    @GetMapping("sub2")
    public String method2(String id, Model model) throws SQLException {
        String sql = """
                SELECT CustomerID, CustomerName, Address, Country
                FROM customers
                WHERE CustomerID = ? -- preparedStatement
                """;


        Connection connection = dataSource.getConnection();
        // connection에서 미리 컴파일을 시킨다
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, id);
        // 미리 컴파일을 해놨기 때문에 값을 넣지 않는다
        ResultSet resultSet = statement.executeQuery();


        List<MyDto15> list = new ArrayList<>();


        // 실행 결과 처리
        try( connection; statement; resultSet;){
            while (resultSet.next()){
                MyDto15 dto = new MyDto15();

                dto.setId(resultSet.getString(1));
                dto.setName(resultSet.getString(2));
                dto.setAddress(resultSet.getString(3));
                dto.setCountry(resultSet.getString(4));

                list.add(dto);
            }
        }

        // 처리한 결과 model에 attribute 넣고
        model.addAttribute("customerList", list);

        // 적절한 view로 foward
        return "/main19/sub6";

    }

    @GetMapping("sub3")
    public void method3(String id) throws SQLException {
        String sql = """
                SELECT customerId, customerName, country
                FROM customers
                WHERE customerId = ?
                """;

        Connection connection = dataSource.getConnection();
        PreparedStatement statement = connection.prepareStatement(sql);

        // ? 를 채우는 코드
        // 1, 3 에서 1은 ?의 위치인가? ---> yes
        statement.setString(1,id);

        ResultSet resultSet = statement.executeQuery();

        try( connection; statement; resultSet;){
            while (resultSet.next()){
                System.out.println("고객 정보");
                System.out.println(" id = " + resultSet.getString(1));
                System.out.println(" name = " + resultSet.getString(2));

            }
        }

    }

    @GetMapping("sub4")
    public void method4(Integer id) throws SQLException {
        String sql= """
                SELECT productId, ProductName
                FROM products
                WHERE ProductID = ? 
                """;

        Connection connection = dataSource.getConnection();
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setInt(1, id);
        ResultSet resultSet = statement.executeQuery();

        try(connection; statement; resultSet;){
            while (resultSet.next()){
                System.out.println();
                System.out.println("고객 정보");
                System.out.println(" id = " + resultSet.getInt(1));
                System.out.println(" name = " + resultSet.getString(2));

            }
        }
    }

    // /main20/sub5?country=spain
    // 콘솔에 spain에 사는 고객 이름 출력
    @GetMapping("sub5")
    public void method5(String country) throws SQLException {
        String sql = """
                SELECT CustomerID, CustomerName, Country, Address
                FROM customers
                WHERE Country = ?
                """;

        Connection connection = dataSource.getConnection();
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, country);
        ResultSet resultSet = statement.executeQuery();

        while (resultSet.next()){
            System.out.println();
            System.out.println("id = " + resultSet.getInt(1));
            System.out.println("name = " + resultSet.getString(2));
            System.out.println("country = " + resultSet.getString(3));
            System.out.println("address = " + resultSet.getString(4));
        }
    }

    @GetMapping("sub6")
    public void method6(String c1, String c2) throws SQLException {
        String sql = """
                SELECT CustomerName, Country
                FROM customers
                WHERE Country = ? OR  Country =?
                """;

        Connection connection = dataSource.getConnection();
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, c1);
        statement.setString(2, c2);
        ResultSet resultSet = statement.executeQuery();

        System.out.println("국가별 손님 정하기");
        try( connection; statement; resultSet;){
            while (resultSet.next()){
                String country = resultSet.getString(c1);
                String name = resultSet.getString(c2);
                System.out.println();
                System.out.println(country + ":" + name);
            }
        }
    }

    @GetMapping("sub7")
    public void method7(){

    }

    @GetMapping("sub8")
    public String method8(Double min, Double max, Model model) throws SQLException {
        String sql = """
                SELECT Price, ProductName
                FROM products
                WHERE Price >= ? AND  Price <= ?
                """;

        Connection connection = dataSource.getConnection();
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setDouble(1, min);
        statement.setDouble(2, max);

        ResultSet resultSet = statement.executeQuery();

        List<MyDto16> list = new ArrayList<>();
        try( connection; statement; resultSet;){
            while (resultSet.next()){
                MyDto16 dto = new MyDto16();
                dto.setPrice(resultSet.getDouble(1));
                dto.setName(resultSet.getString(2));
                System.out.println();

                list.add(dto);
            }
        }

        model.addAttribute("productList", list);

        return "/main19/sub5";
    }

    @GetMapping("sub9")
    public void method9(@RequestParam("country") List<String> countryList) throws SQLException {
        String questionMarks = "";
        for (int i = 0; i < countryList.size(); i++) {
            questionMarks += "?";

            if (i < countryList.size()-1) {
                questionMarks += ", ";
            }
        }
        // 특정 국가에 속한 고객들 조회
        String sql = """
                SELECT *
                FROM customers
                WHERE country IN ("""

                +

                questionMarks

                +

                """
                )
                """;

//        System.out.println("sql = " + sql);

        Connection connection = dataSource.getConnection();
        PreparedStatement statement = connection.prepareStatement(sql);

        for (int i = 0; i < countryList.size(); i++) {
            statement.setString(i + 1, countryList.get(i));
        }
        ResultSet resultSet = statement.executeQuery();

        try (connection; statement; resultSet) {
            System.out.println("고객 목록");
            while (resultSet.next()) {
                String name = resultSet.getString(2);
                String country = resultSet.getString(7);

                System.out.println(name + " : " + country);
            }
        }
    }


    @GetMapping("sub10")
    public void method10(Model model) throws SQLException {
        //공급자의 국가 목록 조회
        String sql = """
                SELECT DISTINCT Country
                FROM suppliers
                """;

        Connection connection = dataSource.getConnection();
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery(sql);

        List<String> list = new ArrayList<>();
        try( connection; statement; resultSet;) {
            while (resultSet.next()){
                list.add(resultSet.getString(1));
            }
        }

        model.addAttribute("countryList", list);
    }

    @GetMapping("sub11")
    public void method(@RequestParam("country") List<String> countryList ) throws SQLException {
        String questionMark = "";
        for (int i = 0; i < countryList.size(); i++){
            questionMark += "?";
            // 마지막엔 , 가 붙으면 안되서 -1
            if(i < countryList.size() -1){
                questionMark += ",";
            }
        }
        String sql = """
                SELECT * FROM suppliers
                WHERE Country IN ("""
                +
                questionMark
                +

                ")";
        System.out.println(sql);
        Connection connection = dataSource.getConnection();
        PreparedStatement statement = connection.prepareStatement(sql);

        for (int i = 0; i < countryList.size(); i++){
            // i가 0 부터 시작하므로 +1를 붙인다, ? 는 1부터 시작한다
            // 0번 인덱스를 첫번째 ? 에 붙인다
            statement.setString(i+1, countryList.get(i));
        }

        ResultSet resultSet = statement.executeQuery();
        List<MyDto00> list = new ArrayList<>();
        try(connection; statement; resultSet;){
            while (resultSet.next()){
                MyDto00 dto = new MyDto00();
                dto.setName(resultSet.getString(1));
                dto.setCountry(resultSet.getString(2));

                list.add(dto);
            }
        }

    }


}
