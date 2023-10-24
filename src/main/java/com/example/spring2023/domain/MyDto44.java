package com.example.spring2023.domain;

import lombok.Data;

import java.util.List;
import java.util.Map;

@Data
public class MyDto44 {
    private String name;
    private List<String> email;
    private Map<String, Object> home;
    private Double price;
    private Double weight;
    private Boolean married;
}
//name : "son",
//        email : ["son@gmail.com", "hm@gmail.com"],
//        home : {
//        first : "seoul",
//        second: "london"
//        },
//        price : 35.11,
//        weight : 77.6,
//        married : true