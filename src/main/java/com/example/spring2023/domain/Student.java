package com.example.spring2023.domain;

public class Student {
    // property는 getter, setter 메소드를 따라간다
    // email property
    // info property // false
    // infomation property // true
    private String email;
    private String info;

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getInfomation() {
        return info;
    }

    public void setInfomation(String info) {
        this.info = info;
    }
}
