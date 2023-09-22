package com.example.spring2023.controller;

import com.example.spring2023.domain.MyDTO9;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.Map;

@Controller
public class Controller10 {
    @RequestMapping("sub1")
    public void method1(Model model) {
        MyDTO9 o1 = new MyDTO9();
        MyDTO9 o2 = new MyDTO9();

        o1.setFirstName("son");
        o2.setFirstName("lee");

        model.addAttribute("students", List.of(o1, o2));
        model.addAttribute("studentList", List.of(o1, o2, o1));
    }

    @RequestMapping("sub2")
    public void method2(Model model) {
        MyDTO9 o1 = new MyDTO9();
        MyDTO9 o2 = new MyDTO9();

        o1.setLastName("두식");
        o2.setLastName("봉석");

        model.addAttribute("personMap",
                Map.of("person1", o1, "person2", o2));

        model.addAttribute("people",
                Map.of("1st", o1, "2nd", o2));
    }
}
