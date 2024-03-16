package com.shop.main.connection;

import java.sql.*;

public class ConnectionClass {

public static Connection con;
	
	public static Connection getConnection() {
		try
			{
				if(con == null)
				{
					Class.forName("com.mysql.jdbc.Driver");
					con=DriverManager.getConnection("jdbc:mysql://localhost:3306/javaprojecttables?useSSL=false","root","");
				}
			}
				catch(Exception e) {
					e.printStackTrace() ;
				}
			return con;
		}	
}
