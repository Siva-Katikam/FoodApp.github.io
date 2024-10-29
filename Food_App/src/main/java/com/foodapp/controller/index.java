package com.foodapp.controller;

import java.io.IOException;
import java.util.List;

import com.foodapp.daoImpl.RestarauntDAOImpl;
import com.foodapp.dto.Restaraunt;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class HomeServlet extends HttpServlet {

    private RestarauntDAOImpl restarauntDAO;
    private HttpSession session;

    @Override
    public void init() throws ServletException {
        // Initialize the DAO
        restarauntDAO = new RestarauntDAOImpl();
    }

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        
        // Fetch all restaurants using the DAO implementation
        List<Restaraunt> restaurantList = restarauntDAO.getAllRestaraunt();
        
        // Set the list of restaurants in the session
        session = req.getSession();
        session.setAttribute("restaurantList", restaurantList);
        
        // Redirect to the admin home JSP page to display restaurant details
        resp.sendRedirect("HomePage.jsp");
    }

    @Override
    public void destroy() {
        // No need to manually close connections since the DAO handles it
    }
}
