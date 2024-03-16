package com.shop.main.product;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.shop.main.connection.ConnectionClass;

public class ProductDao {

	
 public static List <Product> getProductInfo() throws SQLException {
	 List <Product> list = new ArrayList();
	 Connection con;

	 System.out.println("Connecting!!");
		 try{
			 con = ConnectionClass.getConnection();
		 
		 
		  String query="Select * from product";
		  Statement smt=con.createStatement();
	   
	      ResultSet rs=smt.executeQuery(query);
	    
	      while(rs.next()){  
	         Product products=new Product();  
	          products.setProductId(rs.getInt("productId"));  
	          products.setDescription(rs.getString("description"));  
	          products.setProductTitle(rs.getString("productTitle"));  
	          products.setImage(rs.getString("image"));  
	          products.setPrice(rs.getInt("price"));  
	         list.add(products);
	      }
	      	
	    
	}
 
 
 	catch(Exception e) {
		e.printStackTrace();
 	}
	 
		  return list; 
      
 }
}
 
