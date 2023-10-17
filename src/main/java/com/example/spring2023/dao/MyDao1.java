package com.example.spring2023.dao;

import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@Component
@RequiredArgsConstructor
public class MyDao1 {

    @Autowired
    private final DataSource dataSource;

    public String select(int i) throws SQLException {
        String sql = """
                SELECT * FROM customers
                WHERE customerId = ?
                """;

        Connection connection = dataSource.getConnection();
        PreparedStatement statement = connection.prepareStatement(sql);

        try(connection; statement){
            statement.setInt(1, i);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()){
                return resultSet.getString("customerName");
            }
        }
        return null;
    }
}
