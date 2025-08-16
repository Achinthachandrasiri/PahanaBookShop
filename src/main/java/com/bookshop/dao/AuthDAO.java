package com.bookshop.dao;

import com.bookshop.model.User;
import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;
import java.sql.*;

public class AuthDAO {
    private static final String LOGIN_QUERY = "SELECT email, password, name, mobile, role FROM users WHERE email = ? AND password = ?";
    private static final String GET_USER_BY_EMAIL = "SELECT email, password, name, mobile, role FROM users WHERE email = ?";
    private static final HikariDataSource dataSource;

    static {
        HikariConfig config = new HikariConfig();
        config.setDriverClassName("com.mysql.cj.jdbc.Driver");
        config.setJdbcUrl("jdbc:mysql://localhost:3306/pahana_bookshop?useSSL=false&serverTimezone=UTC");
        config.setUsername("root");
        config.setPassword("admin123456");
        config.setMaximumPoolSize(10);
        config.setMinimumIdle(5);
        config.setConnectionTimeout(30000);
        dataSource = new HikariDataSource(config);
    }

    public Connection getConnection() throws SQLException {
        return dataSource.getConnection();
    }

    public User authenticateUser(String email, String password) {
        User user = null;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(LOGIN_QUERY)) {

            statement.setString(1, email);
            statement.setString(2, password); // In production, use hashed passwords

            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                user = new User(
                        rs.getString("email"),
                        rs.getString("password"),
                        rs.getString("name"),
                        rs.getString("mobile"),
                        rs.getString("role")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    public User getUserByEmail(String email) {
        User user = null;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(GET_USER_BY_EMAIL)) {

            statement.setString(1, email);
            ResultSet rs = statement.executeQuery();

            if (rs.next()) {
                user = new User(
                        rs.getString("email"),
                        rs.getString("password"),
                        rs.getString("name"),
                        rs.getString("mobile"),
                        rs.getString("role")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }
}