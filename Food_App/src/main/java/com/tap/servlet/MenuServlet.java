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

import com.tap.DAOimp.MenuDAOimp;
import com.tap.DAOimp.RestaurantDAOimp;
import com.tap.model.Menu;
import com.tap.model.Restaurant;

/**
 * Servlet implementation class MenuServlet
 */
@WebServlet("/MenuServlet")
public class MenuServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int resturantId = Integer.parseInt(request.getParameter("resturantId"));
		
		MenuDAOimp menu = new MenuDAOimp();
		
		RestaurantDAOimp res = new RestaurantDAOimp();
		
		 Restaurant r =res.getRestaurant(resturantId);
		 
	
		 
		 HttpSession session= request.getSession();
		 
		 Integer userId = (Integer) session.getAttribute("userId");
		
		 
		 
		List<Menu> li = menu.getallMenus(resturantId);
		
		 if (userId == null) {
             response.sendRedirect("login.jsp");
             return;
         }

		
		
		request.setAttribute("resturantName", r.getName());
		request.setAttribute("resturantCusine", r.getCuisineType());
		request.setAttribute("resturantTime", r.getDeliveryTime());
		request.setAttribute("restaurantRating", r.getRating());
		
		
		request.setAttribute("arr", li);
		
	    RequestDispatcher  re=  request.getRequestDispatcher("menu.jsp");
	     re.forward(request, response);
		
		
	}

	
}
