package com.example.spring2023.controller;

import com.example.spring2023.dao.MyDao5;
import com.example.spring2023.domain.MyDto36;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.Map;

@Controller
@RequiredArgsConstructor
@RequestMapping("main31")
public class Controller31 {

    private final MyDao5 dao;

    @GetMapping("sub1")
    public void method1(){
        String country = dao.select1("mexico");
        System.out.println("country = " + country);

    }

    @GetMapping("sub2")
    public void method2(Integer num){
        dao.select2(num);
    }

    // /main31/sub3?code=1&k=ro
    // /main31/sub3?code=2&k=ro
    @GetMapping("sub3")
    public void method3(Integer code, String k, Model model){
        // code = 1이면
        /*
        Select customerName, contactName
        From customers
        Where customerName Like '%ro%'
         */

        // code = 2면
        /*
        Select customerName, contactName
        From customers
        Where contactName Like '%ro%'
         */
       List<Map<String, Object>> rows = dao.select3(code, "%" +k+ "%");

       model.addAttribute("names", rows);
    }

    @GetMapping("sub4")
    public void method4(){
        dao.select4(30);
    }

    @GetMapping("sub5")
    public void method5(MyDto36 dto, Model model){
        model.addAttribute("cityList", dao.listCustomerCity());
        model.addAttribute("countryList", dao.listCustomerCountry());
        model.addAttribute("customerList" ,dao.listCustomer(dto));

    }
}
