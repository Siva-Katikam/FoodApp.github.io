package com.foodapp.daoImpl;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.foodapp.dao.AdminDAO;
import com.foodapp.dto.Admin;

public class AdminDAOImpl implements AdminDAO {

    // Declare the required fields
    private Connection con = null;
    private PreparedStatement stmt = null;
    private ResultSet rs = null;
    
    // SQL query to fetch admin details by email
    String fetching = "SELECT * FROM admin WHERE email=?";
    
    // PrintWriter (though this may not be necessary here)
    PrintWriter pw;
    

    // Constructor to initialize the database connection
    public AdminDAOImpl() {
        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // Establish the database connection
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/online_food_delivey", "root", "123456789");
        } catch (Exception e) {
            // Handle any exceptions during connection setup
            e.printStackTrace();
        }
    }

    // Implementing the method to fetch admin by email
    @Override
    public Admin getUserByEmail(String email) {
        Admin admin = null;  // Initialize Admin object

        try {
            // Prepare the SQL query
            stmt = con.prepareStatement(fetching);
            stmt.setString(1, email);  // Set the email parameter in the query

            // Execute the query and get the result set
            rs = stmt.executeQuery();

            // If a matching record is found
            if (rs.next()) {
                admin = new Admin();  // Create a new Admin object
                admin.setEmail(rs.getString("email"));  // Set email
                admin.setPassword(rs.getString("password"));  // Set password
            }
        } catch (Exception e) {
            // Handle any exceptions during the query
            e.printStackTrace();
        } 

        return admin;  // Return the Admin object (or null if not found)
    }
}
