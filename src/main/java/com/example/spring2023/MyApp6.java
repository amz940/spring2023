package com.example.spring2023;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Component;

@SpringBootApplication
public class MyApp6 {
    public static void main(String[] args) {
        // Inversion Of Control (IOC)
        // 스프링이 제어를 가져간 상태를 뜻한다
        // 제어가 역전된 상황
        // IOC Container = 스프링 이라고 한다
        ApplicationContext context = SpringApplication.run(MyApp6.class, args);

        MyClass9 myClass9 = context.getBean("myClass9", MyClass9.class);
        myClass9.method9(); // Null = 값을 아직 안 넣어줌

        System.out.println("myClass9.getField1() = " + myClass9.getField1());

        Object myClass10 = context.getBean("myClass10");
        System.out.println("myClass10 = " + myClass10);
    }
}


@Component
class MyClass10 { // myClass10
    public void method10(){
        System.out.println("MyClass10.method10");
    }
}

@Component
class MyClass9  { // myClass9
    private  MyClass10 field1; // dependency (의존성)

    public MyClass9() {
    }

    public MyClass9(MyClass10 field1) {
        this.field1 = field1;
    }

    @Autowired // 자동으로 값을 넣어달라는 어노테이션
    // dependency injection (DI) : 의존성 주입
    public void setField1(MyClass10 field1) {
        this.field1 = field1;
    }

    public MyClass10 getField1() {
        return field1;
    }

    public void method9(){
        field1.method10();
    }

}