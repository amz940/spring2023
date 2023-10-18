package com.example.spring2023.domain;

import lombok.Data;

@Data
public class MyDto29 {
    private Integer page;
    private Integer rows;

    private Integer from;

    public Integer getFrom(){
        return (page - 1) * rows;
    }
}
