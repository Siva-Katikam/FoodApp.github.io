package com.foodapp.controller;

import java.io.IOException;
import com.foodapp.dao.MenuDAO;
import com.foodapp.daoImpl.Cart;
import com.foodapp.daoImpl.MenuDAOImpl;
import com.foodapp.dto.CartItem;
import com.foodapp.dto.Menu;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/Cart")
public class CartServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get session and cart from session
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");

        // If no cart exists in session, create a new cart
        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }

        // Get the action parameter from the request
        String action = request.getParameter("act");

        // Perform actions based on the parameter
        if ("add".equals(action)) {
            addItemToCart(request, cart);
        } else if ("update".equals(action)) {
            updateCartItem(request, cart);
        } else if ("remove".equals(action)) {
            removeItemFromCart(request, cart);
        }

        // Update the cart in the session
        session.setAttribute("cart", cart);
        // Redirect to the cart.jsp page
        response.sendRedirect("cart.jsp");
    }

    // Method to handle adding an item to the cart
    private void addItemToCart(HttpServletRequest request, Cart cart) {
        // Parse item ID and quantity from the request
        int itemId = Integer.parseInt(request.getParameter("itemId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        // Fetch the menu item from the database using MenuDAO
        MenuDAO menuDAO = new MenuDAOImpl();
        Menu menuItem = menuDAO.getMenuById(itemId);

        // If the menu item exists, add it to the cart
        if (menuItem != null) {
            CartItem item = new CartItem(
                menuItem.getItemId(),
                menuItem.getRestarauntId(),
                menuItem.getItemName(),
                quantity,
                menuItem.getPrice(),
                menuItem.getImagePath()
            );
            cart.addItem(item);
System.out.println("ATC : "+cart);
            // Store the restaurantId in the session for future reference
            HttpSession session = request.getSession();
            session.setAttribute("restaurantId", menuItem.getRestarauntId());
        }
    }

    // Method to update the quantity of an item in the cart
    private void updateCartItem(HttpServletRequest request, Cart cart) {
        // Parse item ID and new quantity from the request
        int itemId = Integer.parseInt(request.getParameter("itemId"));
        int newQuantity = Integer.parseInt(request.getParameter("quantity"));

        // Update the item's quantity in the cart
        cart.updateItem(itemId, newQuantity);
    }

    // Method to remove an item from the cart
    private void removeItemFromCart(HttpServletRequest request, Cart cart) {
        // Parse the item ID from the request
        int itemId = Integer.parseInt(request.getParameter("itemId"));

        // Remove the item from the cart
        cart.removeItem(itemId);
    }

    // Override doGet to redirect to doPost for handling GET requests
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
