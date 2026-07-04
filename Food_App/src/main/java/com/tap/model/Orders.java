package com.tap.model;

import java.sql.Timestamp;

public class Orders {

    private long orderId;
    private int userId;
    private int restaurantId;
    private String customerName;
    private String phone;
    private String email;
    private String deliveryAddress;
    private String paymentMethod;
    private double totalAmount;
    private String orderStatus;
    private Timestamp orderDate;

    public Orders() {
    }

    public Orders(int userId, int restaurantId, String customerName,
                  String phone, String email, String deliveryAddress,
                  String paymentMethod, double totalAmount,
                  String orderStatus) {

        this.userId = userId;
        this.restaurantId = restaurantId;
        this.customerName = customerName;
        this.phone = phone;
        this.email = email;
        this.deliveryAddress = deliveryAddress;
        this.paymentMethod = paymentMethod;
        this.totalAmount = totalAmount;
        this.orderStatus = orderStatus;
    }

    public long getOrderId() {
        return orderId;
    }

    public void setOrderId(long orderId) {
        this.orderId = orderId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getRestaurantId() {
        return restaurantId;
    }

    public void setRestaurantId(int restaurantId) {
        this.restaurantId = restaurantId;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDeliveryAddress() {
        return deliveryAddress;
    }

    public void setDeliveryAddress(String deliveryAddress) {
        this.deliveryAddress = deliveryAddress;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }

    public String getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(String orderStatus) {
        this.orderStatus = orderStatus;
    }

    public Timestamp getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Timestamp orderDate) {
        this.orderDate = orderDate;
    }

	@Override
	public String toString() {
		return "Orders [orderId=" + orderId + ", userId=" + userId + ", restaurantId=" + restaurantId
				+ ", customerName=" + customerName + ", phone=" + phone + ", email=" + email + ", deliveryAddress="
				+ deliveryAddress + ", paymentMethod=" + paymentMethod + ", totalAmount=" + totalAmount
				+ ", orderStatus=" + orderStatus + ", orderDate=" + orderDate + "]";
	}
    
    
}