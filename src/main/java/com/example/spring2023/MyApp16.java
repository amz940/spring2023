package com.example.spring2023;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@SpringBootApplication
public class MyApp16 {
    public static void main(String[] args) {
        ApplicationContext context = SpringApplication.run(MyApp16.class, args);
        MyClass31 bean1 = context.getBean("myClass31Bean", MyClass31.class);
        MyClass30 bean2 = context.getBean("myClass30Bean", MyClass30.class);

        System.out.println("bean2 = " + bean2.hashCode());

        System.out.println("bean1 = " + bean1.hashCode()); // 2

        System.out.println(bean2.getField().hashCode()); // 2

        // 2로 표시한 값은 같은 값이 나오도록
        // configuration spring bean, configuration3을 작성
        // MyClass30, MyClass31에 annotation 작성 하지 않고
        // 필요하면 생성자나 setter 작성 가능
    }
}

@Configuration
class Configuration3{

    @Bean
    public MyClass31 myClass31Bean(){
        return new MyClass31();
    }

    @Bean
    public MyClass30 myClass30Bean(){
        return new MyClass30(myClass31Bean());
    }
}

class MyClass31{

}

class MyClass30{
    private MyClass31 field;

    public MyClass30(MyClass31 field) {
        this.field = field;
    }

    public MyClass31 getField() {
        return field;
    }
}