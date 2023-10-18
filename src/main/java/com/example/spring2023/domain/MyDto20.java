package com.example.spring2023.domain;

import lombok.Data;

@Data
public class MyDto20 {
    // 만약 이름이 DTO랑 Dao 쪽이 다를경우
    private String name;
    private Double price;
    private String category;
}
