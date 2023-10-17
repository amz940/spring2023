package com.example.spring2023;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Component;

@SpringBootApplication
// 메인 메소드가 있는 클래스의 패키지와 하위 패키지를 스캔해서
// component가 있는 클래스를 발견하면 자동으로 끌고와서
// 작성해준다
public class MyApp2 {
    public static void main(String[] args) {
        ApplicationContext context = SpringApplication.run(MyApp2.class, args);
        Object bean1 = context.getBean("myInstance2"); // spring bean
        System.out.println(bean1 instanceof MyClass2); // true
        MyClass2 o1 = (MyClass2) bean1;
        // bean : 객체 하나를 리턴해준다
        //
        // 스프링에서 자동으로 객체를 만들어줌

        Object bean3 = context.getBean("myBean3"); // spring bean
        System.out.println(bean3 instanceof  MyClass3);; // true
        MyClass3 o3 = (MyClass3) bean3;

        System.out.println(System.identityHashCode(context.getBean("myBean3")));
        System.out.println(System.identityHashCode(context.getBean("myBean3")));
        System.out.println(System.identityHashCode(context.getBean("myBean3")));


        System.out.println(System.identityHashCode(context.getBean("myInstance2")));
        System.out.println(System.identityHashCode(context.getBean("myInstance2")));
        System.out.println(System.identityHashCode(context.getBean("myInstance2")));

        MyClass2 bean22 = context.getBean("myInstance2", MyClass2.class);
        MyClass3 bean33 = context.getBean("myInstance2", MyClass3.class);

        System.out.println(System.identityHashCode(bean22));
        System.out.println(System.identityHashCode(bean33));


    }
}

@Component("myInstance2")
// 어너테이션이 붙으면 자동으로 인스턴스로 만들어준다
class MyClass2{
    public void method2(){
        System.out.println("MyClass2.method2");
    }
}

class MyClass3{
    public void method3(){

    }
}
