package com.example.spring2023.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("main4")
public class Controller04 {
    // main4/sub1?name=son
    // request parameter의 이름과 method parameter의 이름이 같으면
    // @RequestParam의 value element 생략 가능 하다
    // 단 디폴트 값이나 require를 넣고 싶을땐 value element 생략 불가능
    @RequestMapping("sub1")
//   (@RequestParam("name") String name)
    public void method1(@RequestParam String name){
        System.out.println("name = " + name);
    }

    // /main4/sub2?address=seoul&email=abc@gmail.com&age=44
    @RequestMapping("sub2")
    public void method2(@RequestParam String address,
                        @RequestParam String email,
                        @RequestParam String age){
        System.out.println("address = " + address);
        System.out.println("email = " + email);
        System.out.println("age = " + age);
    }

    // @RequestParam 도 생략이 가능하다 , 자동 형변환 해준다
    // @RequestParam이 사라졌기 때문에 메소드인 require이 사라졌고
    // require의 불린이 없어졌기 때문에 제한이 없어졌다
    // 그 결과 아무값이나 줘도 상관없다. 참조타입일시 null로 받아주기 때문
    @RequestMapping("sub3")
    public void method3(String name, Boolean married){
        System.out.println("name = " + name);
        System.out.println("married = " + married);
    }

    // /main4/sub4?check=true&email=abc@naver.com&age=55
    @RequestMapping("sub4")
    public void method4(Boolean check, String email, Integer age){
        System.out.println("check = " + check);
        System.out.println("email = " + email);
        System.out.println("age = " + age);
        System.out.printf("check = %s, email = %s , age = %s",check,email,age);
    }
}
