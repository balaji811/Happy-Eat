package com.tap.model;

public class Cart {

    private int cartId;
    private int restaurantId;
    private int menuId;
    private String name;
    private double price;
    private int quantity;
    private int userId;
    private String imagePath;

    public Cart() {

    }

    public Cart(int restaurantId, int menuId, String name, double price,
                int quantity, int userId, String imagePath) {
        this.restaurantId = restaurantId;
        this.menuId = menuId;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.userId = userId;
        this.imagePath = imagePath;
    }

    public int getCartId() {
        return cartId;
    }

    public void setCartId(int cartId) {
        this.cartId = cartId;
    }

    public int getRestaurantId() {
        return restaurantId;
    }

    public void setRestaurantId(int restaurantId) {
        this.restaurantId = restaurantId;
    }

    public int getMenuId() {
        return menuId;
    }

    public void setMenuId(int menuId) {
        this.menuId = menuId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    @Override
    public String toString() {
        return "Cart [cartId=" + cartId +
                ", restaurantId=" + restaurantId +
                ", menuId=" + menuId +
                ", name=" + name +
                ", price=" + price +
                ", quantity=" + quantity +
                ", userId=" + userId +
                ", imagePath=" + imagePath + "]";
    }
}