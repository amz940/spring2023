package com.example.spring2023.domain;

public class MyDTO01 {
    // property 명 : get / set 없애고 소문자로 시작

    // name property를 가진다
    // homeAddress property
    private String name;
    private String homeAddress;
    private String MYHOME;
    private Boolean married;
    private boolean checked;

    public boolean isChecked() { // boolean 타입은 get 대신 is로 쓰일수 있다
        return checked;
    }

    public void setChecked(boolean checked) {
        this.checked = checked;
    }

    public Boolean isMarried() { // getMarried 도 된다
        return married;
    }

    public void setMarried(Boolean married) {
        this.married = married;
    }

    public String getMYHOME() {
        return MYHOME;
    }

    public void setMYHOME(String MYHOME) {
        this.MYHOME = MYHOME;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    public String getHomeAddress() {
        return homeAddress;
    }

    public void setHomeAddress(String homeAddress) {
        this.homeAddress = homeAddress;
    }

}
