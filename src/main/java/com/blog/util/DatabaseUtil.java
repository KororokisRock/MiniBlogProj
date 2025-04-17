package com.blog.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.io.InputStream;
import java.util.Properties;

public class DatabaseUtil {
    
    private static final String PROPERTIES_FILE = "config.properties";
    private static final Properties props = new Properties();

    static {
        loadDatabaseProperties();
        loadJdbcDriver();
    }

    private static void loadDatabaseProperties() {
        try (InputStream input = DatabaseUtil.class
                .getClassLoader()
                .getResourceAsStream(PROPERTIES_FILE)) {
            
            if (input == null) {
                throw new RuntimeException("Файл " + PROPERTIES_FILE + " не найден!");
            }
            props.load(input);
            
        } catch (Exception e) {
            throw new RuntimeException("Ошибка загрузки конфигурации БД", e);
        }
    }

    private static void loadJdbcDriver() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("MySQL JDBC Driver не найден", e);
        }
    }

    public static Connection getConnection() {
        try {
            return DriverManager.getConnection(
                props.getProperty("db.url"),
                props.getProperty("db.user"),
                props.getProperty("db.password")
            );
        } catch (SQLException e) {
            throw new RuntimeException("Ошибка подключения к БД", e);
        }
    }
}
