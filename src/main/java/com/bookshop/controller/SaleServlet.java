package com.bookshop.controller;

import com.bookshop.model.Sale;
import com.bookshop.model.Product;
import com.bookshop.service.SaleService;
import com.bookshop.service.ProductService;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class SaleServlet extends HttpServlet {

    private final SaleService saleService = new SaleService();
    private final ProductService productService = new ProductService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            // Get sale form parameters
            String invoiceNumber = request.getParameter("invoiceNumber");
            double totalAmount = Double.parseDouble(request.getParameter("totalAmount"));
            double paidAmount = Double.parseDouble(request.getParameter("paidAmount"));
            double balance = Double.parseDouble(request.getParameter("balanceAmount"));
            String customerName = request.getParameter("customerName");
            int accountNo = Integer.parseInt(request.getParameter("accountNo"));

            // Create Sale object
            Sale sale = new Sale(invoiceNumber, totalAmount, paidAmount, balance, customerName, accountNo);

            // Save sale
            saleService.saveSale(sale);

            // Get product codes and quantities
            String productCodesStr = request.getParameter("productCodes"); // e.g., "P001,P002"
            String quantitiesStr = request.getParameter("quantities");     // e.g., "2,1"

            if (productCodesStr != null && quantitiesStr != null) {
                String[] codes = productCodesStr.split(",");
                String[] qtys = quantitiesStr.split(",");

                for (int i = 0; i < codes.length; i++) {
                    String code = codes[i].trim();
                    int qty = Integer.parseInt(qtys[i].trim());

                    // Reduce product quantity in the database
                    Product product = productService.getProductByCode(code);
                    if (product != null) {
                        int newQty = product.getQuantity() - qty;
                        if (newQty < 0) newQty = 0; // prevent negative stock
                        product.setQuantity(newQty);
                        productService.updateProduct(product);
                    }
                }
            }

            // Redirect to billing page with success message
            response.sendRedirect("billing.jsp?success=1");

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error processing sale: " + e.getMessage());
            request.getRequestDispatcher("billing.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            List<Sale> sales = saleService.getAllSales();
            request.setAttribute("salesList", sales);
            request.getRequestDispatcher("sales.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error fetching sales: " + e.getMessage());
            request.getRequestDispatcher("sales.jsp").forward(request, response);
        }
    }
}
