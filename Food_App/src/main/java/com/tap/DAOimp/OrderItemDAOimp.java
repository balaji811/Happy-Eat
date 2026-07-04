package com.tap.DAOimp;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.tap.DAO.OrderItemDAO;
import com.tap.model.OrderItem;
import com.tap.util.DbConnection;

public class OrderItemDAOimp implements OrderItemDAO {

    @Override
    public void addOrderItem(OrderItem orderItem) {

        String query = """
                INSERT INTO order_items
                (order_id, menu_id, quantity, price, subtotal)
                VALUES (?, ?, ?, ?, ?)
                """;

        try (Connection con = DbConnection.getConnection();
             PreparedStatement pstmt = con.prepareStatement(query)) {

            pstmt.setLong(1, orderItem.getOrderId());
            pstmt.setInt(2, orderItem.getMenuId());
            pstmt.setInt(3, orderItem.getQuantity());
            pstmt.setDouble(4, orderItem.getPrice());
            pstmt.setDouble(5, orderItem.getSubtotal());

            pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void updateOrderItem(OrderItem orderItem) {

        String query = """
                UPDATE order_items
                SET quantity=?, price=?, subtotal=?
                WHERE order_item_id=?
                """;

        try (Connection con = DbConnection.getConnection();
             PreparedStatement pstmt = con.prepareStatement(query)) {

            pstmt.setInt(1, orderItem.getQuantity());
            pstmt.setDouble(2, orderItem.getPrice());
            pstmt.setDouble(3, orderItem.getSubtotal());
            pstmt.setLong(4, orderItem.getOrderItemId());

            pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public OrderItem getOrderItem(long orderItemId) {

        String query =
                "SELECT * FROM order_items WHERE order_item_id=?";

        try (Connection con = DbConnection.getConnection();
             PreparedStatement pstmt = con.prepareStatement(query)) {

            pstmt.setLong(1, orderItemId);

            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                return extractOrderItem(rs);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    @Override
    public void deleteOrderItem(long orderItemId) {

        String query =
                "DELETE FROM order_items WHERE order_item_id=?";

        try (Connection con = DbConnection.getConnection();
             PreparedStatement pstmt = con.prepareStatement(query)) {

            pstmt.setLong(1, orderItemId);

            pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<OrderItem> getAllOrderItems() {

        List<OrderItem> items = new ArrayList<>();

        String query = "SELECT * FROM order_items";

        try (Connection con = DbConnection.getConnection();
             PreparedStatement pstmt = con.prepareStatement(query);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                items.add(extractOrderItem(rs));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return items;
    }

    @Override
    public List<OrderItem> getOrderItemsByOrderId(long orderId) {

        List<OrderItem> items = new ArrayList<>();

        String query =
                "SELECT * FROM order_items WHERE order_id=?";

        try (Connection con = DbConnection.getConnection();
             PreparedStatement pstmt = con.prepareStatement(query)) {

            pstmt.setLong(1, orderId);

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                items.add(extractOrderItem(rs));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return items;
    }

    private OrderItem extractOrderItem(ResultSet rs)
            throws SQLException {

        OrderItem item = new OrderItem();

        item.setOrderItemId(rs.getLong("order_item_id"));
        item.setOrderId(rs.getLong("order_id"));
        item.setMenuId(rs.getInt("menu_id"));
        item.setQuantity(rs.getInt("quantity"));
        item.setPrice(rs.getDouble("price"));
        item.setSubtotal(rs.getDouble("subtotal"));

        return item;
    }
}