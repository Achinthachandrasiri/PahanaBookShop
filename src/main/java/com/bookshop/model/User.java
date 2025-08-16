package com.bookshop.model;

public class User {
    private String email;
    private String password;  // Changed from int to String
    private String name;
    private String mobile;
    private String role;// Changed from int to String

    // Constructors
    public User() {
        // Default constructor
    }

    public User(String email, String password, String name, String mobile, String role) {
        this.email = email;
        this.password = password;
        this.name = name;
        this.mobile = mobile;
        this.role = role;
    }

    // Getters and Setters
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getRole() {
        return role;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    // toString() for logging/debugging
    @Override
    public String toString() {
        return "User{" +
                "email='" + email + '\'' +
                ", password='[PROTECTED]'" +
                ", name='" + name + '\'' +
                ", mobile='" + mobile + '\'' +
                ", role='" + role + '\'' +
                '}';
    }

    // equals() and hashCode() including role for more precise comparisons
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        User user = (User) o;
        return email.equals(user.email) &&
                ((role == null && user.role == null) || (role != null && role.equals(user.role)));
    }

    @Override
    public int hashCode() {
        int result = email.hashCode();
        result = 31 * result + (role != null ? role.hashCode() : 0);
        return result;
    }

}