package com.example.spring2023.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Controller01 {
    @RequestMapping("/") // "/"로 요청이 왔을때 메소드를 실행하겠다
    public void method1(){
        System.out.println("Controller01.method1");
    }

    @RequestMapping("/path1")
    public void method2(){
        System.out.println("Controller01.method2");
    }

    // /paht2로 요청 왔을 때 일하는 메소드 작성
    // 메소드 명과 경로는 상관이 없다
    // 만약 본인 컴터에서 요청을 보낸다고 하면 주소 대신
    // localhost를 치면 된다
    @RequestMapping("/path2")
    public void method3(){
        System.out.println("Controller01.method3");
    }


}
