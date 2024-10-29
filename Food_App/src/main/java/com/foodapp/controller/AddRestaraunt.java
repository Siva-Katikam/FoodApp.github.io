package com.foodapp.controller;

import java.io.IOException;

import com.foodapp.dao.RestarauntDAO;
import com.foodapp.daoImpl.RestarauntDAOImpl;
import com.foodapp.dto.Restaraunt;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/addrestaraunt")
public class AddRestaraunt extends HttpServlet {
	
       
    
   
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) 
	        throws ServletException, IOException {

	    // Log all incoming parameters for debugging
	    System.out.println("Incoming Parameters:");
	    req.getParameterMap().forEach((key, value) -> {
	        System.out.println(key + ": " + (value != null ? value[0] : "null"));
	    } );

	    try 
	    { 
	        int rId = Integer.parseInt(req.getParameter("rId"));
	        String rname = req.getParameter("rname");
	        String cType = req.getParameter("ctype");
	        int dtime =Integer.parseInt(req.getParameter("dtime"));
	        int isOpen = Integer.parseInt(req.getParameter("isopen"));
	        int rating = Integer.parseInt(req.getParameter("rating"));
	        String imgpath = req.getParameter("imgpath");

	        // Debugging prints to verify parameter values
	        System.out.println("Parsed values: rId=" + rId + ", rname=" + rname + 
	                            ", cType=" + cType + ", dtime=" + dtime + 
	                            ", isOpen=" + isOpen + ", rating=" + rating + 
	                            ", imgpath=" + imgpath);

	        Restaraunt r = new Restaraunt(rId, rname, cType, dtime, isOpen, rating, imgpath);

	        RestarauntDAO rdaoimp = new RestarauntDAOImpl();
	        int x = rdaoimp.insertRestaraunt(r);

	        if (x > 0) {
	            resp.sendRedirect("AdminHomeServlet");
	        } else {
	            resp.sendRedirect("failure.html");
	        }

	    } 
	    catch (NumberFormatException e) {
	        // Handle parsing errors
	        System.out.println("Error parsing input: " + e.getMessage());
	        resp.sendRedirect("error.html");  // Redirect to an error page
	    }
	}

	


}
