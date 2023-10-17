package com.example.spring2023;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Component;

@SpringBootApplication
public class MyApp14 {
    public static void main(String[] args) {
        // 내가 만든 빈이 아닌 따른 곳에서 불러올때
        ApplicationContext context = SpringApplication.run(MyApp14.class, args);
        Object bean1 = context.getBean("myBean1");
        System.out.println("bean1 = " + bean1);

        Object bean2 = context.getBean("myBean2");
        System.out.println("bean2 = " + bean2);

        Configuration1 conf = context.getBean("configuration1", Configuration1.class);
        MyClass27 obj1 = conf.myBean1();
        MyClass27 obj2 = conf.myBean2();

        System.out.println("obj1 = " + obj1);
        System.out.println("obj2 = " + obj2);

        System.out.println(conf.myBean1()); // 서로 같은 값이 나온다 = 같은 객체다
        System.out.println(conf.myBean1());
        // bean은 재정의된 메소드를 불러오기 때문에 같은 객체가 나오는것
        // 이걸 싱글턴 패턴(Singleturn pattern)이라 한다
    }
}

// Configuration 클래스(빈)
// spring bean을 만드는 메소드를 가진 어노테이션
@Configuration
// component를 포함하기 때문에 spring bean으로 만들수 있다
class Configuration1{

    // 빈을 만드는 메소드
    // bean의 이름은 메소드명과 같다
    // bean이 붙은 어노테이션을 호출하면 항상 같은 객체를 불러온다(싱글턴패턴)
    @Bean
    public MyClass27 myBean1(){
        return new MyClass27();
    }

    @Bean
    public MyClass27 myBean2(){
        return new MyClass27();
    }
}

// @Component : 빈의 이름이 클래스 이름의 lowerCamelCase
class MyClass27{

}
