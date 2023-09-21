package com.example.spring2023.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("main8")
public class Controller08 {

    @RequestMapping("sub1")
    public void method1(Model model){
        model.addAttribute("attr1","value");
        model.addAttribute("attr2","value2");
        // forward to /WEB-INF/main8/sub1.jsp

    }

    @RequestMapping("sub2")
    public void method(Model model){
        model.addAttribute("propOne","🤣");
        model.addAttribute("propTWO","👌");
        System.out.println("Controller08.method");
    }



}
