package com.bookshop.service;

import com.bookshop.dao.AuthDAO;
import com.bookshop.model.User;

public class AuthService {
    private AuthDAO authDAO;

    public AuthService() {
        this.authDAO = new AuthDAO();
    }

    public User login(String email, String password) {
        // Validate input
        if (email == null || email.trim().isEmpty()) {
            throw new IllegalArgumentException("Email cannot be empty");
        }

        if (password == null || password.trim().isEmpty()) {
            throw new IllegalArgumentException("Password cannot be empty");
        }

        // Validate email format
        if (!isValidEmail(email)) {
            throw new IllegalArgumentException("Invalid email format");
        }

        // Authenticate user
        User user = authDAO.authenticateUser(email.trim().toLowerCase(), password);

        if (user == null) {
            throw new RuntimeException("Invalid email or password");
        }

        return user;
    }

    public boolean isUserExists(String email) {
        User user = authDAO.getUserByEmail(email.trim().toLowerCase());
        return user != null;
    }

    private boolean isValidEmail(String email) {
        String emailRegex = "^[a-zA-Z0-9_+&*-]+(?:\\.[a-zA-Z0-9_+&*-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,7}$";
        return email.matches(emailRegex);
    }
}
