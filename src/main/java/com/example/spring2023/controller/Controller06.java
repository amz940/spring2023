package com.example.spring2023.controller;


import com.example.spring2023.domain.MyDTO3;
import com.example.spring2023.domain.MyDTO4;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("main6")
public class Controller06 {
    // /main6/sub1?
    @RequestMapping("sub1")
    public void method1(MyDTO3 obj){
        System.out.println("obj = " + obj);
    }
    // /main6/sub2?signed=true&email=ab@gmail.com&gender=male
    @RequestMapping("sub2")
    public void method2(MyDTO4 obj){
        System.out.println("obj = " + obj);
    }
}
