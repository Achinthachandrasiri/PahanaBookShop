package com.bookshop.controller;

import com.bookshop.model.User;
import com.bookshop.dao.AuthDAO;
import com.bookshop.dao.ProductDAOImpl;
import com.bookshop.dao.UserDAOImpl;
import com.bookshop.dao.interfaces.ProductDAO;
import com.bookshop.dao.interfaces.UserDAO;
import com.bookshop.service.SaleService;
import com.bookshop.model.Sale;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class AuthServlet extends HttpServlet {
    private AuthDAO authDAO;
    private ProductDAO productDAO;
    private UserDAO userDAO;
    private SaleService saleService;

    @Override
    public void init() throws ServletException {
        authDAO = new AuthDAO();
        productDAO = new ProductDAOImpl();
        userDAO = new UserDAOImpl();
        saleService = new SaleService();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        User user = authDAO.authenticateUser(email, password);

        if (user != null) {
            request.getSession().setAttribute("loggedUser", user);

            // get total products
            int totalProducts = productDAO.getTotalProducts();
            request.getSession().setAttribute("totalProducts", totalProducts);

            // get total users
            int totalUsers = userDAO.getUserCount();
            request.getSession().setAttribute("totalUsers", totalUsers);

            // get total sales and total sale amount
            try {
                List<Sale> salesList = saleService.getAllSales();
                int totalSalesCount = salesList.size();
                double totalSalesAmount = salesList.stream()
                        .mapToDouble(Sale::getTotalAmount)
                        .sum();

                request.getSession().setAttribute("totalSalesCount", totalSalesCount);
                request.getSession().setAttribute("totalSalesAmount", totalSalesAmount);

            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("error", "Error fetching sales data: " + e.getMessage());
                request.getRequestDispatcher("index.jsp").forward(request, response);
                return;
            }

            request.getSession().setAttribute("userEmail", user.getEmail());
            request.getSession().setAttribute("userRole", user.getRole());
            response.sendRedirect("dashboard.jsp");
        } else {
            request.setAttribute("error", "Invalid email or password");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }
}
