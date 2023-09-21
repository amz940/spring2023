package com.example.spring2023.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("main5")
public class Controller05 {
    // /main5/sub1?name=lee&age=33&address=paris
    // 해당 파라미터가 들어가야지만 실행 되게끔 제한
    // 여러 제한을 두고 싶으면 {  } 로 묶으면 된다
    @RequestMapping(value = "sub1", params = {"name","age"})
            // consumes : 요청정보의 contents-type의 헤더가 특정값일 때만 작동
//                    ,consumes = "application/json")
    public void method1(String name, Integer age, String address){
        System.out.println("name = " + name);
        System.out.println("age = " + age);
        System.out.println("address = " + address);
//
//        service.method(name, age, address);
    }

    // main5/sub2?name&age&address
    @RequestMapping("sub2")
    public void method2(String name, Integer age, String address){
        Person5 o1 = new Person5();
        o1.setName(name);
        o1.setAge(age);
        o1.setAddress(address);

        System.out.println(o1);
    }
    // /main5/sub3?name=lee&age=33&address=paris
    @RequestMapping("sub3")
    public void method3(Person5 person5){
        System.out.println("person5 = " + person5);
    }

    // /main5/sub4?email=ab@gmail.com&married=true&age=33&info=programmer
    // method4(Student s) 작성
    // 필드명은 중요하지 않고 메소드명이 http랑 일치 해야한다
    @RequestMapping("sub4")
    public void method4(Student s){
        System.out.println("s = " + s);
    }
}
class Student{
    private String email;
    private Boolean married;
    private Integer age;
    private String info;

    public void setEmail(String email) {
        this.email = email;
    }

    public void setMarried(Boolean married) {
        this.married = married;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public void setInformation(String info) {
        this.info = info;
    }

    @Override
    public String toString() {
        return "Student{" +
                "email='" + email + '\'' +
                ", married=" + married +
                ", age=" + age +
                ", info='" + info + '\'' +
                '}';
    }
}

// 생성자 없어도 상관없다
class Person5{
    private String name;
    private Integer age;
    private String address;



    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Override
    public String toString() {
        return "Person5{" +
                "name='" + name + '\'' +
                ", age=" + age +
                ", address='" + address + '\'' +
                '}';
    }
}