package com.foodapp.controller;

import java.io.IOException;

import com.foodapp.dao.RestarauntDAO;
import com.foodapp.daoImpl.RestarauntDAOImpl;
import com.foodapp.dto.Restaraunt;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class EditRestarauntServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String restaurantIdParam = request.getParameter("restaurantId");

	    if (restaurantIdParam != null && !restaurantIdParam.isEmpty()) {
	        try {
	            int rId = Integer.parseInt(restaurantIdParam);
	            RestarauntDAO resDAO = new RestarauntDAOImpl();
	            Restaraunt restaurant = resDAO.getRestarauntById(rId);

	            if (restaurant != null) {
	                request.setAttribute("restaurant", restaurant);
	                RequestDispatcher dispatcher = request.getRequestDispatcher("EditRestaraunt.jsp");
	                dispatcher.forward(request, response);
	            } else {
	                logError("Restaurant with ID " + rId + " not found.");
	                response.sendRedirect("EditError.jsp");
	            }
	        } catch (NumberFormatException e) {
	            logError("Invalid restaurant ID format: " + restaurantIdParam, e);
	            response.sendRedirect("EditError.jsp");
	        } catch (Exception e) {
	            logError("An error occurred while fetching restaurant data.", e);
	            response.sendRedirect("EditError.jsp");
	        }
	    } else {
	        logError("Restaurant ID parameter is missing.");
	        response.sendRedirect("EditError.jsp");
	    }
	}

	// Example logError method
	private void logError(String message) {
	    System.err.println(message); // Replace with a logging framework
	}

	private void logError(String message, Exception e) {
	    System.err.println(message);
	    e.printStackTrace(); // Replace with a logging framework
	}

}
