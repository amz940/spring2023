package com.example.spring2023.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
// lombok getter, setter 등 자주 쓰는 메소드를 짧게 해
public class MyDTO3 {
    private String name;
    private String address;
}
