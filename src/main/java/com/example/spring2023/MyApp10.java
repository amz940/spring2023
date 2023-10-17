package com.example.spring2023;

import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Component;

@SpringBootApplication
public class MyApp10 {
    public static void main(String[] args) {

    }
}

interface MyInterface1{

}

@Component
class MyClass18 implements MyInterface1{
}

@Component
class MyClass19 implements MyInterface1{

}

@Component
//@RequiredArgsConstructor
class MyClass17{

    private final MyInterface1 field1;

    public MyClass17(@Qualifier("myClass18") MyInterface1 field1) {
        // (주입되는 빈이 2개 이상)동일한 인터페이스를 사용하는 클래스가 2개일때
        // @qualifier("메소드명")으로 지정
        this.field1 = field1;
    }
}
