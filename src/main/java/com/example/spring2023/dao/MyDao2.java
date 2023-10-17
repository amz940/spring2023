package com.example.spring2023.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface MyDao2 {

    @Select("""
        SELECT LastName FROM employees
        WHERE EmployeeID = #{id} -- #{id} : ? 를 대신한다
    """)
    String select(Integer id); // 인터페이스의 메소드
}
// 클래스 만들고 component를 붙이면 빈을 만들수 있다
