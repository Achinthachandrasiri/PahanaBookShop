package com.bookshop.dao;

import com.bookshop.model.User;
import java.util.List;

public interface UserDAO {
    void save(User user) throws Exception;
    List<User> getUsers() throws Exception;
    void delete(String email) throws Exception;
    User getUserByEmail(String email) throws Exception;
    void updateUser(User user) throws Exception;
}