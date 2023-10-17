package com.example.spring2023;

import lombok.RequiredArgsConstructor;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Component;

@SpringBootApplication
public class MyApp9 {
    public static void main(String[] args) {
        ApplicationContext context = SpringApplication.run(MyApp9.class, args);
        MyClass16 myClass16 = context.getBean("myClass16", MyClass16.class);
        MyClass15 myClass15 = context.getBean("myClass15", MyClass15.class);

        System.out.println("myClass16 = " + myClass16);
        System.out.println("myClass15 = " + myClass15.getField());
    }
}

@Component
class MyClass16{

}

@Component
@RequiredArgsConstructor // final 필드에 args로 받는 생성자를 만들어준다
class MyClass15{
    // final 는 무조건 값을 한번 받아야한다,
    private final MyClass16 field;

    public MyClass16 getField() {
        return field;
    }
}
