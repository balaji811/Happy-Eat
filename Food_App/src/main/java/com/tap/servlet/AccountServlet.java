package com.tap.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.tap.DAOimp.UserDAOimp;
import com.tap.model.User;

/**
 * Servlet implementation class AccountServlet
 */
@WebServlet("/AccountServlet")
public class AccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  
		 HttpSession session = request.getSession();
		 Integer userId = (Integer) session.getAttribute("userId");
  
		 
		 if (userId == null) {
             response.sendRedirect("login.jsp");
             return;
         }
		 
		 
		 UserDAOimp user = new UserDAOimp();
		    
		 User u= user.getUser(userId);
		  
		 System.out.println(u);
		  
		 request.setAttribute("user", u);
		 
		   RequestDispatcher re  = request.getRequestDispatcher("account.jsp");
		    re.forward(request, response);
		 
		 System.out.println("working" + ""+ userId);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 HttpSession session = request.getSession();
		 Integer userId = (Integer) session.getAttribute("userId");
  
		   String username = request.getParameter("username");
		   String email = request.getParameter("email");
		   String password = request.getParameter("password");
		   String address = request.getParameter("address");
		   String role = request.getParameter("role");
		   
		   System.out.println(username + " "+ email + " "+ password + " "+ address);
		   // public User(String userName, String password, String email,
         //  String address, String role) {

		   User u = new User(userId,username,password,email,address,role);
		   
		   UserDAOimp user = new UserDAOimp();
		   
		   user.updateUser(u);
		   
		   response.sendRedirect("AccountServlet");
	}

}
