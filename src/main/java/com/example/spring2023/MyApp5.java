package com.example.spring2023;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;

//@SpringBootApplication
public class MyApp5 {
    public static void main(String[] args) {
//        ApplicationContext context = SpringApplication.run(MyClass5.class);

        // 우리가 직접 제어 (control)한다면
        MyClass8 obj8 = new MyClass8();
        MyClass7 obj7 = new MyClass7();
        obj7.setField1(obj8);

        obj7.method7();
    }
}


class MyClass7{

    private MyClass8 field1;
    // 필드에 의존하는 상태 = dependency (의존성)

    public MyClass7(){
    }

    public MyClass7(MyClass8 field1) {
        this.field1 = field1;
    }

    public void setField1(MyClass8 field1) {
        this.field1 = field1;
    }

    public void method7(){
        field1.method8();
    }
}

class MyClass8{
    public void method8(){
        System.out.println("MyClass8.method8");
    }
}