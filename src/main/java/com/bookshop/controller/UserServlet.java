package com.bookshop.controller;

import com.bookshop.model.User;
import com.bookshop.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

public class UserServlet extends HttpServlet {
    private final UserService userService;

    public UserServlet() {
        this.userService = new UserService();
    }

    public UserServlet(UserService userService) {
        this.userService = userService;
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String path = req.getServletPath();   // /register  or  /deleteUser

        switch (path) {
            case "/register":
                handleRegister(req, resp);
                break;
            case "/deleteUser":
                handleDelete(req, resp);
                break;
            case "/updateUser":
                String method = req.getParameter("_method");
                if ("PUT".equals(method)) {
                    handleUpdateUser(req, resp);
                } else {
                    resp.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
                }
                break;
            default:
                resp.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }

    private void handleRegister(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        resp.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = resp.getWriter()) {

            String email    = req.getParameter("email");
            String password = req.getParameter("password");
            String name     = req.getParameter("name");
            String mobile   = req.getParameter("mobile");

            try {
                userService.saveUser(new User(email, password, name, mobile));
                List<User> users = userService.getUsers();
                req.setAttribute("users", users);
                req.setAttribute("successMessage", "User registered successfully!");
                req.getRequestDispatcher("viewUsers.jsp").forward(req, resp);
            } catch (IllegalArgumentException ex) {
                resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                out.println("<h3>Error: " + ex.getMessage() + "</h3>");
                out.println("<a href='register.jsp'>Try Again</a>");
            } catch (Exception ex) {
                resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                out.println("<h3>Error: Failed to register user. " + ex.getMessage() + "</h3>");
                out.println("<a href='register.jsp'>Try Again</a>");
            }
        }
    }

    private void handleDelete(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        resp.setContentType("application/json");
        try (PrintWriter out = resp.getWriter()) {

            String email = req.getParameter("email");

            if (email == null || email.trim().isEmpty()) {
                resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                out.write("{\"error\":\"Email parameter is required\"}");
                return;
            }

            try {
                userService.deleteUserByEmail(email.trim());
                List<User> users = userService.getUsers();
                req.setAttribute("users", users);
                req.setAttribute("successMessage", "User deleted successfully!");
                req.getRequestDispatcher("viewUsers.jsp").forward(req, resp);
            } catch (IllegalArgumentException ex) {
                resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                out.write("{\"error\":\"" + ex.getMessage().replace("\"", "\\\"") + "\"}");
            } catch (Exception ex) {
                resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                out.write("{\"error\":\"Failed to delete user: "
                        + ex.getMessage().replace("\"", "\\\"") + "\"}");
            }
        }
    }

   // @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        try {
//            List<User> users = userService.getUsers();
//            request.setAttribute("users", users);
//            request.getRequestDispatcher("viewUsers.jsp").forward(request, response);
//        } catch (Exception e) {
//            request.setAttribute("error", "Failed to retrieve users: " + e.getMessage());
//            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
//            request.getRequestDispatcher("viewUsers.jsp").forward(request, response);
//        }
//    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String path = req.getServletPath();   // /getUsers, /getUser, or /editUser

        switch (path) {
            case "/users":
                handleGetUsers(req, resp);
                break;
            case "/editUser":
                handleGetUserByEmail(req, resp);
                break;
            default:
                resp.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }

    private void handleGetUsers(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        try {
            List<User> users = userService.getUsers();
            req.setAttribute("users", users);
            req.getRequestDispatcher("viewUsers.jsp").forward(req, resp);
        } catch (Exception e) {
            req.setAttribute("error", "Failed to retrieve users: " + e.getMessage());
            resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            req.getRequestDispatcher("viewUsers.jsp").forward(req, resp);
        }
    }

    private void handleGetUserByEmail(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        try {
            String email = req.getParameter("email");

            if (email == null || email.trim().isEmpty()) {
                req.setAttribute("error", "Email parameter is missing or empty");
                req.getRequestDispatcher("editUser.jsp").forward(req, resp);
                return;
            }

            try {
                User user = userService.getUserByEmail(email.trim());
                req.setAttribute("user", user);
                req.getRequestDispatcher("editUser.jsp").forward(req, resp);

            } catch (IllegalArgumentException ex) {
                req.setAttribute("error", "User not found: " + ex.getMessage());
                req.getRequestDispatcher("editUser.jsp").forward(req, resp);
            } catch (Exception ex) {
                req.setAttribute("error", "Error retrieving user: " + ex.getMessage());
                req.getRequestDispatcher("editUser.jsp").forward(req, resp);
            }

        } catch (Exception e) {
            req.setAttribute("error", "Unexpected error: " + e.getMessage());
            req.getRequestDispatcher("editUser.jsp").forward(req, resp);
        }
    }

    private void handleUpdateUser(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        if (isAjaxRequest(req)) {
            resp.setContentType("application/json");
        } else {
            resp.setContentType("text/html;charset=UTF-8");
        }

        try (PrintWriter out = resp.getWriter()) {
            String email = req.getParameter("email");
            String password = req.getParameter("password");
            String name = req.getParameter("name");
            String mobile = req.getParameter("mobile");

            if (email == null || email.trim().isEmpty()) {
                resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                if (isAjaxRequest(req)) {
                    out.print("{\"error\":\"Email parameter is required\"}");
                } else {
                    req.setAttribute("error", "Email parameter is required");
                    req.getRequestDispatcher("editUser.jsp").forward(req, resp);
                }
                return;
            }

            if (mobile != null && !mobile.matches("[0-9]{10}")) {
                resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                if (isAjaxRequest(req)) {
                    out.print("{\"error\":\"Mobile number must be 10 digits\"}");
                } else {
                    req.setAttribute("error", "Mobile number must be 10 digits");
                    req.getRequestDispatcher("editUser.jsp").forward(req, resp);
                }
                return;
            }

            try {
                String finalPassword = password != null && !password.isEmpty() ?
                        password : userService.getUserByEmail(email.trim()).getPassword();
                userService.updateUser(new User(email.trim(), finalPassword, name, mobile));
                if (isAjaxRequest(req)) {
                    out.print("{\"success\":\"User updated successfully\"}");
                } else {
                    List<User> users = userService.getUsers();
                    req.setAttribute("users", users);
                    req.setAttribute("successMessage", "User updated successfully!");
                    req.getRequestDispatcher("viewUsers.jsp").forward(req, resp);
                }
            } catch (IllegalArgumentException ex) {
                resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                if (isAjaxRequest(req)) {
                    out.print("{\"error\":\"" + ex.getMessage().replace("\"", "\\\"") + "\"}");
                } else {
                    req.setAttribute("error", ex.getMessage());
                    req.getRequestDispatcher("editUser.jsp").forward(req, resp);
                }
            } catch (Exception ex) {
                resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                if (isAjaxRequest(req)) {
                    out.print("{\"error\":\"Failed to update user: "
                            + ex.getMessage().replace("\"", "\\\"") + "\"}");
                } else {
                    req.setAttribute("error", "Failed to update user: " + ex.getMessage());
                    req.getRequestDispatcher("editUser.jsp").forward(req, resp);
                }
            }
        }
    }

    private boolean isAjaxRequest(HttpServletRequest request) {
        return "XMLHttpRequest".equals(request.getHeader("X-Requested-With"));
    }

}