package com.example.spring2023.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("main1") // 중복 된 주소는 몰아서 작성 할 수 있다
public class Controller02 {
    @RequestMapping("sub1")
    public void method1(){
        System.out.println("Controller02.method1");
    }

    // /main1/sub2 메소드 작성
    @RequestMapping("sub2")
    public void method2(){
        System.out.println("Controller02.method2");
    }

    // /main1/sub3 메소드 작성
    @RequestMapping("sub3")
    public void method3(){
        System.out.println("Controller02.method3");
    }



}
