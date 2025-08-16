package com.bookshop.controller;

import com.bookshop.model.User;
import com.bookshop.dao.AuthDAO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class AuthServlet extends HttpServlet {
    private AuthDAO authDAO;

    @Override
    public void init() throws ServletException {
        authDAO = new AuthDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("application/json");
        PrintWriter out = response.getWriter();

        // Get email and password from frontend
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Check if user exists and password matches
        User user = authDAO.authenticateUser(email, password);

        if (user != null) {
            // Login successful - send user data
            out.println("{");
            out.println("\"success\": true,");
            out.println("\"message\": \"Login successful\",");
            out.println("\"user\": {");
            out.println("\"email\": \"" + user.getEmail() + "\",");
            out.println("\"name\": \"" + user.getName() + "\",");
            out.println("\"mobile\": \"" + user.getMobile() + "\"");
            out.println("\"role\": \"" + user.getRole() + "\"");
            out.println("}");
            out.println("}");
        } else {
            // Login failed
            out.println("{");
            out.println("\"success\": false,");
            out.println("\"message\": \"Invalid email or password\"");
            out.println("}");
        }
    }
}