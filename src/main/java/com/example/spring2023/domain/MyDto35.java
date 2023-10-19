package com.example.spring2023.domain;

import lombok.Getter;

public class MyDto35 {
    private String id;
    // 프로퍼티명 : id
    public String getId() {
        return id;
    }

    @Getter
    // 롬복이 앞글자가 소문자면 자동으로 대문자로 바꿔버린다
    // 대문자가 연속으로 나오면 전부다 대문자로 취급해버린다.
    private String uRL; // URL로 클래스명을 정해버림 rombok에서

//    public String getuRL() {
//        return uRL;
//    }


}
