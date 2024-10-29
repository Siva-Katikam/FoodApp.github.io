<%@ page session="true" %>
<%@ page import="com.foodapp.dto.OrderItem" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Details</title>
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

        /* Card Layout for Order Items */
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

        /* Responsive Design */
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
        <h1>Order Details</h1>
        <%
            // Retrieve the order items from the session
            List<OrderItem> orderItems = (List<OrderItem>) session.getAttribute("orderItems");

            if (orderItems == null || orderItems.isEmpty()) {
        %>
            <p>No order items found. <a href="menu.jsp" class="btn">Browse the menu</a>.</p>
        <%
            } else {
        %>
        <div class="card-container">
            <%
                for (OrderItem item : orderItems) {
            %>
            <div class="card">
                <h3>Menu Item ID: <%= item.getmItemId() %></h3>
                <p>Quantity: <%= item.getQuntity() %></p>
                <p>Subtotal: Rs <%= item.getSubTotal() %></p>
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
