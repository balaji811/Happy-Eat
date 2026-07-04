package com.tap.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.tap.DAOimp.CartDAOimp;


@WebServlet("/DeleteCartItem")
public class DeleteCartItem extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            int cartId = Integer.parseInt(request.getParameter("cartId"));
           
            CartDAOimp c = new CartDAOimp();
              
            c.deleteCart(cartId);
            
            response.sendRedirect("CartServlet");
	}


}
