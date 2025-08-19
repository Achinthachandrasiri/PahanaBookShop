package com.bookshop.dao.interfaces;

import com.bookshop.model.Product;
import java.util.List;

public interface ProductDAO {
    boolean createProduct(Product product);
    List<Product> getAllProducts();
    boolean deleteProduct(String productCode);
    boolean productCodeExists(String productCode);
    Product getProductByCode(String productCode);
    boolean updateProduct(Product product);
    int getTotalProducts();
    boolean reduceQuantity(String productCode, int quantity) throws Exception;

}
