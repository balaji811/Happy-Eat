package com.tap.DAO;

import java.util.List;
import com.tap.model.User;

public interface UserDAO {

    void addUser(User u);

    void updateUser(User u);

    User getUser(int userId);

    void deleteUser(int userId);

    List<User> allUsers();
}