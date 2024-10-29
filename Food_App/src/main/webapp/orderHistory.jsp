<%@ page session="true" %>
<%@ page import="com.foodapp.daoImpl.OrderHistoryDAOImpl,com.foodapp.dto.OrderHistory, com.foodapp.dto.User" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order History</title>
    <style>
        /* General Styling */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            animation: fadeIn 1s ease-in-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        .container {
            width: 80%;
            margin: 40px auto;
            background: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            animation: slideIn 1s ease-out;
        }

        @keyframes slideIn {
            from { transform: translateY(50px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }

        h1 {
            text-align: center;
            color: #333;
            font-size: 2.5rem;
            margin-bottom: 20px;
            animation: zoomIn 0.8s ease;
        }

        @keyframes zoomIn {
            from { transform: scale(0.8); opacity: 0; }
            to { transform: scale(1); opacity: 1; }
        }

        /* Card Layout for Orders */
        .card-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
        }

        .card {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            opacity: 0;
            transform: translateY(30px);
            animation: cardSlideUp 0.7s forwards;
        }

        .card:hover {
            transform: translateY(-10px);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
        }

        @keyframes cardSlideUp {
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .card h3 {
            margin: 0 0 10px;
            font-size: 1.2rem;
            color: #28a745;
        }

        .card p {
            margin: 5px 0;
            color: #555;
        }

        /* Buttons */
        .btn {
            display: inline-block;
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            text-align: center;
            border-radius: 5px;
            text-decoration: none;
            font-size: 1.1rem;
            margin-top: 10px;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        .btn:hover {
            background-color: #0056b3;
            transform: scale(1.05);
        }

        .btn:active {
            transform: scale(0.98);
        }

        /* Responsive design */
        @media (max-width: 768px) {
            .container {
                width: 90%;
                padding: 20px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Your Order History</h1>
        <%
            // Retrieve the User object from session
            User user = (User) session.getAttribute("user");
            
            // If user is null, redirect to login page
            if (user == null) {
                response.sendRedirect("Login.jsp");
                return;
            }
            
            // Instantiate OrderHistoryDAOImpl to access non-static method
            OrderHistoryDAOImpl orderHistoryDAO = new OrderHistoryDAOImpl();
            java.util.List<OrderHistory> orders = orderHistoryDAO.getOrderHistoryByUserId(user.getUser_id());

            // Check if the user has any past orders
            if (orders.isEmpty()) {
        %>
            <p>You have no past orders. <a href="menu.jsp" class="btn">Browse Menu</a>.</p>
        <%
            } else {
        %>
        <div class="card-container">
            <%
                // Loop through the list of orders and display them as cards
                for (OrderHistory order : orders) {
            %>
            <div class="card">
                <h3>Order ID: <%= order.getOrderHistoryId() %></h3>
                <p>Total Amount: Rs <%= order.getTotal() %></p>
                <p>Status: <%= order.getStatus() %></p>
                <p>Order Date: <%= order.getDate() %></p>
                <form action="ViewServlet" method="get">
                    <input type="hidden" name="orderId" value="<%= order.getOrderHistoryId() %>">
                    <button type="submit" class="btn">View Order</button>
                </form>
            </div>
            <%
                }
            %>
        </div>
        <a href="menu.jsp" class="btn">Browse Menu</a>
        <%
            }
        %>
    </div>
</body>
</html>
