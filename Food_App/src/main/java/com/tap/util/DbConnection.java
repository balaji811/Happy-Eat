package com.tap.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DbConnection {
	public static final String URL="jdbc:mysql://localhost:3306/foodapplication";
	public static final String US="root";
	public static final String PWD = "balaji125#";
	
	
     public static Connection getConnection() {
    	 Connection con = null;
    	    try {
    	    	  Class.forName("com.mysql.cj.jdbc.Driver");
    	    	 con = DriverManager.getConnection(URL,US,PWD);
    	    	 System.out.println("Connection has established");
    	   }catch(Exception e){
    		   e.printStackTrace();
    	   }
    	    return con;
     }  
}
