package com.example.spring2023.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
// /main6/sub2?signed=true&email=ab@gmail.com&gender=male
public class MyDTO4 {
    private Boolean signed;
    private String email;
    private String gender;

}
