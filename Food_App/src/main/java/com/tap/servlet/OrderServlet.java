package com.tap.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

import com.tap.DAOimp.CartDAOimp;
import com.tap.DAOimp.OrderItemDAOimp;
import com.tap.DAOimp.OrdersDAOimp;
import com.tap.model.Cart;
import com.tap.model.OrderItem;
import com.tap.model.Orders;

/**
 * Servlet implementation class OrderServlet
 */
@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {
	
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	      
		
		String username = request.getParameter("name");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		String city= request.getParameter("city");
		String payment = request.getParameter("payment");
		int restaurantId = Integer.parseInt(request.getParameter("restaurantId"));
	   double amount = Double.parseDouble(request.getParameter("totalAmount"));
	    
	    
	    System.out.println(username + " "+ phone + " "+ email + " "+ address + " "+ city + " "+ payment + " "+ amount);
		
	
		HttpSession session= request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");
		
		
		Orders order = new Orders(userId,restaurantId,username,phone,email,address,payment,amount,"pending");
		
		
		OrdersDAOimp orderDAO = new OrdersDAOimp();

		long orderId = orderDAO.addOrder(order);
		
		

		 CartDAOimp cart = new CartDAOimp();
		  List<Cart> c= cart.getallCart(userId);
		     
		  OrderItemDAOimp items = new OrderItemDAOimp();
		   
		  
		  for(Cart ca: c) {
			  double subtotal = ca.getPrice() * ca.getQuantity();
			  
			  OrderItem o =new OrderItem(orderId,ca.getMenuId(),ca.getQuantity(),ca.getPrice(),subtotal);
			    
			  items.addOrderItem(o);
		  }
		  
		  
		  cart.deleteCartByUser(userId);
		  
		  
                 response.sendRedirect("ViewOrdersServlet");
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
	}

}
