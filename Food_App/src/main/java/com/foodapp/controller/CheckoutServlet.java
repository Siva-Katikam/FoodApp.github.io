package com.foodapp.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.foodapp.daoImpl.Cart;
import com.foodapp.daoImpl.OrderDAOImpl;
import com.foodapp.daoImpl.OrderHistoryDAOImpl;
import com.foodapp.daoImpl.OrderItemDAOImpl;
import com.foodapp.dto.CartItem;
import com.foodapp.dto.OrderHistory;
import com.foodapp.dto.OrderItem;
import com.foodapp.dto.Orders;
import com.foodapp.dto.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/OrderServlet")
public class CheckoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private OrderDAOImpl orderDAO;
    private OrderItemDAOImpl orderItemDAO;
    private OrderHistoryDAOImpl orderHistoryDAO;

    public CheckoutServlet() {
        super();
        // Initialize DAO implementations
        orderDAO = new OrderDAOImpl();
        orderItemDAO = new OrderItemDAOImpl();
        orderHistoryDAO = new OrderHistoryDAOImpl();
    }

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the session and the cart from the session
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");

        // Check if user is logged in
        User user = (User) session.getAttribute("user");
        if (user == null) {
            // Redirect to login page if user is not logged in
            response.sendRedirect("Login.jsp?error=Please log in to proceed with checkout.");
            return;
        }

        // Check if cart is empty
        if (cart == null || cart.getItems().isEmpty()) {
            response.sendRedirect("menu.jsp?error=Your cart is empty.");
            return;
        }

        // Get form data from the request
        String address = request.getParameter("address");
        String paymentMode = request.getParameter("paymentMode");
        String orderStatus = "Pending"; // Initial order status is "Pending"
        String dateTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());

        // Calculate total amount from cart items
        int totalAmount = 0;
        for (CartItem item : cart.getItems().values()) {
            totalAmount += item.getQuantity() * item.getPrice();
        }

        // Insert into Orders table
        Orders order = new Orders();
        
        order.setUserId(user.getUser_id());
        order.setRestarauntId(cart.getRestaurantId()); // Assuming cart contains the restaurant ID
        order.setTotalAmount(totalAmount);
        order.setStatus(orderStatus);
        order.setDateTime(dateTime);
        order.setPaymentOption(paymentMode);

        // Insert the order and retrieve generated orderId
        int orderId = orderDAO.insertOrders(order);
        if (orderId == -1) {
            // If order insertion fails, redirect with error message
            response.sendRedirect("checkout.jsp?error=Order failed. Please try again.");
            return;
        }
        
        int maxOrderId = orderDAO.getMaxOrderId();
        System.out.println("Max Order ID: " + maxOrderId);

        // Insert order items into OrderItems table
        for (CartItem item : cart.getItems().values()) {
            OrderItem orderItem = new OrderItem();
            orderItem.setOrderId(maxOrderId);
            orderItem.setmItemId(item.getItemId());
            orderItem.setQuntity(item.getQuantity());  // Typo was fixed here (from `setQuntity`)
            orderItem.setSubTotal((int) (item.getQuantity() * item.getPrice()));

            // Insert each order item into the database
            orderItemDAO.insertOrderItems(orderItem);
        }

        // Insert into OrderHistory table
        OrderHistory orderHistory = new OrderHistory();
        orderHistory.setUserId(user.getUser_id());
        orderHistory.setDate(dateTime);
        orderHistory.setTotal(totalAmount);
        orderHistory.setStatus(orderStatus);

        // Insert order history record
        int insertOrderHistory = orderHistoryDAO.insertOrderHistory(orderHistory);
        if (insertOrderHistory == -1) {
            // If history insertion fails, log the error (optional)
            System.out.println("Failed to insert into order history.");
        }

        cart.clearCart();
        session.setAttribute("cart", cart);

        // Retrieve order items for the order confirmation
        List<OrderItem> olist = orderItemDAO.getOrderItemsByOrderId(maxOrderId);
        session.setAttribute("orderItems", olist); // Create a session attribute for order items

        // Redirect to order confirmation page with the maxOrder ID
        response.sendRedirect("orderConfirmation.jsp?orderId=" + maxOrderId);
        
    }
}
