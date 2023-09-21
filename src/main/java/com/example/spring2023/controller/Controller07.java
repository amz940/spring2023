package com.example.spring2023.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("main7")
public class Controller07 {

    // (RequestMapping) Handler Method
    @RequestMapping("sub1")
    public String method1(){
        System.out.println("Controller07.method1");

        return "view1";
    }

    @RequestMapping("sub2")
    public String method2(){
            System.out.println("Controller07.method2");

            // WEB-INF/jsp/html2.jsp 로 보내달라
            return "html2";
    }
    // void로 값을 받을 시 요청경로가 view name이 된다
    // 요청 경로 : /main7/sub3

    // view name : /main7/sub3
    // 실제 jsp 경로 : /WEB-INF/jsp/main7/sub3.jsp가 주소가 된다

    // 요청 경로 = view name 일때 return 대신 void를 쓴다
    // html 경로는 return 이랑 void 일때랑 똑같다
    @RequestMapping("sub3")
    public void method3(){
        System.out.println("Controller07.method3");
    }

    @RequestMapping("sub4")
    public void method4(){
        System.out.println("Controller07.method4");
    }

    @RequestMapping("sub5")
    public void method5(){

    }
}
