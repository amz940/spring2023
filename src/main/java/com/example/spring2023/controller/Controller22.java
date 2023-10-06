package com.example.spring2023.controller;

import com.example.spring2023.domain.MyDto17;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.sql.DataSource;
import java.sql.*;
import java.util.*;

@Controller
@RequestMapping("main22")
public class Controller22 {
    @Autowired
    private DataSource dataSource;

    @GetMapping("sub1")
    public void method1(Integer page) throws SQLException {
        String sql = """
                SELECT CustomerID id,
                        CustomerName name
                FROM customers
                ORDER BY id
                LIMIT ?, ?
                """;
        Connection connection = dataSource.getConnection();
        PreparedStatement statement = connection.prepareStatement(sql);
//        statement.setInt(1,0); // 1페이지
//        statement.setInt(2,10);// 2페이지
        // 페이지 순으로 목록 넘기기
        statement.setInt(1,(page - 1) * 10);
        statement.setInt(2,10);

        ResultSet resultSet = statement.executeQuery();

        try(connection; statement; resultSet){
            System.out.println("고객 목록");
            while (resultSet.next()){
                String id = resultSet.getString("id");
                String name = resultSet.getString("name");

                System.out.println(id + ": " + name);
            }
        }
    }

    // 페이지당 7개 씩 공급자 목록 조회
    // /main22/sub2?p=2

    @GetMapping("sub2")
    public void method2(@RequestParam(value = "page", defaultValue = "1")
                            Integer page, Model model) throws SQLException {
        String sql = """
                SELECT SupplierID id, SupplierName name, Phone
                FROM suppliers
                ORDER BY id
                LIMIT ?, ?
                """;
        Connection connection = dataSource.getConnection();
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setInt(1, (page - 1) * 7);
        statement.setInt(2, 7);

        ResultSet resultSet = statement.executeQuery();
        // console 값으로 출력
//        try( connection; statement; resultSet){
//            System.out.println(page + "페이지 공급자 7명씩");
//            while (resultSet.next()){
//                String id = resultSet.getString("id");
//                String name = resultSet.getString("name");
//                String phone = resultSet.getString("phone");
//
//                System.out.println(name + ":" + id + ", " + phone);
//            }
//        }
        // view에서 출력
        // list 타입
        List<MyDto17> list = new ArrayList<>();
        try (connection; statement; resultSet) {
            while (resultSet.next()) {
                MyDto17 dto = new MyDto17();
                dto.setId(resultSet.getString("id"));
                dto.setName(resultSet.getString("name"));
                dto.setPhone(resultSet.getString("phone"));

                list.add(dto);
            }
        }
        // map 타입
//        List<Map<String, Object>> list = new ArrayList<>();
//        try( connection; statement; resultSet){
//            while (resultSet.next()){
//                String id = resultSet.getString("id");
//                String name = resultSet.getString("name");
//                String phone = resultSet.getString("phone");
//
//                list.add(Map.of("id",id,"name",name,"phone",phone));
//            }
//        }
//        model.addAttribute("supplier", list);


        String sql1 = """
                SELECT COUNT(SupplierID)
                FROM suppliers
                ORDER BY SupplierID
                """;
        Connection connection1 = dataSource.getConnection();
        Statement statement1 = connection1.createStatement();
        ResultSet resultSet1 = statement1.executeQuery(sql1);

        try (connection1; statement1; resultSet1) {
            if (resultSet1.next()) {
                int countAll = resultSet1.getInt(1);
                // 마지막 페이지 번호
                int lastPageNumber = ((countAll - 1) / 7) + 1;

                model.addAttribute("lastPageNumber", lastPageNumber);

            }
        }


        model.addAttribute("supplier", list);


    }

        // /main22/sub3?page=2
        // 2페이지 고객목록을 jsp에 테이블 형식(id, name) 출력
        // table 형식
        // 1페이지 5개씩

    @GetMapping("sub3")
    public void method3(@RequestParam(value = "page", defaultValue = "1") Integer page, Model model) throws Exception {
        String sql = """
                SELECT CustomerID id, CustomerName name FROM customers
                ORDER BY CustomerID
                LIMIT ?, ?
                """;
        Connection connection = dataSource.getConnection();
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setInt(1,(page -1) * 5);
        statement.setInt(2,5);

        ResultSet resultSet = statement.executeQuery();
        List<Map<String,Object>> list = new ArrayList<>();
        try( connection; statement; resultSet){
            while (resultSet.next()){
                String id = resultSet.getString("id");
                String name = resultSet.getString("name");

                list.add(Map.of("id",id,"name",name));
            }
        }

        String sql1 = """
                   SELECT COUNT(CustomerID)
                   FROM customers
                   """;
        Connection connection1 = dataSource.getConnection();
        Statement statement1 = connection1.createStatement();
        ResultSet resultSet1 = statement1.executeQuery(sql1);

        int lastPageNumber = 1;
        try(connection1;statement1;resultSet1){
            if(resultSet1.next()){
                int countAll = resultSet1.getInt(1);

                lastPageNumber = ((countAll-1) / 5) + 1;

                model.addAttribute("lastPageNumber", lastPageNumber);
            }

        }


        model.addAttribute("customerList", list);

        model.addAttribute("currentPage",page);

        int leftPageNumber = (page -1) / 5 * 5 + 1;
        int rightPageNumber = leftPageNumber + 4 ;

        // 이전 버튼 눌렀을때 넘어가는 코드
        int prevPageNumber = leftPageNumber - 5;
        int nextPageNumber = rightPageNumber + 1;


        rightPageNumber = Math.min(rightPageNumber, lastPageNumber);

        model.addAttribute("prevPageNumber", prevPageNumber);
        model.addAttribute("nextPageNumber", nextPageNumber);
        model.addAttribute("leftPageNumber", leftPageNumber);
        model.addAttribute("rightPageNumber", rightPageNumber);
    }



}
