package com.bookshop.service;

import com.bookshop.dao.ProductDAOImpl;
import com.bookshop.model.Product;
import java.util.List;

public class ProductService {

    private final ProductDAOImpl productDAO;

    public ProductService() {
        this.productDAO = new ProductDAOImpl();
    }

    public boolean createProduct(Product product) {
        validateProduct(product);
        if (productDAO.productCodeExists(product.getCode())) {
            throw new IllegalArgumentException("Product code '" + product.getCode() + "' already exists.");
        }

        return productDAO.createProduct(product);
    }


    public List<Product> getAllProducts() {
        return productDAO.getAllProducts();
    }

    public boolean deleteProduct(String productCode) {
        if (isNullOrEmpty(productCode)) {
            throw new IllegalArgumentException("Product code is required for deletion.");
        }

        boolean deleted = productDAO.deleteProduct(productCode);
        if (!deleted) {
            throw new IllegalArgumentException("Product with code " + productCode + " does not exist.");
        }
        return true;
    }

    public Product getProductByCode(String productCode) {
        if (isNullOrEmpty(productCode)) {
            throw new IllegalArgumentException("Product code is required.");
        }
        Product product = productDAO.getProductByCode(productCode);
        if (product == null) {
            throw new IllegalArgumentException("Product with code " + productCode + " does not exist.");
        }
        return product;
    }

    public boolean updateProduct(Product product) {
        validateProduct(product);
        if (!productDAO.productCodeExists(product.getCode())) {
            throw new IllegalArgumentException("Cannot update. Product code '" + product.getCode() + "' does not exist.");
        }
        return productDAO.updateProduct(product);
    }

    private void validateProduct(Product product) {
        // Required String fields
        if (isNullOrEmpty(product.getName())) {
            throw new IllegalArgumentException("Product name is required.");
        }
        if (isNullOrEmpty(product.getCode())) {
            throw new IllegalArgumentException("Product code is required.");
        }
        if (isNullOrEmpty(product.getBrand())) {
            throw new IllegalArgumentException("Brand is required.");
        }
        if (isNullOrEmpty(product.getCategory())) {
            throw new IllegalArgumentException("Category is required.");
        }
        try {
            Integer.parseInt(product.getCode());
        } catch (NumberFormatException e) {
            throw new IllegalArgumentException("Product code must be a number.");
        }

        // Numeric fields must be positive
        if (product.getCost() <= 0) {
            throw new IllegalArgumentException("Cost must be a positive number.");
        }
        if (product.getPrice() <= 0) {
            throw new IllegalArgumentException("Price must be a positive number.");
        }
        if (product.getDiscount() < 0) { // Discount can be 0
            throw new IllegalArgumentException("Discount cannot be negative.");
        }
        if (product.getQuantity() < 0) { // Quantity can be 0
            throw new IllegalArgumentException("Quantity cannot be negative.");
        }
    }

    public boolean reduceProductQuantity(String productCode, int quantity) throws Exception {
        return productDAO.reduceQuantity(productCode, quantity);
    }

    private boolean isNullOrEmpty(String str) {
        return str == null || str.trim().isEmpty();
    }
}
