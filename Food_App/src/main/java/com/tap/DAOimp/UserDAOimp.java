package com.tap.DAOimp;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.tap.DAO.UserDAO;
import com.tap.model.User;
import com.tap.util.DbConnection;

public class UserDAOimp implements UserDAO {

    @Override
    public void addUser(User u) {

        Connection con = null;

        try {
            con = DbConnection.getConnection();

            String query = "INSERT INTO user "
                    + "(Username, Password, Email, Role, CreatedDate, LastLoginDate) "
                    + "VALUES (?, ?, ?, ?, ?, ?)";

            PreparedStatement pst = con.prepareStatement(query);

            pst.setString(1, u.getUserName());
            pst.setString(2, u.getPassword());
            pst.setString(3, u.getEmail());
            pst.setString(4, u.getRole());

            Timestamp currentTime =
                    new Timestamp(System.currentTimeMillis());

            pst.setTimestamp(5, currentTime);
            pst.setTimestamp(6, currentTime);

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
    public void updateUser(User u) {

        Connection con = null;

        try {

            con = DbConnection.getConnection();

            String query = "UPDATE user SET "
                    + "Username=?, "
                    + "Password=?, "
                    + "Email=?, "
                    + "Address=?, "
                    + "Role=?, "
                    + "LastLoginDate=? "
                    + "WHERE UserID=?";

            PreparedStatement pst = con.prepareStatement(query);

            pst.setString(1, u.getUserName());
            pst.setString(2, u.getPassword());
            pst.setString(3, u.getEmail());
            pst.setString(4, u.getAddress());
            pst.setString(5, u.getRole());
            pst.setTimestamp(6, new Timestamp(System.currentTimeMillis()));
            pst.setInt(7, u.getUserId());

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
    public User getUser(int userId) {

        Connection con = null;
        User user = null;

        try {

            con = DbConnection.getConnection();

            String query =
                    "SELECT * FROM user WHERE UserID=?";

            PreparedStatement pst =
                    con.prepareStatement(query);

            pst.setInt(1, userId);

            ResultSet rs = pst.executeQuery();

            if (rs.next()) {

                user = new User();

                user.setUserId(rs.getInt("UserID"));
                user.setUserName(rs.getString("Username"));
                user.setPassword(rs.getString("Password"));
                user.setEmail(rs.getString("Email"));
                user.setAddress(rs.getString("Address"));
                user.setRole(rs.getString("Role"));
                user.setCreatedDate(rs.getTimestamp("CreatedDate"));
                user.setLastLoginDate(rs.getTimestamp("LastLoginDate"));
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

        return user;
    }

    @Override
    public void deleteUser(int userId) {

        Connection con = null;

        try {

            con = DbConnection.getConnection();

            String query =
                    "DELETE FROM user WHERE UserID=?";

            PreparedStatement pst =
                    con.prepareStatement(query);

            pst.setInt(1, userId);

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
    public List<User> allUsers() {

        Connection con = null;

        List<User> users = new ArrayList<>();

        try {

            con = DbConnection.getConnection();

            String query = "SELECT * FROM user";

            Statement st = con.createStatement();

            ResultSet rs = st.executeQuery(query);

            while (rs.next()) {

                User u = new User();

                u.setUserId(rs.getInt("UserID"));
                u.setUserName(rs.getString("Username"));
                u.setPassword(rs.getString("Password"));
                u.setEmail(rs.getString("Email"));
                u.setRole(rs.getString("Role"));
                u.setCreatedDate(rs.getTimestamp("CreatedDate"));
                u.setLastLoginDate(rs.getTimestamp("LastLoginDate"));

                users.add(u);
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

        return users;
    }
}