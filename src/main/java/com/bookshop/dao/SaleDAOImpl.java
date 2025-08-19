package com.bookshop.dao;

import com.bookshop.model.Sale;
import com.bookshop.dao.interfaces.SaleDAO;
import com.bookshop.utils.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class SaleDAOImpl implements SaleDAO {

    @Override
    public void save(Sale sale) throws Exception {
        String sql = "INSERT INTO sales (invoice_number, total_amount, paid_amount, balance, customer_name, account_no) " +
                "VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, sale.getInvoiceNumber());
            stmt.setDouble(2, sale.getTotalAmount());
            stmt.setDouble(3, sale.getPaidAmount());
            stmt.setDouble(4, sale.getBalance());
            stmt.setString(5, sale.getCustomerName());
            stmt.setInt(6, sale.getAccountNo());

            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception("Error saving sale: " + e.getMessage());
        }
    }

    public List<Sale> getAllSales() throws Exception {
        List<Sale> salesList = new ArrayList<>();
        String sql = "SELECT * FROM sales";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Sale sale = new Sale();
                sale.setInvoiceNumber(rs.getString("invoice_number"));
                sale.setTotalAmount(rs.getDouble("total_amount"));
                sale.setPaidAmount(rs.getDouble("paid_amount"));
                sale.setBalance(rs.getDouble("balance"));
                sale.setCustomerName(rs.getString("customer_name"));
                sale.setAccountNo(rs.getInt("account_no"));

                salesList.add(sale);
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception("Error fetching sales: " + e.getMessage());
        }

        return salesList;
    }
}
