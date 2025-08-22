package com.bookshop.service;

import com.bookshop.model.User;
import org.junit.jupiter.api.*;
import java.util.List;
import static org.junit.jupiter.api.Assertions.*;

class UserServiceTest {

    private UserService userService;

    @BeforeEach
    void setUp() {
        userService = new UserService();
    }

    @Test
    void testSaveUser() {
        User user = new User("testuser@example.com", "pass123", "Test User", "1234567890", "admin");

        assertDoesNotThrow(() -> userService.saveUser(user));
    }

    @Test
    void testetUsers() throws Exception {
        List<User> users = userService.getUsers();
        assertNotNull(users); // Should return a list (empty or filled)
    }

    @Test
    void testGetUserByEmail() throws Exception {
        String email = "dinesh@gmail.com";
        User user = userService.getUserByEmail(email);
        assertNotNull(user);
        assertEquals(email, user.getEmail());
    }

    @Test
    void testDeleteUser() {
        String email = "test01@gmail.com";

        assertDoesNotThrow(() -> userService.deleteUserByEmail(email));
    }
}
