package com.bookshop.service;

import com.bookshop.dao.UserDAO;
import com.bookshop.dao.UserDAOImpl;
import com.bookshop.model.User;
import java.util.List;

public class UserService {
    private final UserDAO userDAO;

    public UserService() {
        this.userDAO = new UserDAOImpl();
    }

    public UserService(UserDAO userDAO) {
        this.userDAO = userDAO;
    }

    public void saveUser(User user) throws Exception {
        // Validate user input
        if (user == null) {
            throw new IllegalArgumentException("User cannot be null");
        }
        if (user.getEmail() == null || user.getEmail().trim().isEmpty()) {
            throw new IllegalArgumentException("Email cannot be empty");
        }
        if (user.getPassword() == null || user.getPassword().trim().isEmpty()) {
            throw new IllegalArgumentException("Password cannot be empty");
        }
        if (user.getName() == null || user.getName().trim().isEmpty()) {
            throw new IllegalArgumentException("Name cannot be empty");
        }
        if (user.getMobile() == null || user.getMobile().trim().isEmpty()) {
            throw new IllegalArgumentException("Mobile cannot be empty");
        }

        // Additional validation (e.g., email format)
        if (!isValidEmail(user.getEmail())) {
            throw new IllegalArgumentException("Invalid email format");
        }

        // Call DAO to save the user
        try {
            userDAO.save(user);
        } catch (Exception e) {
            throw new Exception("Failed to save user: " + e.getMessage(), e);
        }
    }

    public List<User> getUsers() throws Exception {
        try {
            return userDAO.getUsers();
        } catch (Exception e) {
            throw new Exception("Failed to retrieve users: " + e.getMessage(), e);
        }
    }

    public void deleteUserByEmail(String email) throws Exception {
        // Validate email parameter
        if (email == null || email.trim().isEmpty()) {
            throw new IllegalArgumentException("Email cannot be empty");
        }

        if (!isValidEmail(email)) {
            throw new IllegalArgumentException("Invalid email format");
        }

        try {
            userDAO.delete(email.trim());
        } catch (Exception e) {
            throw new Exception("Failed to delete user: " + e.getMessage(), e);
        }
    }

    public User getUserByEmail(String email) throws Exception {
        // Validate email parameter
        if (email == null || email.trim().isEmpty()) {
            throw new IllegalArgumentException("Email cannot be empty");
        }

        if (!isValidEmail(email)) {
            throw new IllegalArgumentException("Invalid email format");
        }

        try {
            return userDAO.getUserByEmail(email.trim());
        } catch (Exception e) {
            throw new Exception("Failed to retrieve user: " + e.getMessage(), e);
        }
    }

    public void updateUser(User user) throws Exception {
        // Validate user input
        if (user == null) {
            throw new IllegalArgumentException("User cannot be null");
        }
        if (user.getEmail() == null || user.getEmail().trim().isEmpty()) {
            throw new IllegalArgumentException("Email cannot be empty");
        }
        if (user.getPassword() == null || user.getPassword().trim().isEmpty()) {
            throw new IllegalArgumentException("Password cannot be empty");
        }
        if (user.getName() == null || user.getName().trim().isEmpty()) {
            throw new IllegalArgumentException("Name cannot be empty");
        }
        if (user.getMobile() == null || user.getMobile().trim().isEmpty()) {
            throw new IllegalArgumentException("Mobile cannot be empty");
        }

        // Additional validation (e.g., email format)
        if (!isValidEmail(user.getEmail())) {
            throw new IllegalArgumentException("Invalid email format");
        }

        // Call DAO to update the user
        try {
            userDAO.updateUser(user);
        } catch (Exception e) {
            throw new Exception("Failed to update user: " + e.getMessage(), e);
        }
    }

    // Helper method to validate email format
    private boolean isValidEmail(String email) {
        // Basic email validation regex
        String emailRegex = "^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$";
        return email.matches(emailRegex);
    }
}