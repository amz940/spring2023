package com.example.spring2023.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("main15")
public class Controller15 {

    @GetMapping("sub1")
    public void method1(){

    }

    @GetMapping("sub2")
//    HttpServletRequest request : 누가 보낸건지 알고 싶을때 사용하는 코드
//    부여한 session 코드가 무엇이지
//    세션에 저장하는 코드는 세션 attribute 이다, model 값이랑 똑같다
    public void method2(HttpServletRequest request, HttpSession session){
        System.out.println();
        System.out.println("request.getRemoteHost() = " + request.getRemoteHost());
        System.out.println("session.getId() = " + session.getId());
        System.out.println();
    }

    @GetMapping("sub3")
    public void method3(
            @RequestParam(value = "name", defaultValue = "") String name,
            HttpSession session,
            HttpServletRequest request){
        if(!name.isBlank()){
            session.setAttribute("username", name);
        }
        Object username = session.getAttribute("username");

        if(username != null){
            System.out.println();
            System.out.println("request.getRemoteHost() = " + request.getRemoteHost());
            System.out.println("username = " + username);
            System.out.println();
        }
    }

}
