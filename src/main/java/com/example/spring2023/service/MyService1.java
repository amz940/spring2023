package com.example.spring2023.service;

import com.example.spring2023.dao.MyDao6;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
@Transactional(rollbackFor = Exception.class) // 반드시 같이 실행되어야 하는 코드들끼리 묶일때 쓰인다
// checked 익섹셥에도 롤백 되길 원한다면 쓰고, 런타임 익셉션에만 롤백하고 싶다면 안써도 된다
public class MyService1 {

    private final MyDao6 dao;

    public void tx1(){
        dao.update1();

        int c = 1 / 0; // exception 발생

        dao.update2();
    }
}
