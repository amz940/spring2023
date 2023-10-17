package com.example.spring2023;

public class MyApp1 {
    public static void main(String[] args) {
        System.out.println("code write");

        MyClass1 class1 = new MyClass1();
        // 클래스 객체를 직접 만듬
        class1.method1();
    }
}

class MyClass1 {
    public void method1(){
        System.out.println("MyClass1.method1");
    }
}
