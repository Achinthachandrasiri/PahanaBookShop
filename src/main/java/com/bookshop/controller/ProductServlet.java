package com.bookshop.controller;

import com.bookshop.model.Product;
import com.bookshop.service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.List;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 1, // 1MB
        maxFileSize = 1024 * 1024 * 10,     // 10MB
        maxRequestSize = 1024 * 1024 * 15) // 15MB
public class ProductServlet extends HttpServlet {

    private static final String UPLOAD_DIR = "uploads";
    private final ProductService productService = new ProductService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String path = req.getServletPath();
        switch (path) {
            case "/saveProduct":
                handleSaveProduct(req, resp);
                break;
            case "/updateProduct":
                handleUpdateProduct(req, resp);
                break;
            case "/deleteProduct":
                handleDeleteProduct(req, resp);
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
            case "/viewProducts":
                handleViewProducts(req, resp);
                break;
            case "/editProduct":
                handleEditProduct(req, resp);
                break;
            default:
                resp.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }

    private void handleSaveProduct(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            // Get product fields
            String name = request.getParameter("name");
            String code = request.getParameter("code");
            String brand = request.getParameter("brand");
            double cost = Double.parseDouble(request.getParameter("cost"));
            double price = Double.parseDouble(request.getParameter("price"));
            double discount = Double.parseDouble(request.getParameter("discount"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            String category = request.getParameter("category");

            // Handle image upload
            Part filePart = request.getPart("image");
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            String applicationPath = request.getServletContext().getRealPath("");
            String uploadPath = applicationPath + File.separator + UPLOAD_DIR;

            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) uploadDir.mkdirs();

            String filePath = uploadPath + File.separator + fileName;
            filePart.write(filePath);

            String imageUrl = UPLOAD_DIR + "/" + fileName;

            Product product = new Product(name, code, brand, cost, price, discount, quantity, category, imageUrl);

            boolean success = productService.createProduct(product);

            if (success) {
                request.setAttribute("message", "Product added successfully!");
            } else {
                request.setAttribute("error", "Failed to add product.");
            }

        } catch (IllegalArgumentException e) {
            request.setAttribute("error", e.getMessage());
        } catch (Exception e) {
            request.setAttribute("error", "Unexpected error: " + e.getMessage());
            e.printStackTrace();
        }

        request.getRequestDispatcher("/createProduct.jsp").forward(request, response);
    }

    private void handleViewProducts(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Product> productList = productService.getAllProducts();
        request.setAttribute("products", productList);
        request.getRequestDispatcher("/viewProducts.jsp").forward(request, response);
    }

    private void handleDeleteProduct(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String productCode = request.getParameter("code");

        try {
            boolean deleted = productService.deleteProduct(productCode);
            if (deleted) {
                request.setAttribute("message", "Product deleted successfully!");
            }
        } catch (IllegalArgumentException e) {
            request.setAttribute("error", e.getMessage());
        } catch (Exception e) {
            request.setAttribute("error", "Unexpected error: " + e.getMessage());
            e.printStackTrace();
        }

        // Redirect or forward back to the products view
        List<Product> productList = productService.getAllProducts();
        request.setAttribute("products", productList);
        request.getRequestDispatcher("/viewProducts.jsp").forward(request, response);
    }

    private void handleEditProduct(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String productCode = request.getParameter("code");

        try {
            Product product = productService.getProductByCode(productCode);
            request.setAttribute("product", product);
            request.getRequestDispatcher("/editProduct.jsp").forward(request, response);
        } catch (IllegalArgumentException e) {
            request.setAttribute("error", e.getMessage());
            request.getRequestDispatcher("/viewProducts.jsp").forward(request, response);
        }
    }

    private void handleUpdateProduct(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String name = request.getParameter("name");
            String code = request.getParameter("code");
            String brand = request.getParameter("brand");
            double cost = Double.parseDouble(request.getParameter("cost"));
            double price = Double.parseDouble(request.getParameter("price"));
            double discount = Double.parseDouble(request.getParameter("discount"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            String category = request.getParameter("category");

            Part filePart = request.getPart("image");
            String imageUrl = null;

            if (filePart != null && filePart.getSize() > 0) {
                String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
                String applicationPath = request.getServletContext().getRealPath("");
                String uploadPath = applicationPath + File.separator + UPLOAD_DIR;

                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) uploadDir.mkdirs();

                String filePath = uploadPath + File.separator + fileName;
                filePart.write(filePath);

                imageUrl = UPLOAD_DIR + "/" + fileName;
            }

            Product existingProduct = productService.getProductByCode(code);
            if (imageUrl == null) {
                imageUrl = existingProduct.getImage();
            }

            Product updatedProduct = new Product(name, code, brand, cost, price, discount, quantity, category, imageUrl);
            boolean success = productService.updateProduct(updatedProduct);

            if (success) {
                request.setAttribute("message", "Product updated successfully!");
            } else {
                request.setAttribute("error", "Failed to update product.");
            }

        } catch (IllegalArgumentException e) {
            request.setAttribute("error", e.getMessage());
        } catch (Exception e) {
            request.setAttribute("error", "Unexpected error: " + e.getMessage());
            e.printStackTrace();
        }

        request.getRequestDispatcher("/editProduct.jsp").forward(request, response);
    }
}
