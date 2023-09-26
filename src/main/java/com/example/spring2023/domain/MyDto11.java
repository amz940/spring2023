package com.example.spring2023.domain;

import lombok.Data;

import java.util.List;
@Data
public class MyDto11 {
    private String userId;
    private String userEmail;
    private String birthDate;
    private List<String> hobby;
}
