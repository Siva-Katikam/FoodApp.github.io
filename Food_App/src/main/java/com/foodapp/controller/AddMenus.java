package com.foodapp.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.foodapp.daoImpl.MenuDAOImpl;
import com.foodapp.dto.Menu;

@WebServlet("/addmenu")
public class AddMenus extends HttpServlet {

	    
	    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	        try {
	            int rId = Integer.parseInt(req.getParameter("rId"));
	            String itemname = req.getParameter("itemName");
	            String dis = req.getParameter("dis");
	            int price = Integer.parseInt(req.getParameter("price"));
	            
	            // Parse 'isAvailable' from number to boolean
	            int isAvailableInt = Integer.parseInt(req.getParameter("isAvailable"));
	            boolean isAvailable = (isAvailableInt == 1);
	            
	            String imgPath = req.getParameter("imgpath");

	            // Create a new Menu object
	            Menu m = new Menu(rId, itemname, dis, price, isAvailable, imgPath);

	            // Insert menu item using DAO
	            MenuDAOImpl menudaoim = new MenuDAOImpl();
	            int x = menudaoim.insertMenu(m);

	            // Send a success or failure response
	            if (x > 0) {
	                resp.sendRedirect("AdminHomeServlet");
	            } else {
	                resp.sendRedirect("failure.html");
	            }
	        } catch (NumberFormatException e) {
	            // Handle invalid input for numeric fields
	            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid input for numeric fields.");
	        }
	    }


		
		
		
		
		
	}


