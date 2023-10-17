package com.example.spring2023;

import jakarta.annotation.PostConstruct;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.stereotype.Component;

@SpringBootApplication
public class MyApp13 {
    public static void main(String[] args) {
        // 스프링이 가질 수 있는 특별한 메소드들
        ApplicationContext context = SpringApplication.run(MyApp13.class, args);
    }
}

@Component
class MyClass26{

    @PostConstruct // DI 완료 후 바로 실행
    public void method1(){
        System.out.println("MyClass26.method1");
    }
}