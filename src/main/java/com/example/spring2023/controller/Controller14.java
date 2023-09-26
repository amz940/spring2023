package com.example.spring2023.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("main14")
public class Controller14 {
    @GetMapping({"sub1","sub3"})
    public void method1(){

    }

//    @RequestMapping(value = "sub2", method = RequestMethod.GET)
//    짧게 한 코드로 줄일 수 있다
    @GetMapping("sub2")
    public void method2(
            String id,
            String password
    ){
        System.out.println("Controller14.method2");

        System.out.println("id = " + id);
        System.out.println("password = " + password);
    }

//    @RequestMapping(value = "sub2", method = RequestMethod.POST)
    @PostMapping("sub2")
    public void method3(
            @RequestParam("id") String id,
            @RequestParam("password") String password
    ){
        System.out.println("Controller14.method3");

        System.out.println("id = " + id);
        System.out.println("password = " + password);
    }

    @RequestMapping(value = "sub4", method = RequestMethod.POST)
    public void method4(
            String title,
            String content
    ){
        System.out.println("title = " + title);
        System.out.println("content = " + content);
    }

//    아래 두 RequestMapping 어노테이션을 줄여서 작성
//    sub5.jsp에 적절한 form 요소 코드 작성해서 작성
//    전송(submit)시 method6이 실행 될 수 있도록
//    @RequestMapping(value = "sub5", method = RequestMethod.GET)
    @GetMapping("sub5")
    public void method5(){

    }
//    @RequestMapping(value = "sub6", method = RequestMethod.POST)
    @PostMapping("sub6")
    public void method6(
            String username,
            String password
    ){
        System.out.println("username = " + username);
        System.out.println("password = " + password);
    }
}

