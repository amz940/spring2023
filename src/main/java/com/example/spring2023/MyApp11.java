package com.example.spring2023;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

public class MyApp11 {

}

interface MyInterface2{
    public default void method2(){

    }
}

@Component
class MyClass21 implements MyInterface2{
    public void method2(){

    }
}

//@Component 주입성이 이쪽으로 와도 코드를 따로 수정할 필요가 없다
class MyClass22 implements MyInterface2{
    public void method2(){}
}

@Component
@RequiredArgsConstructor
class MyClass20{
    private final MyInterface2 field;

    public void method20(){
        field.method2();
    }
}
