package com.bookshop.dao.interfaces;

import com.bookshop.model.Sale;
import java.util.List;

public interface SaleDAO {
    void save(Sale sale) throws Exception;
    List<Sale> getAllSales() throws Exception;
}
