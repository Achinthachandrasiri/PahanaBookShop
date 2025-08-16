package com.bookshop.dao.interfaces;

import com.bookshop.model.Customer;
import java.util.List;

public interface CustomerDAO {
    void save(Customer customer) throws Exception;
    List<Customer> getCustomer() throws Exception;
    void delete(String email) throws Exception;
    Customer getCustomerByEmail(String email) throws Exception;
    void updateCustomer(Customer customer) throws Exception;
}
