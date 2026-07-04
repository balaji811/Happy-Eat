package com.tap.DAOimp;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.tap.DAO.CartDAO;
import com.tap.model.Cart;
import com.tap.util.DbConnection;

public class CartDAOimp implements CartDAO {

    @Override
    public void addCart(Cart c) {

        try (Connection con = DbConnection.getConnection()) {

            String query =
                "INSERT INTO cart(restaurant_id, name, price, quantity, user_id, imagePath, menu_id) VALUES(?,?,?,?,?,?,?)";

            PreparedStatement pst = con.prepareStatement(query);

            pst.setInt(1, c.getRestaurantId());
            pst.setString(2, c.getName());
            pst.setDouble(3, c.getPrice());
            pst.setInt(4, c.getQuantity());
            pst.setInt(5, c.getUserId());
            pst.setString(6, c.getImagePath());
            pst.setInt(7, c.getMenuId());

            System.out.println("Inserted : " + pst.executeUpdate());

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void updateCart(Cart c) {

        try (Connection con = DbConnection.getConnection()) {

            String query =
                "UPDATE cart SET restaurant_id=?, name=?, price=?, quantity=?, user_id=?, imagePath=?, menu_id=? WHERE cart_id=?";

            PreparedStatement pst = con.prepareStatement(query);

            pst.setInt(1, c.getRestaurantId());
            pst.setString(2, c.getName());
            pst.setDouble(3, c.getPrice());
            pst.setInt(4, c.getQuantity());
            pst.setInt(5, c.getUserId());
            pst.setString(6, c.getImagePath());
            pst.setInt(7, c.getMenuId());
            pst.setInt(8, c.getCartId());

            System.out.println("Updated : " + pst.executeUpdate());

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public Cart getCart(int cartId) {

        Cart c = null;

        try (Connection con = DbConnection.getConnection()) {

            String query = "SELECT * FROM cart WHERE cart_id=?";

            PreparedStatement pst = con.prepareStatement(query);
            pst.setInt(1, cartId);

            ResultSet rs = pst.executeQuery();

            if (rs.next()) {

                c = new Cart();

                c.setCartId(rs.getInt("cart_id"));
                c.setRestaurantId(rs.getInt("restaurant_id"));
                c.setName(rs.getString("name"));
                c.setPrice(rs.getDouble("price"));
                c.setQuantity(rs.getInt("quantity"));
                c.setUserId(rs.getInt("user_id"));
                c.setImagePath(rs.getString("imagePath"));
                c.setMenuId(rs.getInt("menu_id"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return c;
    }

    @Override
    public void deleteCart(int cartId) {

        try (Connection con = DbConnection.getConnection()) {

            String query = "DELETE FROM cart WHERE cart_id=?";

            PreparedStatement pst = con.prepareStatement(query);
            pst.setInt(1, cartId);

            System.out.println("Deleted : " + pst.executeUpdate());

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Cart> allCart() {

        List<Cart> carts = new ArrayList<>();

        try (Connection con = DbConnection.getConnection()) {

            String query = "SELECT * FROM cart";

            Statement st = con.createStatement();

            ResultSet rs = st.executeQuery(query);

            while (rs.next()) {

                Cart c = new Cart();

                c.setCartId(rs.getInt("cart_id"));
                c.setRestaurantId(rs.getInt("restaurant_id"));
                c.setName(rs.getString("name"));
                c.setPrice(rs.getDouble("price"));
                c.setQuantity(rs.getInt("quantity"));
                c.setUserId(rs.getInt("user_id"));
                c.setImagePath(rs.getString("imagePath"));
                c.setMenuId(rs.getInt("menu_id"));

                carts.add(c);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return carts;
    }

    @Override
    public List<Cart> getallCart(int userId) {

        List<Cart> carts = new ArrayList<>();

        try (Connection con = DbConnection.getConnection()) {

            String query = "SELECT * FROM cart WHERE user_id=?";

            PreparedStatement pst = con.prepareStatement(query);
            pst.setInt(1, userId);

            ResultSet rs = pst.executeQuery();

            while (rs.next()) {

                Cart c = new Cart();

                c.setCartId(rs.getInt("cart_id"));
                c.setRestaurantId(rs.getInt("restaurant_id"));
                c.setName(rs.getString("name"));
                c.setPrice(rs.getDouble("price"));
                c.setQuantity(rs.getInt("quantity"));
                c.setUserId(rs.getInt("user_id"));
                c.setImagePath(rs.getString("imagePath"));
                c.setMenuId(rs.getInt("menu_id"));

                carts.add(c);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return carts;
    }

    @Override
    public boolean itemExists(int userId, int menuId) {

        try (Connection con = DbConnection.getConnection()) {

            String query =
                "SELECT COUNT(*) FROM cart WHERE user_id=? AND menu_id=?";

            PreparedStatement pst = con.prepareStatement(query);

            pst.setInt(1, userId);
            pst.setInt(2, menuId);

            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                return rs.getInt(1) > 0;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }
    
    
    @Override
    public void deleteCartByUserAndRestaurant(int userId, int restaurantId) {
        String sql = "DELETE FROM cart WHERE user_id = ? AND restaurant_id = ?";

        try (Connection con = DbConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, userId);
            ps.setInt(2, restaurantId);

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public Integer getRestaurantIdByUser(int userId) {
        String sql = "SELECT restaurant_id FROM cart WHERE user_id = ? LIMIT 1";

        try (Connection con = DbConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, userId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return rs.getInt("restaurant_id");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }
    
    public void deleteCartByUser(int userId) {

        String query = "DELETE FROM cart WHERE user_id = ?";

        try (
            Connection con = DbConnection.getConnection();
            PreparedStatement pstmt = con.prepareStatement(query)
        ) {

            pstmt.setInt(1, userId);
            pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    
    public Cart getCartByUserAndMenu(int userId, int menuId) {

        String sql =
            "SELECT * FROM cart WHERE user_id=? AND menu_id=?";

        Cart cart = null;

        try(Connection con = DbConnection.getConnection();
            PreparedStatement pstmt = con.prepareStatement(sql)) {

            pstmt.setInt(1, userId);
            pstmt.setInt(2, menuId);

            ResultSet rs = pstmt.executeQuery();

            if(rs.next()) {

                cart = new Cart();

                cart.setCartId(rs.getInt("cart_id"));
                cart.setRestaurantId(rs.getInt("restaurant_id"));
                cart.setMenuId(rs.getInt("menu_id"));
                cart.setName(rs.getString("name"));
                cart.setPrice(rs.getDouble("price"));
                cart.setQuantity(rs.getInt("quantity"));
                cart.setUserId(rs.getInt("user_id"));
                cart.setImagePath(rs.getString("imagepath"));
            }

        } catch(Exception e) {
            e.printStackTrace();
        }

        return cart;
    }
    
}