package com.example.spring2023.domain;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;

@NoArgsConstructor
// 생성자가 없는 코드를 사용하고 싶을때
//@RequiredArgsConstructor
// final 변수에 사용
@AllArgsConstructor
// 모든 코드를 생성자로 만들어준다
public class MyDTO5 {
    private String name;
//    private final Integer age;
}

