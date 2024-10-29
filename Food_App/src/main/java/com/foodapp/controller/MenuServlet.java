package com.foodapp.controller;

import java.io.IOException;
import java.util.ArrayList;

import com.foodapp.daoImpl.MenuDAOImpl;  // Importing DAO implementation to interact with the menu data in the database
import com.foodapp.dto.Menu;            // Importing Menu DTO (Data Transfer Object) to hold menu data

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class MenuServlet extends HttpServlet {

    private MenuDAOImpl menuDAO;

    // This method is called once when the servlet is initialized.
    // We use it to set up our MenuDAOImpl object for database interactions.
    @Override
    public void init() throws ServletException {
        menuDAO = new MenuDAOImpl();  // Initialize the DAO object to interact with the database
    }

    // This method handles GET requests from the client (e.g., a browser).
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve the "restaurantId" parameter from the request URL (e.g., menuServlet?restaurantId=123)
        String restaurantIdStr = request.getParameter("restaurantId");

        try {
            // Check if restaurantId is provided and is not empty
            if (restaurantIdStr != null && !restaurantIdStr.isEmpty()) {
                // Parse the restaurantId string into an integer
                int restaurantId = Integer.parseInt(restaurantIdStr);

                // Fetch the menu for the given restaurant from the DAO
                ArrayList<Menu> menuList = (ArrayList<Menu>) menuDAO.getAllRestarauntMenu(restaurantId);

                // Check if the menuList is not null and contains at least one menu item
                if (menuList != null && !menuList.isEmpty()) {
                    // If the menu is found, store it in the session (available across multiple requests)
                    HttpSession session = request.getSession();
                    session.setAttribute("menuList", menuList);

                    // Forward the request and response to the "menu.jsp" page for displaying the menu
                    request.getRequestDispatcher("Home-Menu.jsp").forward(request, response);
                } else {
                    // If the menu list is empty, inform the user that no menu was found
                    response.getWriter().write("No menu found for the given restaurant ID.");
                }
            } else {
                // If no restaurantId is provided, inform the user
                response.getWriter().write("Restaurant ID not provided.");
            }
        } catch (NumberFormatException e) {
            // Handle case where the restaurantId is not a valid integer
            response.getWriter().write("Invalid Restaurant ID.");
        } catch (Exception e) {
            // Handle any other exceptions that may occur (e.g., database issues)
            response.getWriter().write("An error occurred while fetching the menu.");
            e.printStackTrace();  // Print the stack trace for debugging; in production, log the error instead
        }
    }
}
