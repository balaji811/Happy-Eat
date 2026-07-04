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

import com.tap.DAOimp.RestaurantDAOimp;
import com.tap.model.Restaurant;

/**
 * Servlet implementation class ResturantServlet
 */
@WebServlet("/ResturantServlet")
public class ResturantServlet extends HttpServlet {

  
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		RestaurantDAOimp resturant = new RestaurantDAOimp();
 HttpSession session= req.getSession();
		 
		 Integer userId = (Integer) session.getAttribute("userId");
		
		 if (userId == null) {
             resp.sendRedirect("login.jsp");
             return;
         }
		List<Restaurant> li = resturant.allRestaurants();
		
		 
		  
		  req.setAttribute("arr", li);
		  
		  RequestDispatcher re= req.getRequestDispatcher("restaurant.jsp");
		   re.forward(req, resp);
		  
	}

	

}
