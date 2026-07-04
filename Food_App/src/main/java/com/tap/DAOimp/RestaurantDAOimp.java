package com.tap.DAOimp;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.tap.DAO.RestaurantDAO;
import com.tap.model.Restaurant;
import com.tap.util.DbConnection;

public class RestaurantDAOimp implements RestaurantDAO {

    @Override
    public void addRestaurant(Restaurant r) {

        Connection con = null;

        try {

            con = DbConnection.getConnection();

            String query = "INSERT INTO Restaurant "
                    + "(Name, CuisineType, DeliveryTime, Address, Rating, IsActive, ImagePath) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?)";

            PreparedStatement pst = con.prepareStatement(query);

            pst.setString(1, r.getName());
            pst.setString(2, r.getCuisineType());
            pst.setInt(3, r.getDeliveryTime());
            pst.setString(4, r.getAddress());
            pst.setDouble(5, r.getRating());
            pst.setBoolean(6, r.isActive());
            pst.setString(7, r.getImagePath());

            int rows = pst.executeUpdate();

            System.out.println("Inserted : " + rows);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {

            try {
                if (con != null)
                    con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    public void updateRestaurant(Restaurant r) {

        Connection con = null;

        try {

            con = DbConnection.getConnection();

            String query = "UPDATE Restaurant "
                    + "SET Name=?, CuisineType=?, DeliveryTime=?, "
                    + "Address=?, Rating=?, IsActive=?, ImagePath=? "
                    + "WHERE RestaurantID=?";

            PreparedStatement pst = con.prepareStatement(query);

            pst.setString(1, r.getName());
            pst.setString(2, r.getCuisineType());
            pst.setInt(3, r.getDeliveryTime());
            pst.setString(4, r.getAddress());
            pst.setDouble(5, r.getRating());
            pst.setBoolean(6, r.isActive());
            pst.setString(7, r.getImagePath());
            pst.setInt(8, r.getRestaurantId());

            int rows = pst.executeUpdate();

            System.out.println("Updated : " + rows);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {

            try {
                if (con != null)
                    con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    public Restaurant getRestaurant(int restaurantId) {

        Connection con = null;
        Restaurant restaurant = null;

        try {

            con = DbConnection.getConnection();

            String query =
                    "SELECT * FROM Restaurant WHERE RestaurantID=?";

            PreparedStatement pst =
                    con.prepareStatement(query);

            pst.setInt(1, restaurantId);

            ResultSet rs = pst.executeQuery();

            if (rs.next()) {

                restaurant = new Restaurant();

                restaurant.setRestaurantId(
                        rs.getInt("RestaurantID"));
                restaurant.setName(
                        rs.getString("Name"));
                restaurant.setCuisineType(
                        rs.getString("CuisineType"));
                restaurant.setDeliveryTime(
                        rs.getInt("DeliveryTime"));
                restaurant.setAddress(
                        rs.getString("Address"));
                restaurant.setRating(
                        rs.getDouble("Rating"));
                restaurant.setActive(
                        rs.getBoolean("IsActive"));
                restaurant.setImagePath(
                        rs.getString("ImagePath"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {

            try {
                if (con != null)
                    con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return restaurant;
    }

    @Override
    public void deleteRestaurant(int restaurantId) {

        Connection con = null;

        try {

            con = DbConnection.getConnection();

            String query =
                    "DELETE FROM Restaurant WHERE RestaurantID=?";

            PreparedStatement pst =
                    con.prepareStatement(query);

            pst.setInt(1, restaurantId);

            int rows = pst.executeUpdate();

            System.out.println("Deleted : " + rows);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {

            try {
                if (con != null)
                    con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    public List<Restaurant> allRestaurants() {

        Connection con = null;

        List<Restaurant> restaurants =
                new ArrayList<>();

        try {

            con = DbConnection.getConnection();

            String query = "SELECT * FROM Restaurant";

            Statement st = con.createStatement();

            ResultSet rs = st.executeQuery(query);

            while (rs.next()) {

                Restaurant r = new Restaurant();

                r.setRestaurantId(
                        rs.getInt("RestaurantID"));
                r.setName(
                        rs.getString("Name"));
                r.setCuisineType(
                        rs.getString("CuisineType"));
                r.setDeliveryTime(
                        rs.getInt("DeliveryTime"));
                r.setAddress(
                        rs.getString("Address"));
                r.setRating(
                        rs.getDouble("Rating"));
                r.setActive(
                        rs.getBoolean("IsActive"));
                r.setImagePath(
                        rs.getString("ImagePath"));

                restaurants.add(r);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {

            try {
                if (con != null)
                    con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return restaurants;
    }
}