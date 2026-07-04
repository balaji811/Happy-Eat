package com.tap.DAO;

import java.util.List;
import com.tap.model.OrderItem;

public interface OrderItemDAO {

    void addOrderItem(OrderItem orderItem);

    void updateOrderItem(OrderItem orderItem);

    OrderItem getOrderItem(long orderItemId);

    void deleteOrderItem(long orderItemId);

    List<OrderItem> getAllOrderItems();

    List<OrderItem> getOrderItemsByOrderId(long orderId);
}