package com.example.spring2023.controller;

import com.example.spring2023.dao.MyDao4;
import com.example.spring2023.domain.*;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.time.LocalDate;
import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("main30")
public class Controller30 {

    private final MyDao4 dao;

    @GetMapping("sub1")
    public void method1(Integer id){
        String name = dao.select1(id);
        System.out.println("name = " + name);
    }

    @GetMapping("sub2")
    public void method2(Double from, Double to){
        List<String> names = dao.select2(from, to);
        names.forEach(System.out::println);
    }

    @GetMapping("sub3")
    public void method3(LocalDate from, LocalDate to){
        // 96-08-01 ~ 96-08-30
        List<String> list = dao.select3(from, to);
        list.forEach(System.out::println);

        System.out.println("list = " + list.size());

        // from ~ to에 주문된 상품명 출력(정렬, 중복 제거)
    }

    // /main30/sub4?min=1.00&max=80.00
    @GetMapping("sub4")
    public void method4(MyDto25 dto){
        // 파라미터 안 쓸꺼면 밑에 코드 작성
        // 단 url에 값을 넣어줘야 한다
//        MyDto25 dto = new MyDto25();
//        dto.setMin(70.50);
//        dto.setMax(83.50);

        List<String> list = dao.select4(dto);
        System.out.println("list = " + list);

    }
    // /main30/sub5?country1=germany&country2=france
    @GetMapping("sub5")
    public void method5(MyDto26 dto){
        // country1 또는 country2에 사는 고객명 출력
        List<String> list = dao.select5(dto);
        list.forEach(System.out::println);
    }

    // /main30/sub6?from=1996-09-01&to=1996-09-30
    @GetMapping("sub6")
    public void method6(MyDto27 dto1, MyDto28 dto2){
        Integer s = dao.select6(dto1, dto2);
        System.out.println("s = " + s);
    }

    // /main30/sub7?page=2&rows=10&keyword=a 일때
    @GetMapping("sub7")
    public void method7(MyDto29 dto1, MyDto30 dto2){
        /*
        Select customerName
        From customers
        Where customerName Like '%a%'
        Limit 10, 10
         */
//        dto1.setFrom((dto1.getPage() - 1) * dto1.getRows());
//        dto2.setKeyword("%" + dto2.getKeyword() + "%");

        List<String> names = dao.select7(dto1, dto2);

        System.out.println("names = " + names.size());
        names.forEach(System.out::println);
    }

    // insert를 사용하는 방법
    // /main30/sub8?name=son&country=korea
    @GetMapping("sub8")
    public void method8(MyDto31 dto){

        Integer row = dao.insert1(dto);

        System.out.println("row = " + row + "행이 입력되었습니다");
    }

    @GetMapping("sub9")
    public void method9(){

    }
    @PostMapping("sub10")
    public void method10(MyDto32 emp){
      int row = dao.insert2(emp);
        System.out.println("row = " + row);
    }
}
