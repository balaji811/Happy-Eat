package com.tap.DAOimp;

import java.sql.*;
import java.util.*;

import com.tap.DAO.OrderDetailsDAO;
import com.tap.model.OrderDetails;
import com.tap.util.DbConnection;

public class OrderDetailsDAOimp implements OrderDetailsDAO {

    @Override
    public List<OrderDetails> getOrderDetailsByUser(int userId) {

        List<OrderDetails> list = new ArrayList<>();

        try (Connection con = DbConnection.getConnection()) {

            String sql =
                    "SELECT " +
                    "o.order_id, " +
                    "o.customer_name, " +
                    "o.phone, " +
                    "o.email, " +
                    "o.delivery_address, " +
                    "o.payment_method, " +
                    "o.total_amount, " +
                    "o.order_status, " +
                    "o.order_date, " +
                    "r.restaurantID, " +
                    "r.name AS restaurant_name, " +

                    "GROUP_CONCAT(" +
                    "CONCAT(m.ItemName, ' (Qty: ', oi.quantity, ')') " +
                    "SEPARATOR ', ') AS ordered_items " +

                    "FROM Orders o " +

                    "JOIN order_items oi " +
                    "ON o.order_id = oi.order_id " +

                    "JOIN Menu m " +
                    "ON oi.menu_id = m.menuID " +

                    "JOIN Restaurant r " +
                    "ON o.restaurant_id = r.restaurantID " +

                    "WHERE o.user_id = ? " +

                    "GROUP BY " +
                    "o.order_id, " +
                    "o.customer_name, " +
                    "o.phone, " +
                    "o.email, " +
                    "o.delivery_address, " +
                    "o.payment_method, " +
                    "o.total_amount, " +
                    "o.order_status, " +
                    "o.order_date, " +
                    "r.restaurantID, " +
                    "r.name " +

                    "ORDER BY o.order_date DESC";

            PreparedStatement pst = con.prepareStatement(sql);
            pst.setInt(1, userId);

            ResultSet rs = pst.executeQuery();

            while (rs.next()) {

                OrderDetails od = new OrderDetails();

                od.setOrderId(rs.getLong("order_id"));
                od.setCustomerName(rs.getString("customer_name"));
                od.setPhone(rs.getString("phone"));
                od.setEmail(rs.getString("email"));
                od.setDeliveryAddress(rs.getString("delivery_address"));
                od.setPaymentMethod(rs.getString("payment_method"));
                od.setTotalAmount(rs.getDouble("total_amount"));
                od.setOrderStatus(rs.getString("order_status"));
                od.setOrderDate(rs.getTimestamp("order_date"));

                od.setRestaurantId(rs.getInt("restaurantID"));
                od.setRestaurantName(rs.getString("restaurant_name"));

         
                od.setOrderedItems(rs.getString("ordered_items"));

                list.add(od);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}