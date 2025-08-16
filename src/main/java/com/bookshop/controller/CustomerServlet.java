package com.bookshop.controller;

import com.bookshop.model.Customer;
import com.bookshop.service.CustomerService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

public class CustomerServlet extends HttpServlet {

    private final CustomerService customerService;

    public CustomerServlet() {
        this.customerService = new CustomerService();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String path = req.getServletPath();

        switch (path) {
            case "/saveCustomer":
                handleAddCustomer(req, resp);
                break;
            case "/updateCustomer":
                handleUpdateCustomer(req, resp);
                break;
            case "/deleteCustomer":
                handleDeleteCustomer(req, resp);
                break;
            default:
                resp.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String path = req.getServletPath();

        switch (path) {
            case "/customers":
                handleGetCustomers(req, resp);
                break;
            case "/editCustomer":
                handleEditCustomer(req, resp);
                break;
            default:
                resp.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }

    // =================== HANDLER METHODS ===================

    private void handleAddCustomer(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = resp.getWriter()) {

            // Get form parameters
            String email = req.getParameter("email");
            String name = req.getParameter("name");
            String mobile = req.getParameter("mobile");
            String address = req.getParameter("address");
            int accountNo = 0;

            try {
                accountNo = Integer.parseInt(req.getParameter("accountNo"));
            } catch (NumberFormatException nfe) {
                out.println("<h3>Error: Account number must be a valid integer</h3>");
                out.println("<a href='addCustomer.jsp'>Try Again</a>");
                return;
            }

            try {
                // Correct constructor order: email, name, mobile, accountNo, address
                Customer customer = new Customer(email, name, mobile, accountNo, address);
                customerService.saveCustomer(customer);

                // Forward to viewCustomers.jsp with updated list
                req.setAttribute("successMessage", "Customer added successfully!");
                req.setAttribute("customers", customerService.getCustomers());
                req.getRequestDispatcher("viewCustomers.jsp").forward(req, resp);

            } catch (IllegalArgumentException ex) {
                out.println("<h3>Error: " + ex.getMessage() + "</h3>");
                out.println("<a href='addCustomer.jsp'>Try Again</a>");
            } catch (Exception ex) {
                out.println("<h3>Error: Failed to add customer. " + ex.getMessage() + "</h3>");
                out.println("<a href='addCustomer.jsp'>Try Again</a>");
            }
        }
    }


    private void handleGetCustomers(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        try {
            List<Customer> customers = customerService.getCustomers();
            req.setAttribute("customers", customers);
            req.getRequestDispatcher("viewCustomers.jsp").forward(req, resp);
        } catch (Exception e) {
            req.setAttribute("error", "Failed to retrieve customers: " + e.getMessage());
            resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            req.getRequestDispatcher("viewCustomers.jsp").forward(req, resp);
        }
    }

    private void handleEditCustomer(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        try {
            String email = req.getParameter("email");

            if (email == null || email.trim().isEmpty()) {
                req.setAttribute("error", "Email parameter is missing or empty");
                req.getRequestDispatcher("/editCustomer.jsp").forward(req, resp);
                return;
            }

            try {
                Customer customer = customerService.getCustomerByEmail(email.trim());

                if (customer == null) {
                    req.setAttribute("error", "Customer not found");
                } else {
                    req.setAttribute("customer", customer);
                }

                req.getRequestDispatcher("/editCustomer.jsp").forward(req, resp);

            } catch (IllegalArgumentException ex) {
                req.setAttribute("error", "Customer not found: " + ex.getMessage());
                req.getRequestDispatcher("/editCustomer.jsp").forward(req, resp);
            } catch (Exception ex) {
                req.setAttribute("error", "Error retrieving customer: " + ex.getMessage());
                req.getRequestDispatcher("/editCustomer.jsp").forward(req, resp);
            }

        } catch (Exception e) {
            req.setAttribute("error", "Unexpected error: " + e.getMessage());
            req.getRequestDispatcher("/editCustomer.jsp").forward(req, resp);
        }
    }

    private void handleUpdateCustomer(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        resp.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = resp.getWriter()) {

            String email = req.getParameter("email");
            String name = req.getParameter("name");
            String mobile = req.getParameter("mobile");
            String address = req.getParameter("address");
            int accountNo = Integer.parseInt(req.getParameter("accountNo"));

            if (email == null || email.trim().isEmpty()) {
                out.println("<h3>Error: Email parameter is required</h3>");
                out.println("<a href='editCustomer.jsp'>Try Again</a>");
                return;
            }

            try {
                customerService.updateCustomer(new Customer(email, name, mobile, accountNo, address));
                req.setAttribute("successMessage", "Customer updated successfully!");
                req.setAttribute("customers", customerService.getCustomers());
                req.getRequestDispatcher("viewCustomers.jsp").forward(req, resp);
            } catch (IllegalArgumentException ex) {
                out.println("<h3>Error: " + ex.getMessage() + "</h3>");
                out.println("<a href='editCustomer.jsp'>Try Again</a>");
            } catch (Exception ex) {
                out.println("<h3>Error: Failed to update customer: " + ex.getMessage() + "</h3>");
                out.println("<a href='editCustomer.jsp'>Try Again</a>");
            }
        }
    }

    private void handleDeleteCustomer(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        resp.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = resp.getWriter()) {
            String email = req.getParameter("email");

            if (email == null || email.trim().isEmpty()) {
                out.println("<h3>Error: Email parameter is required</h3>");
                return;
            }

            try {
                customerService.deleteCustomerByEmail(email.trim());
                req.setAttribute("successMessage", "Customer deleted successfully!");
                req.setAttribute("customers", customerService.getCustomers());
                req.getRequestDispatcher("viewCustomers.jsp").forward(req, resp);
            } catch (IllegalArgumentException ex) {
                out.println("<h3>Error: " + ex.getMessage() + "</h3>");
            } catch (Exception ex) {
                out.println("<h3>Error: Failed to delete customer: " + ex.getMessage() + "</h3>");
            }
        }
    }
}
