package com.example.spring2023.domain;

import lombok.Data;

import java.time.LocalDate;

@Data
public class MyDto41 {
    private String lastName;
    private String firstName;
    private LocalDate birthDate;
    private Integer id;
}
