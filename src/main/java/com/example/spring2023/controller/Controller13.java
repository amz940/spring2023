package com.example.spring2023.controller;

import com.example.spring2023.domain.MyDto11;
import com.example.spring2023.domain.MyDto12;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.List;

@Controller
@RequestMapping("main13")
public class Controller13 {
    // 배열로 묶어서 지정가능
    @RequestMapping({"sub1","sub2","sub4","sub7","sub9"})
    public void method1(){

    }

    @RequestMapping("sub3")
    public void method3(
//            value 타입은 뭐가 오든 상관없다
//            int 여도 프로그램이 자동형변환 해줘서 String으로 바꿔준다
//        jsp는 view의 기능이여서 화면에 보여지는 과정만 담당(front),
//        controller는 해당 view가 선택 됬을때 실제로 실행될 기능을 담당(back)
            @RequestParam("param1") String param1,
            @RequestParam(value = "param2",defaultValue = "0") Integer param2,
            @RequestParam("param3") String param3,
            // 날짜 타입은 LocalDate로 받는게 좋다
            // String으로 써도 자동 형변환 해주긴 한다
            @RequestParam(value = "param4", defaultValue = "2023-09-26") LocalDate param4,
            // 날짜와 시간을 정할 수 있다
            @RequestParam(value = "param5", defaultValue = "2023-09-26T11:15:30") LocalDateTime param5,
            @RequestParam(value = "param6", defaultValue = "value1") String param6,
            @RequestParam(value = "param8", required = false) String[] param8,
            @RequestParam(value = "param8") List<String> param9

            ){
        System.out.println("param1 = " + param1);
        System.out.println("param2 = " + param2);
        System.out.println("param3 = " + param3);
        System.out.println("param4 = " + param4);
        System.out.println("param5 = " + param5);
        System.out.println("param6 = " + param6);
//        System.out.println("param8 = " + param8);

        if( param8 != null){
            Arrays.stream(param8).forEach(System.out::println);
        }

        System.out.println("list로 받음");
        param9.forEach(System.out::println);
    }


    @RequestMapping("sub5")
    public void method5(
            @RequestParam("userId") String userId,
            String userEmail,
            @RequestParam("birthDate") String userBirth,
            @RequestParam("hobby") List<String> hobby

    ){
        System.out.println("userId = " + userId);
        System.out.println("userEmail = " + userEmail);
        System.out.println("userBirth = " + userBirth);
        System.out.println("hobby = " + hobby);
    }

    @RequestMapping("sub6")
    public void method6(MyDto11 o1){
        System.out.println("o1 = " + o1);
    }


    @RequestMapping("sub8")
    public void method7(MyDto12 info){
        System.out.println("info = " + info);
    }

    @RequestMapping("sub10")
    public void method10(
            @RequestParam("title") String title,
            @RequestParam("contentBody") String contentBody
    ){
        System.out.println("title = " + title);
        System.out.println("contentBody = " + contentBody);
    }

}
