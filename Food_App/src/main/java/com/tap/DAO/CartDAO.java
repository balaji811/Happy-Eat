package com.tap.DAO;

import java.util.List;

import com.tap.model.Cart;



public interface CartDAO {
	void addCart(Cart c);

    void updateCart(Cart c);

    Cart getCart(int cartId);

    void deleteCart(int cartId);

    List<Cart> allCart();
    
    List<Cart> getallCart(int userId);
    
    boolean itemExists(int userId, int menuId) ;
    
    void deleteCartByUserAndRestaurant(int userId, int restaurantId);
}
