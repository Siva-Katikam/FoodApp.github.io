package com.foodapp.controller;


import java.io.IOException;
import java.util.List;

import com.foodapp.dao.OrderHistoryDAO;
import com.foodapp.daoImpl.OrderHistoryDAOImpl;
import com.foodapp.dto.OrderHistory;
import com.foodapp.dto.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/viewHistory")
public class ViewHistoryServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Assume user ID is stored in session after login
        User user = (User) request.getSession().getAttribute("user");

        // Fetch the order history for the user
        OrderHistoryDAO orderDAO = new OrderHistoryDAOImpl();
        List<OrderHistory> orderHistory = orderDAO.getOrderHistoryByUserId(user.getUser_id());
        
        // Set the order history as request attribute
        request.setAttribute("orderHistory", orderHistory);
        
        // Forward the request to the JSP page for displaying order history
        request.getRequestDispatcher("orderHistory.jsp").forward(request, response);
    }
}
