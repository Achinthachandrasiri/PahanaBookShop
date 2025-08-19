package com.bookshop.service;

import com.bookshop.dao.interfaces.CustomerDAO;
import com.bookshop.dao.CustomerDAOImpl;
import com.bookshop.model.Customer;
import java.util.List;

public class CustomerService {
    private final CustomerDAO customerDAO;

    public CustomerService() {
        this.customerDAO = new CustomerDAOImpl();
    }

    public CustomerService(CustomerDAO customerDAO) {
        this.customerDAO = customerDAO;
    }

    public void saveCustomer(Customer customer) throws Exception {
        // Validate customer input
        if (customer == null) {
            throw new IllegalArgumentException("Customer cannot be null");
        }
        if (customer.getEmail() == null || customer.getEmail().trim().isEmpty()) {
            throw new IllegalArgumentException("Email cannot be empty");
        }
        if (customer.getName() == null || customer.getName().trim().isEmpty()) {
            throw new IllegalArgumentException("Name cannot be empty");
        }
        if (customer.getMobile() == null || customer.getMobile().trim().isEmpty()) {
            throw new IllegalArgumentException("Mobile cannot be empty");
        }
        if (customer.getAddress() == null || customer.getAddress().trim().isEmpty()) {
            throw new IllegalArgumentException("Address cannot be empty");
        }
        if (customer.getAccountNo() <= 0) {
            throw new IllegalArgumentException("Account number must be a positive value");
        }

        // Additional validation (email format)
//        if (!isValidEmail(customer.getEmail())) {
//            throw new IllegalArgumentException("Invalid email format");
//        }

        // Save customer
        try {
            customerDAO.save(customer);
        } catch (Exception e) {
            throw new Exception("Failed to save customer: " + e.getMessage(), e);
        }
    }

    public List<Customer> getCustomers() throws Exception {
        try {
            return customerDAO.getCustomer();
        } catch (Exception e) {
            throw new Exception("Failed to retrieve customers: " + e.getMessage(), e);
        }
    }

    public void deleteCustomerByEmail(String email) throws Exception {
        if (email == null || email.trim().isEmpty()) {
            throw new IllegalArgumentException("Email cannot be empty");
        }
//        if (!isValidEmail(email)) {
//            throw new IllegalArgumentException("Invalid email format");
//        }

        try {
            customerDAO.delete(email.trim());
        } catch (Exception e) {
            throw new Exception("Failed to delete customer: " + e.getMessage(), e);
        }
    }

    public Customer getCustomerByEmail(String email) throws Exception {
        if (email == null || email.trim().isEmpty()) {
            throw new IllegalArgumentException("Email cannot be empty");
        }

        try {
            return customerDAO.getCustomerByEmail(email.trim());
        } catch (Exception e) {
            throw new Exception("Failed to retrieve customer: " + e.getMessage(), e);
        }
    }

    public void updateCustomer(Customer customer) throws Exception {
        if (customer == null) {
            throw new IllegalArgumentException("Customer cannot be null");
        }
        if (customer.getEmail() == null || customer.getEmail().trim().isEmpty()) {
            throw new IllegalArgumentException("Email cannot be empty");
        }
        if (customer.getName() == null || customer.getName().trim().isEmpty()) {
            throw new IllegalArgumentException("Name cannot be empty");
        }
        if (customer.getMobile() == null || customer.getMobile().trim().isEmpty()) {
            throw new IllegalArgumentException("Mobile cannot be empty");
        }
        if (customer.getAddress() == null || customer.getAddress().trim().isEmpty()) {
            throw new IllegalArgumentException("Address cannot be empty");
        }
        if (customer.getAccountNo() <= 0) {
            throw new IllegalArgumentException("Account number must be a positive value");
        }

//        if (!isValidEmail(customer.getEmail())) {
//            throw new IllegalArgumentException("Invalid email format");
//        }

        try {
            customerDAO.updateCustomer(customer);
        } catch (Exception e) {
            throw new Exception("Failed to update customer: " + e.getMessage(), e);
        }
    }

    public List<Customer> getAllCustomers() throws Exception {
        return customerDAO.getCustomer(); // Uses your existing DAO method
    }

    // Email validation helper
//    private boolean isValidEmail(String email) {
//        String emailRegex = "^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$";
//        return email.matches(emailRegex);
//    }
}
