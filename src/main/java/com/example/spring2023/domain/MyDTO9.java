package com.example.spring2023.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MyDTO9 {
    private Long id;
    private String firstName;
    private String lastName;
    private String className;
    private String phoneNumber;
}
