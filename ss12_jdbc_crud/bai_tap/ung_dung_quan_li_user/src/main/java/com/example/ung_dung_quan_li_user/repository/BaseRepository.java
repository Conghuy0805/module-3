package com.example.ung_dung_quan_li_user.repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class BaseRepository {
    private String jdbcURL = "jdbc:mysql://localhost:3306/demo_jdbc";
    private String jdbcUserName = "root";
    private String jdbcPassword = "12345";

    public Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUserName, jdbcPassword);
        } catch (Exception e) {
            System.err.print("Khong the ket noi ");
        }
        return connection;
    }
}
