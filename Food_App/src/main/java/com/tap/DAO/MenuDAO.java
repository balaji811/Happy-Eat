package com.tap.DAO;

import java.util.List;
import com.tap.model.Menu;

public interface MenuDAO {

    void addMenu(Menu m);

    void updateMenu(Menu m);

    Menu getMenu(int menuId);

    void deleteMenu(int menuId);

    List<Menu> allMenus();
    
    List<Menu> getallMenus(int restaurantId);
}