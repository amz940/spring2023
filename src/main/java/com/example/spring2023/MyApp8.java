package com.example.spring2023;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Component;

@SpringBootApplication
public class MyApp8 {
    public static void main(String[] args) {
        ApplicationContext context = SpringApplication.run(MyApp8.class,args);
        Object myClass14 = context.getBean("myClass14");
        System.out.println("myClass14 = " + myClass14);

        context.getBean("myClass13", MyClass13.class);
    }
}

@Component
class MyClass14{

}

@Component
class MyClass13{

    private MyClass14 dep;

    public MyClass13(MyClass14 dep) {
        this.dep = dep;
    }

    public MyClass14 getDep() {
        return dep;
    }
}