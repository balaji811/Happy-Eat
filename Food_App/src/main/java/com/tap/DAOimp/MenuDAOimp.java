package com.tap.DAOimp;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.tap.DAO.MenuDAO;
import com.tap.model.Menu;
import com.tap.util.DbConnection;

public class MenuDAOimp implements MenuDAO {

    @Override
    public void addMenu(Menu m) {

        try (Connection con = DbConnection.getConnection()) {

            String query =
            "INSERT INTO Menu(RestaurantID, ItemName, Description, Price, IsAvailable, ImagePath, FoodType) VALUES(?,?,?,?,?,?,?)";

            PreparedStatement pst = con.prepareStatement(query);

            pst.setInt(1, m.getRestaurantId());
            pst.setString(2, m.getItemName());
            pst.setString(3, m.getDescription());
            pst.setDouble(4, m.getPrice());
            pst.setBoolean(5, m.isAvailable());
            pst.setString(6, m.getImagePath());
            pst.setString(7, m.getFoodType());

            System.out.println("Inserted : " + pst.executeUpdate());

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void updateMenu(Menu m) {

        try (Connection con = DbConnection.getConnection()) {

            String query =
            "UPDATE Menu SET ItemName=?, Description=?, Price=?, IsAvailable=?, ImagePath=?, FoodType=? WHERE MenuID=?";

            PreparedStatement pst = con.prepareStatement(query);

            pst.setString(1, m.getItemName());
            pst.setString(2, m.getDescription());
            pst.setDouble(3, m.getPrice());
            pst.setBoolean(4, m.isAvailable());
            pst.setString(5, m.getImagePath());
            pst.setString(6, m.getFoodType());
            pst.setInt(7, m.getMenuId());

            System.out.println("Updated : " + pst.executeUpdate());

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public Menu getMenu(int menuId) {

        Menu m = null;

        try (Connection con = DbConnection.getConnection()) {

            String query = "SELECT * FROM Menu WHERE MenuID=?";

            PreparedStatement pst = con.prepareStatement(query);

            pst.setInt(1, menuId);

            ResultSet rs = pst.executeQuery();

            if (rs.next()) {

                m = new Menu();

                m.setMenuId(rs.getInt("MenuID"));
                m.setRestaurantId(rs.getInt("RestaurantID"));
                m.setItemName(rs.getString("ItemName"));
                m.setDescription(rs.getString("Description"));
                m.setPrice(rs.getDouble("Price"));
                m.setAvailable(rs.getBoolean("IsAvailable"));
                m.setImagePath(rs.getString("ImagePath"));
                m.setFoodType(rs.getString("FoodType"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return m;
    }

    @Override
    public void deleteMenu(int menuId) {

        try (Connection con = DbConnection.getConnection()) {

            String query = "DELETE FROM Menu WHERE MenuID=?";

            PreparedStatement pst = con.prepareStatement(query);

            pst.setInt(1, menuId);

            System.out.println("Deleted : " + pst.executeUpdate());

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Menu> allMenus() {

        List<Menu> menus = new ArrayList<>();

        try (Connection con = DbConnection.getConnection()) {

            String query = "SELECT * FROM Menu";

            Statement st = con.createStatement();

            ResultSet rs = st.executeQuery(query);

            while (rs.next()) {

                Menu m = new Menu();

                m.setMenuId(rs.getInt("MenuID"));
                m.setRestaurantId(rs.getInt("RestaurantID"));
                m.setItemName(rs.getString("ItemName"));
                m.setDescription(rs.getString("Description"));
                m.setPrice(rs.getDouble("Price"));
                m.setAvailable(rs.getBoolean("IsAvailable"));
                m.setImagePath(rs.getString("ImagePath"));
                m.setFoodType(rs.getString("FoodType"));

                menus.add(m);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return menus;
    }

    @Override
    public List<Menu> getallMenus(int resturantId) {

        List<Menu> menus = new ArrayList<>();

        try (Connection con = DbConnection.getConnection()) {

            String query = "SELECT * FROM Menu WHERE RestaurantID = ?";

            PreparedStatement pst = con.prepareStatement(query);
            pst.setInt(1, resturantId);

            ResultSet rs = pst.executeQuery();

            while (rs.next()) {

                Menu m = new Menu();

                m.setMenuId(rs.getInt("MenuID"));
                m.setRestaurantId(rs.getInt("RestaurantID"));
                m.setItemName(rs.getString("ItemName"));
                m.setDescription(rs.getString("Description"));
                m.setPrice(rs.getDouble("Price"));
                m.setAvailable(rs.getBoolean("IsAvailable"));
                m.setImagePath(rs.getString("ImagePath"));
                m.setFoodType(rs.getString("FoodType"));

                menus.add(m);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return menus;
    }
}