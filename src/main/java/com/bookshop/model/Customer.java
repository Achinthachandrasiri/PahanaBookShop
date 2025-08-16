package com.bookshop.model;

public class Customer {
    private String email;
    private String name;
    private String mobile;
    private int accountNo;
    private String address;

    public Customer() {
        // Default constructor
    }

    // Full constructor with all fields
    public Customer(String email, String name, String mobile, int accountNo, String address) {
        this.email = email;
        this.name = name;
        this.mobile = mobile;
        this.accountNo = accountNo;
        this.address = address;
    }

    // Getters
    public String getEmail() {
        return email;
    }

    public String getName() {
        return name;
    }

    public String getMobile() {
        return mobile;
    }

    public int getAccountNo() {
        return accountNo;
    }

    public String getAddress() {
        return address;
    }

    // Setters
    public void setEmail(String email) {
        this.email = email;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public void setAccountNo(int accountNo) {
        this.accountNo = accountNo;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}
