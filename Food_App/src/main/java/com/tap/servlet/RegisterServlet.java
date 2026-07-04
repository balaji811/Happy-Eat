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
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.tap.util.DbConnection;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/Register")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String QUERY2 = "select * from user where Email = ? ";
	private static final String QUERY = "Insert into user (Username,Password,Email,Address,Role) values(?,?,?,?,?)";
	
       
   

	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher  re=req.getRequestDispatcher("register.jsp");
		re.forward(req, resp);
		
	}

	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		    
		String username= req.getParameter("username");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		String address =req.getParameter("address");
		String role= req.getParameter("role");
		
		Connection con = null;
		PreparedStatement pst =null;
		PreparedStatement pst2=null;
		ResultSet r = null;
		
		System.out.println(username + " "+ email + " "+ password + " "+ address + " "+ role);
		
		try {
			
		
			
			con = DbConnection.getConnection();
			
			
		
			
			pst2=con.prepareStatement(QUERY2);
			
			pst2.setString(1, email);
			
			r= pst2.executeQuery();
			
			if(r.next()) {
				
				
				PrintWriter w= resp.getWriter();
				w.println("Email already exists");
				
				
			}else {
			
			
			
			pst = con.prepareStatement(QUERY);
			
			pst.setString(1, username);
			pst.setString(2,password);
			pst.setString(3, email);
			pst.setString(4, address);
			pst.setString(5, role);
			
			int a=pst.executeUpdate();
			
			  resp.sendRedirect("Login");
			
			 
			}
			
			
		}catch(Exception e) {
			 e.printStackTrace();
		}finally {

		    try {
		        if (r != null) {
		            r.close();
		        }

		        if (pst != null) {
		            pst.close();
		        }

		        if (pst2 != null) {
		            pst2.close();
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
