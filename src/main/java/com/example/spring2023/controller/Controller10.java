package com.example.spring2023.controller;

import com.example.spring2023.domain.MyDTO9;
import com.example.spring2023.domain.MyDto10;
import org.eclipse.tags.shaded.org.apache.xpath.operations.Mod;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("main10")
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

    @RequestMapping("sub3")
    public void method3(Model model){
        MyDto10 o1 = new MyDto10();
        o1.setName("doosik");
        o1.setId(3);
        o1.setFoods(List.of("pizza","burger","milk"));
        o1.setCars(List.of("아반떼","sm6","소나타"));

        model.addAttribute("person1", o1);
        model.addAttribute("person2",o1);
        model.addAttribute("person3",o1);
    }

    @RequestMapping("sub4")
    public void method4(Model model){
        model.addAttribute("myList", List.of("tesla","kia","benz"));
    }

    @RequestMapping("sub5")
    public void method5(Model model){
        model.addAttribute("foodList", List.of("pizza","chichen","hamber","cola"));
        model.addAttribute("names",List.of("두식","봉석","희수","미현"));
    }

    @RequestMapping("sub6")
    public void method6(Model model){
        List<MyDTO9> list = new ArrayList<>();
        list.add(new MyDTO9(31L,"son","hm","football","010"));
        list.add(new MyDTO9(32L,"lee","ki","paris","010"));
        list.add(new MyDTO9(33L,"kim","hyuen","서울","02"));
        list.add(new MyDTO9(34L,"kim","두식","부산","033"));
        list.add(new MyDTO9(35L,"장","봉석","제주","05"));

        model.addAttribute("table",list);
    }

}
