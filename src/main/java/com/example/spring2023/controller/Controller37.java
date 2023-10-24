package com.example.spring2023.controller;

import com.example.spring2023.dao.MyDao7;
import com.example.spring2023.domain.MyDto41;
import com.example.spring2023.domain.MyDto42;
import com.example.spring2023.domain.MyDto43;
import com.example.spring2023.domain.MyDto44;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Map;

@Controller
@RequestMapping("main37")
@RequiredArgsConstructor
public class Controller37 {

    private final MyDao7 dao;

    /*
    json은 문자열이라 중괄호 대신 따옴표쓰인다
    내부에서 큰따옴표를 쓰기 때문에 외부엔 작은따옴표
    axios.post("/main37/sub1", '{"name":"jones"}',{
    headers: {
        // json 형식이라는걸 알려주기 위해 쓰인 코드
        "content-type" : "application/json"
    })

    axios.post("/main37/sub1", {name: "jones"}) 위에 코드랑 같은 코드, json 표시
     */
    @PostMapping("sub1")
    public void method1(@RequestBody Map<String, Object> map){
        System.out.println("map = " + map);
    }

    /*
    axios.post("/main37/sub2", {name : "lee", age:33, score: 8.9})
    {name : "lee", age:33, score: 8.9}
        -> '{"name" : "lee", "age":33, "score": 8.9}' : 직렬화 ( json 방식으로 바꾸는것)
    '{"name" : "lee", "age":33, "score": 8.9}'
        -> {name : "lee", age:33, score: 8.9} : 파싱 ( js(java) 언어로 바꾸는 것)
     */
    @PostMapping("sub2")
    public void method2(@RequestBody Map<String, Object> map){
        System.out.println("map = " + map);
    }

    /*
    axios.put("/main37/sub3",{
        city: "seoul",
        name: "son",
        email: "abc@com"
        })
     */
    @PutMapping("sub3")
    public void method3(@RequestBody Map<String, Object> map){
        System.out.println("map = " + map);
    }

    /*
    axios.post("/main37/sub4",{
        city: "paris",
        age: 30,
        married : true,
        car : null,  // null은 소문자만 허용
        home : {
            address : 100,
            city : "souel"
            },
        foods : [
            "pizza",
            "burger",
            "부침개"
            ]
        })
     */
    @PostMapping("sub4")
    public void method4(@RequestBody MyDto42 dto){
        System.out.println("dto = " + dto);
    }

    // js로 ajax 요청 하는 코드 실행
    /*
    axios.post("/main37/sub5", {
        country : "한국",
        score : 88.53,
        skills : [
            "야구",
            "농구",
            "축구"
            ],
        phone : "010-0000-0000"
        })

     */
    @PostMapping("sub5")
    public void method5(@RequestBody MyDto43 dto){
        System.out.println("dto.getCountry() = " + dto.getCountry()); // String
        System.out.println("dto.getScore() = " + dto.getScore()); // Double
        System.out.println("dto.getSkills() = " + dto.getSkills()); // List<String>
        System.out.println("dto.getPhone() = " + dto.getPhone()); // String
    }

    /*
    axios.post("/main37/sub6", {
        name : "son",
        email : ["son@gmail.com", "hm@gmail.com"],
        home : {
            first : "seoul",
            second: "london"
            },
        price : 35.11,
        weight : 77.6,
        married : true
        })
     */
    @PostMapping("sub6")
    public void method6(@RequestBody MyDto44 dto){
        System.out.println("dto.getName() = " + dto.getName());
        System.out.println("dto.getEmail() = " + dto.getEmail());
        System.out.println("dto.getHome = " + dto.getHome());
        System.out.println("dto.getPrice() = " + dto.getPrice());
        System.out.println("dto.getWeight() = " + dto.getWeight());
        System.out.println("dto.getMarried() = " + dto.getMarried());
    }

    /*
    axios.put("/main37/sub7", {
        id: 3,
        lastName: "kim",
        firstName: "minjae",
        birthDate: "1999-09-09"
        })
     */
    @PutMapping("sub7")
    public void method7(@RequestBody MyDto41 dto){
        int i = dao.updateEmployee(dto);
        System.out.println(dto.getId() + "번 직원 수정됨");
    }


}
