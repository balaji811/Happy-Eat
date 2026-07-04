package com.tap.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import com.tap.util.DbConnection;


@WebServlet("/Login")
public class LoginServlet extends HttpServlet {
	
	private static final String QUERY = "select * from user where Email = ? and Password=? ";
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 
		RequestDispatcher  re=req.getRequestDispatcher("login.jsp");
		re.forward(req, resp);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	   String email = request.getParameter("email");
	   String password = request.getParameter("password");
	   
	   System.out.println(email + " "+ password);
	   
	   Connection con = null;
	   PreparedStatement pst= null;
	   ResultSet r = null;
		
		
		try {
			
			con= DbConnection.getConnection();
			
			pst = con.prepareStatement(QUERY);
			
			pst.setString(1, email);
			pst.setString(2, password);
			
			r= pst.executeQuery();
			
			if(r.next()) {
				
				
				
				HttpSession session= request.getSession();
				  session.setAttribute("email", r.getString("Email"));
				session.setAttribute("userId", r.getInt("userID"));
				session.setAttribute("name", r.getString("Username"));
				
				response.sendRedirect("ResturantServlet");
				System.out.println("Login Success");
				
				
			}else {
				response.sendRedirect("Login");
				System.out.println("login failed");
			}
			
		}catch(Exception e) {
			e.printStackTrace();;
		}finally {

		    try {
		        if (r != null) {
		            r.close();
		        }

		        if (pst != null) {
		            pst.close();
		        }

		       

		        if (con != null) {
		            con.close();
		        }

		    } catch (Exception e) {
		        e.printStackTrace();
		    }
		}
		   
		
	}

}
