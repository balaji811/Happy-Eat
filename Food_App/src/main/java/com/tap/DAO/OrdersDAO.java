package com.tap.DAO;

import java.util.List;
import com.tap.model.Orders;

public interface OrdersDAO {

    long addOrder(Orders order);

    void updateOrder(Orders order);

    Orders getOrder(long orderId);

    void deleteOrder(long orderId);

    List<Orders> getAllOrders();

    List<Orders> getOrdersByUser(int userId);
}