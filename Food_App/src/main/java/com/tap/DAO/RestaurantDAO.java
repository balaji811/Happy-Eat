package com.tap.DAO;

import java.util.List;
import com.tap.model.Restaurant;

public interface RestaurantDAO {

    void addRestaurant(Restaurant r);

    void updateRestaurant(Restaurant r);

    Restaurant getRestaurant(int restaurantId);

    void deleteRestaurant(int restaurantId);

    List<Restaurant> allRestaurants();
}