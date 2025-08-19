package com.bookshop.dao;

import com.bookshop.dao.interfaces.ProductDAO;
import com.bookshop.model.Product;
import com.bookshop.utils.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductDAOImpl implements ProductDAO {

    @Override
    public boolean createProduct(Product product) {
        String sql = "INSERT INTO products (name, code, brand, cost, price, discount, quantity, category, image) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, product.getName());
            pstmt.setString(2, product.getCode());
            pstmt.setString(3, product.getBrand());
            pstmt.setDouble(4, product.getCost());
            pstmt.setDouble(5, product.getPrice());
            pstmt.setDouble(6, product.getDiscount());
            pstmt.setInt(7, product.getQuantity());
            pstmt.setString(8, product.getCategory());
            pstmt.setString(9, product.getImage()); // Save image URL here

            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public List<Product> getAllProducts() {
        List<Product> productList = new ArrayList<>();
        String sql = "SELECT * FROM products";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                Product product = new Product();
                product.setName(rs.getString("name"));
                product.setCode(rs.getString("code"));
                product.setBrand(rs.getString("brand"));
                product.setCost(rs.getDouble("cost"));
                product.setPrice(rs.getDouble("price"));
                product.setDiscount(rs.getDouble("discount"));
                product.setQuantity(rs.getInt("quantity"));
                product.setCategory(rs.getString("category"));
                product.setImage(rs.getString("image"));

                productList.add(product);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return productList;
    }

    @Override
    public boolean deleteProduct(String productCode) {
        String sql = "DELETE FROM products WHERE code = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, productCode);
            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean productCodeExists(String productCode) {
        String sql = "SELECT COUNT(*) FROM products WHERE code = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, productCode);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0;
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    @Override
    public Product getProductByCode(String productCode) {
        String sql = "SELECT * FROM products WHERE code = ?";
        Product product = null;

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, productCode);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    product = new Product();
                    product.setName(rs.getString("name"));
                    product.setCode(rs.getString("code"));
                    product.setBrand(rs.getString("brand"));
                    product.setCost(rs.getDouble("cost"));
                    product.setPrice(rs.getDouble("price"));
                    product.setDiscount(rs.getDouble("discount"));
                    product.setQuantity(rs.getInt("quantity"));
                    product.setCategory(rs.getString("category"));
                    product.setImage(rs.getString("image"));
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return product;
    }

    @Override
    public boolean updateProduct(Product product) {
        String sql = "UPDATE products SET name = ?, brand = ?, cost = ?, price = ?, discount = ?, quantity = ?, category = ?, image = ? " +
                "WHERE code = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, product.getName());
            pstmt.setString(2, product.getBrand());
            pstmt.setDouble(3, product.getCost());
            pstmt.setDouble(4, product.getPrice());
            pstmt.setDouble(5, product.getDiscount());
            pstmt.setInt(6, product.getQuantity());
            pstmt.setString(7, product.getCategory());
            pstmt.setString(8, product.getImage());
            pstmt.setString(9, product.getCode());

            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public int getTotalProducts() {
        int total = 0;
        try (Connection connection = DBConnection.getConnection()) {
            String sql = "SELECT COUNT(*) FROM products";  // table name "products"
            PreparedStatement stmt = connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                total = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return total;
    }

    @Override
    public boolean reduceQuantity(String productCode, int quantity) throws Exception {
        String sql = "UPDATE products SET quantity = quantity - ? WHERE code = ? AND quantity >= ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, quantity);
            stmt.setString(2, productCode);
            stmt.setInt(3, quantity);

            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0; // false if stock not enough
        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception("Error reducing stock: " + e.getMessage());
        }
    }

}
