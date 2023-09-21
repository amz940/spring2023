package com.example.spring2023.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.WebRequest;

@Controller
@RequestMapping("main2")
public class Controller03 {
    // /main2/sub1?address=seoul
    @RequestMapping("sub1")
    public void method1(WebRequest request) {
        System.out.println("Controller03.method1");

        String address = request.getParameter("address");
        System.out.println("address = " + address);
    }

    @RequestMapping("sub2")
    public void method2(WebRequest request) {
        String name = request.getParameter("name");
        String address = request.getParameter("address");

        System.out.println("name = " + name);
        System.out.println("address = " + address);
    }

    // /main2/sub3?name=손흥민
    @RequestMapping("sub3")
    // WebRequest 후 꺼내는 작업을 한 코드로 줄일 수 있다
    // @ReaquestParam 는 무조건 값을 넣어줘야 한다
    // ReaquestParam는 boolean 타입이라 true가 되어야지만 실행할수 있기 때문
    // 파라미터에 참조타입 말고 기본타입도 가능하다
    // 참조타입엔 값이 없을 시 null 값을 주지만 기본타입은 안되서 참조타입 습관
    public void method3(@RequestParam("name") String name){
//        String name = request.getParameter("name");

        System.out.println("name = " + name);
    }

    @RequestMapping("sub4")
    public void method4(@RequestParam("name") String name,
                        @RequestParam("address") String address){
        System.out.println("name = " + name);
        System.out.println("address = " + address);
    }

    // main2/sub5?email=abc@gmail.com&gender=남자&number=010-9999
    @RequestMapping("sub5")
    public void method5(@RequestParam("email") String email,
                        @RequestParam("gender") String gender,
                        @RequestParam("number") String number){
        System.out.println("email = " + email);
        System.out.println("gender = " + gender);
        System.out.println("number = " + number);
    }
    // String이 아닌 다른 값으로 받고 싶을때
    @RequestMapping("sub6")
    public void method6(@RequestParam("name") String name,
                        @RequestParam("age") String age) {
        System.out.println("name = " + name);
        System.out.println("age = " + age);

        Integer a = Integer.valueOf(age);
    }

    //  /main2/sub7?name=손&age=40
    // String이 아닌 다른 값으로 받고 싶을때
    @RequestMapping("sub7")
    public void method7(@RequestParam("name") String name,
                        @RequestParam("age") Integer age){
        System.out.println("name = " + name);
        System.out.println("age = " + age);
    }

    // /main2/sub8?address=seoul&married=false&age=66
    // married = boolean 타입
    // age = int 타입으로 받을껏
    @RequestMapping("sub8")
    public void method8(@RequestParam("name") String name,
                        @RequestParam("married") Boolean married,
                        @RequestParam("age") Integer age){
        System.out.println("name = " + name);
        System.out.println("married = " + married);
        System.out.println("age = " + age);

    }

    @RequestMapping("sub9")
    // required를 사용해 true가 아니여도 실행 할 수 있게끔 바꿔줄수 있다 기본값은 true
    public void method9(@RequestParam(value = "name", required = false) String name){
        System.out.println("name = " + name);
    }

    // /main2/sub10?address=seoul&age=30
    // age가 없어도 실행되게 하겠다
    @RequestMapping("sub10")
    public void method10(@RequestParam("address") String address,
                         @RequestParam(value = "age", required = false) Integer age){
        System.out.println("address = " + address);
        System.out.println("age = " + age);

    }

    // 값을 따로 지정안해주면 디폴트 값이 나오게끔 설정
    @RequestMapping("sub11")
    public void method11(@RequestParam(value = "age", defaultValue = "0") Integer age){
        System.out.println("age = " + age);
    }


}




