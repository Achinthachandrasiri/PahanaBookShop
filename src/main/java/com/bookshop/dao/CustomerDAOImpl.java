package com.bookshop.dao;

import com.bookshop.dao.interfaces.CustomerDAO;
import com.bookshop.model.Customer;
import com.bookshop.utils.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerDAOImpl implements CustomerDAO {

    private static final String INSERT_CUSTOMER_SQL =
            "INSERT INTO customers (email, name, mobile, accountNo, address) VALUES (?, ?, ?, ?, ?)";

    @Override
    public void save(Customer customer) throws SQLException {
        if (customer == null) {
            throw new IllegalArgumentException("Customer cannot be null");
        }
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_CUSTOMER_SQL)) {
            preparedStatement.setString(1, customer.getEmail());
            preparedStatement.setString(2, customer.getName());
            preparedStatement.setString(3, customer.getMobile());
            preparedStatement.setInt(4, customer.getAccountNo());
            preparedStatement.setString(5, customer.getAddress());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new SQLException("Failed to save customer: " + e.getMessage(), e);
        }
    }

    @Override
    public List<Customer> getCustomer() throws SQLException {
        List<Customer> customers = new ArrayList<>();
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(
                     "SELECT email, name, mobile, accountNo, address FROM customers");
             ResultSet resultSet = preparedStatement.executeQuery()) {
            while (resultSet.next()) {
                Customer customer = new Customer(
                        resultSet.getString("email"),
                        resultSet.getString("name"),
                        resultSet.getString("mobile"),
                        resultSet.getInt("accountNo"),
                        resultSet.getString("address")
                );
                customers.add(customer);
            }
        } catch (SQLException e) {
            throw new SQLException("Failed to retrieve customers: " + e.getMessage(), e);
        }
        return customers;
    }

    @Override
    public void delete(String email) throws SQLException {
        if (email == null || email.trim().isEmpty()) {
            throw new IllegalArgumentException("Email is required for deletion");
        }

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement ps = connection.prepareStatement(
                     "DELETE FROM customers WHERE email = ?")) {
            ps.setString(1, email);
            int rowsAffected = ps.executeUpdate();

            if (rowsAffected == 0) {
                throw new SQLException("No customer found with email: " + email);
            }
        } catch (SQLException e) {
            throw new SQLException("Failed to delete customer: " + e.getMessage(), e);
        }
    }

    @Override
    public Customer getCustomerByEmail(String email) throws SQLException {
        if (email == null || email.trim().isEmpty()) {
            throw new IllegalArgumentException("Email is required to retrieve customer");
        }

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(
                     "SELECT email, name, mobile, accountNo, address FROM customers WHERE email = ?")) {
            preparedStatement.setString(1, email);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    return new Customer(
                            resultSet.getString("email"),
                            resultSet.getString("name"),
                            resultSet.getString("mobile"),
                            resultSet.getInt("accountNo"),
                            resultSet.getString("address")
                    );
                } else {
                    throw new SQLException("No customer found with email: " + email);
                }
            }
        } catch (SQLException e) {
            throw new SQLException("Failed to retrieve customer by email: " + e.getMessage(), e);
        }
    }

    @Override
    public void updateCustomer(Customer customer) throws SQLException {
        if (customer == null) {
            throw new IllegalArgumentException("Customer cannot be null");
        }
        if (customer.getEmail() == null || customer.getEmail().trim().isEmpty()) {
            throw new IllegalArgumentException("Email is required for update");
        }

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(
                     "UPDATE customers SET name = ?, mobile = ?, accountNo = ?, address = ? WHERE email = ?")) {
            preparedStatement.setString(1, customer.getName());
            preparedStatement.setString(2, customer.getMobile());
            preparedStatement.setInt(3, customer.getAccountNo());
            preparedStatement.setString(4, customer.getAddress());
            preparedStatement.setString(5, customer.getEmail());

            int rowsAffected = preparedStatement.executeUpdate();

            if (rowsAffected == 0) {
                throw new SQLException("No customer found with email: " + customer.getEmail());
            }
        } catch (SQLException e) {
            throw new SQLException("Failed to update customer: " + e.getMessage(), e);
        }
    }
}
