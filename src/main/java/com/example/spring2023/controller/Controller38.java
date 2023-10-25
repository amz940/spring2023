package com.example.spring2023.controller;

import com.example.spring2023.dao.MyDao8;
import com.example.spring2023.domain.MyDto33Employee;
import com.example.spring2023.domain.MyDto45;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("main38")
@RequiredArgsConstructor
public class Controller38 {

    private final MyDao8 dao;

    @GetMapping("sub0")
    public void method0(){

    }



    /*
    axios.get("/main38/sub1")
     */
    @GetMapping("sub1") // sub1의 view로 보내서 처리했는데
    @ResponseBody // 이 코드를 사용해서 바로 처리
    public String method1(){

        return "/main38/sub1";
    }

    @GetMapping("sub2")
    @ResponseBody
    public String method2(){
        try {
            Thread.sleep(1000);
        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        }
        return "Hello world";
    }

    @GetMapping("sub3")
    @ResponseBody
    public Map<String, Object> method3(){
        return Map.of("name","son","age",30);
    }

    @GetMapping("sub4")
    @ResponseBody
    public Map<String, Object> method4(){
        // {"city" : "seoul", "price":3000,
        // "list": ["son","lee","kim"], "birth":"1999-03-03"}
        return Map.of("city","seoul",
                      "price",3000,
                    "list", List.of("son","lee","kim"),
                    "birth","1999-03-03");
    }

    /*
    axios.get("/main38/sub5?id=8")
     */
    @ResponseBody
    @GetMapping("sub5")
    public Map<String,Object> method5(Integer id){

        return dao.selectProductById(id);
    }

    /*
    axios.get("/main38/sub6?id=7")
     */
    @GetMapping("sub6")
    @ResponseBody
    public MyDto33Employee method6(Integer id){
        return dao.selectByEmplyeeId(id);
    }

    /*
    axios.get("/main38/sub7?id=33")
    33번 상품의 정보를 json으로 응답
    id(상품 id)
    price(상품 가격)
    category(카테고리명)
    unit(단위)
     */
    // 7번째 메소드와 MyDto45를 이용해서 만들어라 dao.selectByProductId로 만들면된다
    @GetMapping("sub7")
    @ResponseBody
    public MyDto45 method7(Integer id){
        return dao.selectByProductId(id);
    }


}
