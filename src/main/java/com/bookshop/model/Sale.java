package com.bookshop.model;

public class Sale {
    private String invoiceNumber;
    private double totalAmount;
    private double paidAmount;
    private double balance;
    private String customerName;
    private int accountNo;

    public Sale() {
        // Default constructor
    }

    // Full constructor
    public Sale(String invoiceNumber, double totalAmount, double paidAmount, double balance, String customerName, int accountNo) {
        this.invoiceNumber = invoiceNumber;
        this.totalAmount = totalAmount;
        this.paidAmount = paidAmount;
        this.balance = balance;
        this.customerName = customerName;
        this.accountNo = accountNo;
    }

    // Getters
    public String getInvoiceNumber() {
        return invoiceNumber;
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public double getPaidAmount() {
        return paidAmount;
    }

    public double getBalance() {
        return balance;
    }

    public String getCustomerName() {
        return customerName;
    }

    public int getAccountNo() {
        return accountNo;
    }

    // Setters
    public void setInvoiceNumber(String invoiceNumber) {
        this.invoiceNumber = invoiceNumber;
    }

    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }

    public void setPaidAmount(double paidAmount) {
        this.paidAmount = paidAmount;
    }

    public void setBalance(double balance) {
        this.balance = balance;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public void setAccountNo(int accountNo) {
        this.accountNo = accountNo;
    }
}
