package com.bookshop.dao;

import com.bookshop.dao.interfaces.UserDAO;
import com.bookshop.model.User;
import com.bookshop.utils.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDAOImpl implements UserDAO {
    private static final String INSERT_USER_SQL =
            "INSERT INTO users (email, password, name, mobile, role) VALUES (?, ?, ?, ?, ?)";

    @Override
    public void save(User user) throws SQLException {
        if (user == null) {
            throw new IllegalArgumentException("User cannot be null");
        }
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USER_SQL)) {
            preparedStatement.setString(1, user.getEmail());
            preparedStatement.setString(2, user.getPassword());
            preparedStatement.setString(3, user.getName());
            preparedStatement.setString(4, user.getMobile());
            preparedStatement.setString(5, user.getRole());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new SQLException("Failed to save user: " + e.getMessage(), e);
        }
    }

    @Override
    public List<User> getUsers() throws SQLException {
        List<User> users = new ArrayList<>();
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(
                     "SELECT email, password, name, mobile, role FROM users");
             ResultSet resultSet = preparedStatement.executeQuery()) {
            while (resultSet.next()) {
                User user = new User(
                        resultSet.getString("email"),
                        resultSet.getString("password"),
                        resultSet.getString("name"),
                        resultSet.getString("mobile"),
                        resultSet.getString("role")
                );
                users.add(user);
            }
        } catch (SQLException e) {
            throw new SQLException("Failed to retrieve users: " + e.getMessage(), e);
        }
        return users;
    }

    @Override
    public void delete(String email) throws SQLException {
        if (email == null || email.trim().isEmpty()) {
            throw new IllegalArgumentException("Email is required for deletion");
        }
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement ps = connection.prepareStatement(
                     "DELETE FROM users WHERE email = ?")) {
            ps.setString(1, email);
            int rowsAffected = ps.executeUpdate();

            if (rowsAffected == 0) {
                throw new SQLException("No user found with email: " + email);
            }
        } catch (SQLException e) {
            throw new SQLException("Failed to delete user: " + e.getMessage(), e);
        }
    }

    @Override
    public User getUserByEmail(String email) throws SQLException {
        if (email == null || email.trim().isEmpty()) {
            throw new IllegalArgumentException("Email is required to retrieve user");
        }

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(
                     "SELECT email, password, name, mobile, role FROM users WHERE email = ?")) {
            preparedStatement.setString(1, email);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    return new User(
                            resultSet.getString("email"),
                            resultSet.getString("password"),
                            resultSet.getString("name"),
                            resultSet.getString("mobile"),
                            resultSet.getString("role")
                    );
                } else {
                    throw new SQLException("No user found with email: " + email);
                }
            }
        } catch (SQLException e) {
            throw new SQLException("Failed to retrieve user by email: " + e.getMessage(), e);
        }
    }

    @Override
    public void updateUser(User user) throws SQLException {
        if (user == null) {
            throw new IllegalArgumentException("User cannot be null");
        }
        if (user.getEmail() == null || user.getEmail().trim().isEmpty()) {
            throw new IllegalArgumentException("Email is required for update");
        }

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(
                     "UPDATE users SET password = ?, name = ?, mobile = ? WHERE email = ?")) {
            preparedStatement.setString(1, user.getPassword());
            preparedStatement.setString(2, user.getName());
            preparedStatement.setString(3, user.getMobile());
            preparedStatement.setString(4, user.getEmail());
            preparedStatement.setString(5,user.getRole());

            int rowsAffected = preparedStatement.executeUpdate();

            if (rowsAffected == 0) {
                throw new SQLException("No user found with email: " + user.getEmail());
            }
        } catch (SQLException e) {
            throw new SQLException("Failed to update user: " + e.getMessage(), e);
        }
    }
}