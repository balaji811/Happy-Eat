package com.tap.DAO;

import java.util.List;
import com.tap.model.OrderDetails;

public interface OrderDetailsDAO {

    List<OrderDetails> getOrderDetailsByUser(int userId);

}