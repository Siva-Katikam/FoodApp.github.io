<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.foodapp.dto.OrderItem" %>
<%@ page import="com.foodapp.dto.User" %>

<%
    // Fetch session attributes
    User user = (User) session.getAttribute("user");
    List<OrderItem> orderItems = (List<OrderItem>) session.getAttribute("orderItems");
    String orderId = request.getParameter("orderId");

    // Redirect to login page if user is not logged in
    if (user == null) {
        response.sendRedirect("Login.jsp?error=Please log in to view your order confirmation.");
        return;
    }

    // Check if orderItems are present
    if (orderItems == null || orderItems.isEmpty()) {
        response.sendRedirect("menu.jsp?error=No order items found for this order.");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Confirmation</title>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #e9ecef;
            margin: 0;
            padding: 0;
        }

        
	    .header {
	        background-color: #28a745;
	        color: black;
	        padding: 20px 0;
	        text-align: center;
	        animation: slideDown 0.60s ease;
	        position: relative;
	    }
	
	    .foodapp-logo {
	        font-size: 3rem; /* Adjust font size of the logo */
	        margin: 0; /* Remove default margin */
	    }
	
	    .foodapp-logo i {
	        font-size: 3rem; /* Increase the font size of the thumbs-up symbol */
	        vertical-align: middle; /* Align the thumbs-up symbol with the text */
	        margin-left: 5px; /* Add some space between the text and the icon */
	        color: white; /* Change color to white for better visibility */
	    }
	
	    /* Additional styling for h1 */
	    h1 {
	        text-align: center;
	        color: #fff; /* Change text color to white */
	        margin-bottom: 10px; /* Space below the heading */
	        font-size: 2.5rem; /* Increase font size */
	        animation: slideIn 0.5s ease;
	        font-weight: bold; /* Make the text bold */
	        text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5); /* Add a shadow for better readability */
	    }


        @keyframes slideDown {
            from { transform: translateY(-60px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }


				}

		.foodapp-logo i {
		    font-size: 3rem; /* Increase the font size of the thumbs-up symbol */
		    vertical-align: middle; /* Align the thumbs-up symbol with the text */
		    margin-left: 5px; /* Add some space between the text and the icon */
		}
        @keyframes bounce {
            0%, 20%, 50%, 80%, 100% { transform: translateY(0); }
            40% { transform: translateY(-10px); }
            60% { transform: translateY(-5px); }
        }

        .container {
            margin: 40px auto;
            padding: 30px;
            background: white;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
            animation: fadeIn 1s ease-in-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        h1 {
            text-align: center;
            color: #28a745;
            margin-bottom: 20px;
            font-size: 2.5rem;
            animation: slideIn 0.5s ease;
        }

        @keyframes slideIn {
            from { transform: translateY(-30px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }

        .card {
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            margin-bottom: 20px;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
        }

        .total-amount {
            text-align: center;
            font-size: 1.5rem;
            color: #333;
            margin-top: 30px;
        }

        .btn-custom {
            background-color: #28a745;
            color: white;
            border-radius: 5px;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        .btn-custom:hover {
            background-color: #218838;
            transform: scale(1.05);
        }

        .btn-custom:active {
            transform: scale(0.98);
        }

        .footer {
            background-color: #28a745;
            color: white;
            text-align: center;
            padding: 20px 0;
            position: relative;
            bottom: 0;
            width: 100%;
            animation: slideUp 0.5s ease;
        }

        @keyframes slideUp {
            from { transform: translateY(30px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }

        .social-icons a {
            color: white;
            margin: 0 10px;
            font-size: 1.5rem;
            transition: transform 0.2s ease;
        }

        .social-icons a:hover {
            transform: scale(1.2);
        }

        /* Animation for pop-up symbols */
        .pop-symbol {
            position: absolute;
            background: rgba(255, 255, 255, 0.9);
            padding: 10px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            z-index: 1000;
            animation: popIn 0.5s ease;
        }

        @keyframes popIn {
            0% { transform: scale(0); opacity: 0; }
            50% { transform: scale(1.2); }
            100% { transform: scale(1); opacity: 1; }
        }

        /* New celebration animations */
        .celebrate {
            animation: celebrate 1s ease-in-out forwards;
            position: fixed;
            top: 20px;
            right: 20px;
            font-size: 2rem;
            z-index: 1000;
        }

        @keyframes celebrate {
            0% { transform: translateY(0); opacity: 1; }
            50% { transform: translateY(-30px); opacity: 1; }
            100% { transform: translateY(0); opacity: 0; }
        }

        /* Responsive design */
        @media (max-width: 768px) {
            .container {
                padding: 20px;
            }
        }
    </style>
</head>
<body>
    <div class="header">
        
        <h1 class="foodapp-logo"><i class="fas fa-utensils"></i> FoodApp <i class="fas fa-thumbs-up"></i></h1>
    </div>

    <div class="container">
        <h1>Thank You for Your Order!</h1>

        <p>Order ID: <strong><%= orderId %></strong></p>
        <p>Hello, <strong><%= user.getUser_name() %></strong></p>

        <h2>Order Summary</h2>
        <div class="row">
            <%
                int totalAmount = 0;
                for (OrderItem item : orderItems) {
                    totalAmount += item.getSubTotal();
            %>
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Item: <%= item.getmItemId() %></h5>
                        <p class="card-text">Quantity: <%= item.getQuntity() %></p>
                        <p class="card-text">Price: Rs <%= item.getSubTotal() / item.getQuntity() %></p>
                        <p class="card-text">Subtotal: Rs <%= item.getSubTotal() %></p>
                    </div>
                </div>
            </div>
            <% } %>
        </div>

        <div class="total-amount">
            <h3>Total Amount: Rs <%= totalAmount %></h3>
        </div>

        <h2>What's Next?</h2>
        <p>Your order is currently being processed. We will notify you when it's ready for delivery or pickup.</p>

        <p>If you have any questions, feel free to <a href="OrdesrSuccessContact.jsp">contact us</a>.</p>

        <h2>Additional Information</h2>
        <p>We appreciate your business! Please let us know if you have any dietary restrictions or special requests for your next order.</p>

        <a href="menu.jsp" class="btn btn-custom btn-lg">Continue Shopping</a>
    </div>

    <div class="footer">
        <p>Follow us on:</p>
        <div class="social-icons">
            <a href="#" title="Facebook"><i class="fab fa-facebook"></i></a>
            <a href="#" title="Twitter"><i class="fab fa-twitter"></i></a>
            <a href="#" title="Instagram"><i class="fab fa-instagram"></i></a>
        </div>
        <p>&copy; 2024 FoodApp. All Rights Reserved.</p>
    </div>

    <!-- Celebratory Animation and Pop-Up Message -->
    <div class="celebrate" id="celebrate-message" style="display: none;">
        🎉 Your order has been confirmed! 🎉
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>

    <script>
        // Show celebratory message
        $(document).ready(function() {
            $('#celebrate-message').fadeIn().delay(2000).fadeOut();
        });

        // Function to show a pop-up message
        function showPopUpMessage(message) {
            const popUp = $('<div class="pop-symbol">' + message + '</div>');
            $('body').append(popUp);
            popUp.fadeIn().delay(2000).fadeOut(function() {
                $(this).remove();
            });
        }

        // Example of showing a pop-up message
        $(document).ready(function() {
            showPopUpMessage("Thank you for choosing FoodApp!");
        });
    </script>
</body>
</html>

