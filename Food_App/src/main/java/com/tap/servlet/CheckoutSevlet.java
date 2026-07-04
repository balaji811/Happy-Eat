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

import com.mysql.cj.Session;
import com.tap.DAOimp.CartDAOimp;
import com.tap.DAOimp.UserDAOimp;
import com.tap.model.Cart;
import com.tap.model.User;

/**
 * Servlet implementation class CheckoutSevlet
 */
@WebServlet("/CheckoutSevlet")
public class CheckoutSevlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		HttpSession session = request.getSession();
		  Integer userId = (Integer) session.getAttribute("userId");
		  
		  
		  if (userId == null) {
	             response.sendRedirect("login.jsp");
	             return;
	         }
		  System.out.println(userId);
		  
		  UserDAOimp user = new UserDAOimp();
		  
		    User  userInfo=   user.getUser(userId);
		    
		    System.out.println(userInfo);
		    
		    
		    CartDAOimp cart =new CartDAOimp();
		       
		     List<Cart>  items=   cart.getallCart(userId);
		    
		    request.setAttribute("user", userInfo);
		    request.setAttribute("items", items);
		    
		    
		    RequestDispatcher re=request.getRequestDispatcher("checkout.jsp");
		     re.forward(request, response);
		    
		    
		  
	}

	

}
