package com.bookshop.service;

import com.bookshop.dao.SaleDAOImpl;
import com.bookshop.dao.interfaces.SaleDAO;
import com.bookshop.model.Sale;
import java.util.List;

public class SaleService {

    private final SaleDAO saleDAO;

    public SaleService() {
        this.saleDAO = new SaleDAOImpl();
    }

    // Constructor to inject DAO (for testing or flexibility)
    public SaleService(SaleDAO saleDAO) {
        this.saleDAO = saleDAO;
    }

    // Save a sale
    public void saveSale(Sale sale) throws Exception {
        // Optional: you could add validation here
        if (sale.getInvoiceNumber() == null || sale.getInvoiceNumber().isEmpty()) {
            throw new Exception("Invoice number cannot be empty");
        }
        saleDAO.save(sale);
    }

    public List<Sale> getAllSales() throws Exception {
        return saleDAO.getAllSales();
    }
}
