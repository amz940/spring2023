package com.example.spring2023.domain;

import lombok.Data;

@Data
public class MyDto30 {
    private String keyword;

    public String getKeyword(){
        if (keyword == null){
            return "%%";
        }
        return "%" + keyword + "%";
    }
}
