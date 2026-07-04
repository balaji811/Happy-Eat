package com.tap.DAOimp;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.tap.DAO.OrdersDAO;
import com.tap.model.Orders;
import com.tap.util.DbConnection;

public class OrdersDAOimp implements OrdersDAO {

    @Override
    public long addOrder(Orders order) {

        long generatedOrderId = -1;

        String query = """
            INSERT INTO orders
            (user_id, restaurant_id, customer_name,
             phone, email, delivery_address,
             payment_method, total_amount, order_status)
            VALUES (?,?,?,?,?,?,?,?,?)
            """;

        try (Connection con = DbConnection.getConnection();
             PreparedStatement pstmt =
                     con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)) {

            pstmt.setInt(1, order.getUserId());
            pstmt.setInt(2, order.getRestaurantId());
            pstmt.setString(3, order.getCustomerName());
            pstmt.setString(4, order.getPhone());
            pstmt.setString(5, order.getEmail());
            pstmt.setString(6, order.getDeliveryAddress());
            pstmt.setString(7, order.getPaymentMethod());
            pstmt.setDouble(8, order.getTotalAmount());
            pstmt.setString(9, order.getOrderStatus());

            pstmt.executeUpdate();

            ResultSet rs = pstmt.getGeneratedKeys();

            if (rs.next()) {
                generatedOrderId = rs.getLong(1);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return generatedOrderId;
    }

    @Override
    public void updateOrder(Orders order) {

        String query =
                "UPDATE orders SET order_status=? WHERE order_id=?";

        try (Connection con = DbConnection.getConnection();
             PreparedStatement pstmt = con.prepareStatement(query)) {

            pstmt.setString(1, order.getOrderStatus());
            pstmt.setLong(2, order.getOrderId());

            pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Orders getOrder(long orderId) {

        String query =
                "SELECT * FROM orders WHERE order_id=?";

        try (Connection con = DbConnection.getConnection();
             PreparedStatement pstmt = con.prepareStatement(query)) {

            pstmt.setLong(1, orderId);

            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                return extractOrder(rs);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    @Override
    public void deleteOrder(long orderId) {

        String query =
                "DELETE FROM orders WHERE order_id=?";

        try (Connection con = DbConnection.getConnection();
             PreparedStatement pstmt = con.prepareStatement(query)) {

            pstmt.setLong(1, orderId);

            pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Orders> getAllOrders() {

        List<Orders> orders = new ArrayList<>();

        String query = "SELECT * FROM orders";

        try (Connection con = DbConnection.getConnection();
             PreparedStatement pstmt = con.prepareStatement(query);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                orders.add(extractOrder(rs));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return orders;
    }

    @Override
    public List<Orders> getOrdersByUser(int userId) {

        List<Orders> orders = new ArrayList<>();

        String query =
                "SELECT * FROM orders WHERE user_id=?";

        try (Connection con = DbConnection.getConnection();
             PreparedStatement pstmt = con.prepareStatement(query)) {

            pstmt.setInt(1, userId);

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                orders.add(extractOrder(rs));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return orders;
    }

    private Orders extractOrder(ResultSet rs) throws SQLException {

        Orders order = new Orders();

        order.setOrderId(rs.getLong("order_id"));
        order.setUserId(rs.getInt("user_id"));
        order.setRestaurantId(rs.getInt("restaurant_id"));
        order.setCustomerName(rs.getString("customer_name"));
        order.setPhone(rs.getString("phone"));
        order.setEmail(rs.getString("email"));
        order.setDeliveryAddress(rs.getString("delivery_address"));
        order.setPaymentMethod(rs.getString("payment_method"));
        order.setTotalAmount(rs.getDouble("total_amount"));
        order.setOrderStatus(rs.getString("order_status"));
        order.setOrderDate(rs.getTimestamp("order_date"));

        return order;
    }
}