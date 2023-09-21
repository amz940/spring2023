package com.example.spring2023.domain;

public class Person {
    // name property (읽기, 쓰기)
    // age property (
    // address property
    // property란 매개변수로 주로 private가 선언된 멤버들을 뜻한다
    // getter, setter를 가지고 있는 변수
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
        return "Person{" +
                "name='" + name + '\'' +
                ", age=" + age +
                ", address='" + address + '\'' +
                '}';
    }
}
