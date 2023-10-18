package com.example.spring2023.controller;

import com.example.spring2023.dao.MyDao3;
import com.example.spring2023.domain.*;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

@Controller
@RequiredArgsConstructor // final을 쓸꺼라는 의미
@RequestMapping("main29")
public class Controller29 {

    private final MyDao3 dao3;

    @GetMapping("sub1")
    public void methdo1(){
        String name = dao3.select1();
        System.out.println("name = " + name);
    }

    @GetMapping("sub2")
    public void method2(){
        Double price = dao3.select2();

        System.out.println("price = " + price);
    }

    @GetMapping("sub3")
    public void method3(){
        // 1번 직원의 LastName 조회 후 출력
        String name = dao3.select3();

        System.out.println("name = " + name);
    }

    @GetMapping("sub4")
    public void method4(){
        // 2번 직원의 생일 조회 후 출력
        LocalDate birthdate = dao3.select4();

        System.out.println("birthdate = " + birthdate);
    }

    @GetMapping("sub5")
    public void method5(){
        List<String> country = dao3.select5();

        country.forEach(System.out::println);
    }

    @GetMapping("sub6")
    public void method6(){
        // 직원들의 생일 조회
        List<LocalDate> birth = dao3.select6();

        birth.forEach(System.out::println);
        System.out.println("birth = " + birth.size());
    }

    @GetMapping("sub7")
    public void method7(){
        // 상품 가격들 조회
        List<Double> price = dao3.select7();

        price.forEach(System.out::println);
        System.out.println("price = " + price.size());
    }

    @GetMapping("sub8")
    public void method8(){
        Map<String, Object> customer = dao3.select8();
        System.out.println("customer = " + customer);
    }

    @GetMapping("sub9")
    public void method9(){
        // 1번 상품의 상품명, 가격, 카테고리명
        // join을 사용할것
        Map<String, Object> product = dao3.select9();
        // entrySet : 맵에 저장되어 있는 엔트리를 불러온다
        product.entrySet().forEach(System.out::println);

        System.out.println("product = " + product);
    }

    @GetMapping("sub10")
    public void method10(){
        MyDto19 dto = dao3.select10();
        System.out.println("dto = " + dto);
    }

    @GetMapping("sub11")
    public void method11(){
        MyDto20 dto = dao3.select11();
        System.out.println("dto = " + dto);
    }

    @GetMapping("sub12")
    public void method12(){
        MyDto21 dto = dao3.select12();
        // 2번 고객의 id, name, country
        // MyDto21의 property 명은 위 3개
        System.out.println("dto = " + dto);
    }

    @GetMapping("sub13")
    public void method13(){
       List<Map<String,Object>> rows = dao3.select13();
       for (Map<String, Object> row : rows){
           System.out.println("row = " + row);
       }
    }

    @GetMapping("sub14")
    public void method14(){
        // 1996년 7월 4일에 주문된 상품명, 상품의 수량, 상품의 가격
        List<Map<String, Object>> date = dao3.select14();
//        Map<String, Object> date = dao3.select14();
        // list는 배열을 정렬 해주기 때문에 사용, 정렬이 안되면 for문 사용 불가
//        for (Map<String, Object> row : date){
//            System.out.println("row = " + row);
//        }
        date.forEach(System.out::println);
    }

    @GetMapping("sub15")
    public void method15(){
        List<MyDto22> date = dao3.select15();

        date.forEach(System.out::println);
    }

    @GetMapping("sub16")
    public void method16(){
        // 1번 카테고리 상품들이 주문된 날짜, 상품명, 카테고리명, 수량, 가격
        List<MyDto23> list = dao3.select16();

        for (MyDto23 row : list){
            System.out.println("row = " + row);
        }

//        list.forEach(System.out::println);
        System.out.println("list = " + list.size());
    }

    @GetMapping("sub17")
    public void method17(){
        String s = dao3.select17();
        System.out.println("s = " + s);
    }

    @GetMapping("sub18")
    public void method18(){
        Integer s = dao3.select18();
        System.out.println("s = " + s);
    }

    @GetMapping("sub19")
    public void method19(){
        MyDto24 dto = dao3.select19();
        System.out.println("dto = " + dto);
    }

    @GetMapping("sub20")
    public void method20(){
        MyDto24 myDto24 = dao3.select20();
        System.out.println("myDto24 = " + myDto24);
    }
}
