package com.foodapp.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.foodapp.dto.Restaraunt;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class AdminHomeServlet extends HttpServlet {

    private Connection con = null;
    private Statement stmt;
    private ResultSet rs;
    private HttpSession session;
    
    // SQL query to fetch all restaurants
    String fetching = "SELECT * FROM restaraunt";

    @Override
    public void init() throws ServletException {
        try {
            // Load MySQL driver and establish the connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/online_food_delivey", "root", "123456789");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        
        ArrayList<Restaraunt> restaurantList = new ArrayList<>();
        
        try {
            stmt = con.createStatement();
            rs = stmt.executeQuery(fetching);
            
            // Loop through result set and add restaurants to the ArrayList
            while (rs.next()) {
                restaurantList.add(new Restaraunt(
                    rs.getInt("rId"),
                    rs.getString("name"),
                    rs.getString("cusineType"),
                    rs.getInt("deliveryTime"),
                    rs.getString("imgPath")
                ));
            }
            
            // Set the ArrayList in the session
            session = req.getSession();
            session.setAttribute("restaurantList", restaurantList);
            
            // Redirect to the admin home JSP page to display restaurant details
            resp.sendRedirect("AdminLogin.jsp");
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void destroy() {
        try {
            if (con != null) {
                con.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
