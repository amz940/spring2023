package com.example.spring2023;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.stereotype.Component;

@SpringBootApplication
public class MyApp3 {
    public static void main(String[] args) {
        ConfigurableApplicationContext context = SpringApplication.run(MyApp3.class, args);
        MyClass4 bean = context.getBean("mybean4", MyClass4.class);
        MyClass5 bean1 = context.getBean("myClass5", MyClass5.class);
        System.out.println("bean = " + bean);
        System.out.println("bean1 = " + bean1);

        Object bean2 = context.getBean("controller02");
        System.out.println("bean2 = " + bean2);

        Object bean3 = context.getBean("myApp3");
        System.out.println("bean3 = " + bean3);
    }
}
@Component
// spring bean의 이름을 명시하지 않으면 클래스이름 = lowerCamelCase(작성법)된다
class MyClass5{ // 이 클래스 이름은 myClass5

}
@Component("mybean4")
class MyClass4{

}
