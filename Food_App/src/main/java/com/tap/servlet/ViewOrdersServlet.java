package com.tap.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

import com.tap.DAOimp.OrderDetailsDAOimp;
import com.tap.DAOimp.OrdersDAOimp;
import com.tap.model.OrderDetails;
import com.tap.model.Orders;

/**
 * Servlet implementation class ViewOrdersServlet
 */
@WebServlet("/ViewOrdersServlet")
public class ViewOrdersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 

		HttpSession session= request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");
		
		 if (userId == null) {
             response.sendRedirect("login.jsp");
             return;
         }
		
		
		OrderDetailsDAOimp order = new OrderDetailsDAOimp();
		 
		    List<OrderDetails> or = order.getOrderDetailsByUser(userId);
		    
		    for(OrderDetails o:or) {
		    	System.out.println(o);
		    }
		    
		      request.setAttribute("orders", or);
		RequestDispatcher re = request.getRequestDispatcher("orders.jsp");
		re.forward(request, response);
		
	}

	
}
