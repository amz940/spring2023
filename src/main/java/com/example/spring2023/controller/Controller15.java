package com.example.spring2023.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Arrays;
import java.util.List;

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

    @GetMapping("sub4")
    public void method4(){

    }
    @PostMapping("sub5")
    public void method5( String name, HttpSession session){
        session.setAttribute("username",name);
    }

    @GetMapping("sub6")
    public void method6(){

    }

    @GetMapping("sub7")
    public void method7(){

    }

    // post요청 온 sub8을 request parameter foods를
    // session에 attribute로 넣고
    // sub8.jsp로 포워드 하는 메소드

    // get 요청 main15/sub9
    // sub9로 포워드

    // 단 sub8와 sub9 에서 sub7에서 선택한 음식들을 보여주기
    @PostMapping("sub8")
    public void method8(String[] foods, /*List<String> foods*/ HttpSession session){
        System.out.println("Arrays.toString(foods) = " + Arrays.toString(foods));
//        List<>는 mappingparam 생략 불가능하다
//        @ModelAttridute로 간주 한다
//        List는 인터페이스랑 객체 생성이 불가능한데 Model에서 객체로 지정해버려서 익셉션 발생
//        List로 쓰고 싶다면 @RequestParam을 사용하자
//        System.out.println("foods = " + foods);
        session.setAttribute("food",foods);
    }

    @GetMapping("sub9")
    public void method9(){

    }

    @GetMapping("sub10")
    public void method10(Model model, HttpSession session){
        model.addAttribute("modelAttr1", "탕후루");
        session.setAttribute("sessionAttr1","마라탕");

        model.addAttribute("attr1", "탕후루");
        session.setAttribute("attr1","돈까스");
    }

    @GetMapping("sub11")
    public void method11(Model model, HttpSession session){
        model.addAttribute("items", List.of("두식","봉석"));
        session.setAttribute("items", List.of("피자","햄버거","돈까스"));
    }
//    sub11 에서 model 이랑 session 값 둘다 출력
}
