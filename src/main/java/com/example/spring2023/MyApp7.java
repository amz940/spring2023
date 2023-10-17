package com.example.spring2023;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Component;

@SpringBootApplication
public class MyApp7 {
    public static void main(String[] args) {
        ApplicationContext context = SpringApplication.run(MyApp7.class, args);
        System.out.println(context.getBean("myClass12"));
        System.out.println(context.getBean("myClass11", MyClass11.class).getDep());
    }
}
@Component
class  MyClass12{

}

@Component
class MyClass11{

    private  MyClass12 dep;

    public MyClass11(){
    }

    @Autowired // 생성자 주입
    // 만약 생성자가 한개 일 경우, 해당 생성자에 값을 주입해야 할때
    // autowired는 생략이 가능해진다
    public MyClass11(MyClass12 dep){
        this.dep = dep;
    }

    public MyClass12 getDep() {
        return dep;
    }
}