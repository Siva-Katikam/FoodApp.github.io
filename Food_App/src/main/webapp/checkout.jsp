<%@ page session="true" %>
<%@ page import="com.foodapp.daoImpl.Cart, com.foodapp.dto.CartItem" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Checkout</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        /* Styles for checkout page */
        body {
            background-color: #f4f4f4;
            animation: fadeIn 1.5s ease-in-out;
        }

        .header {
            background-color: rgba(40, 167, 69, 0.9);
            padding: 20px;
            color: white;
            text-align: center;
        }

        .foodapp-logo {
            font-size: 2.5rem;
            font-weight: bold;
        }

        .container {
            margin: 30px auto;
            background: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        }

        .confirm-btn {
            width: 100%;
            padding: 15px;
            background-color: #28a745;
            color: white;
            font-size: 1.2rem;
            transition: transform 0.2s ease;
        }

        .confirm-btn:hover {
            transform: scale(1.05);
            background-color: #218838;
        }

        .footer {
            background-color: rgba(40, 167, 69, 0.9);
            color: white;
            text-align: center;
            padding: 15px 0;
            margin-top: 30px;
        }

        .social-icons a {
            color: white;
            margin: 0 8px;
            font-size: 1.5rem;
        }

        /* Animation */
        @keyframes fadeIn { from { opacity: 0; } to { opacity: 1; } }
    </style>
</head>
<body>
    <!-- Header -->
    <div class="header">
        <h1 class="foodapp-logo">FoodApp <i class="fas fa-utensils"></i></h1>
    </div>

    <div class="container">
        <h2>Checkout</h2>
        <%
            Cart cart = (Cart) session.getAttribute("cart");
            double total = 0;
            if (cart != null && !cart.getItems().isEmpty()) {
                for (CartItem item : cart.getItems().values()) {
                    total += item.getQuantity() * item.getPrice();
                }
        %>
        
        <!-- Total Amount Section -->
        <div class="total-section mb-4">
            <h3>Total Amount: Rs <%= total %></h3>
        </div>

        <!-- Checkout Form -->
        <form id="checkoutForm" action="OrderServlet" method="post">
            <div class="form-group">
                <label for="address">Delivery Address</label>
                <input type="text" class="form-control" id="address" name="address" placeholder="Enter your delivery address" required>
            </div>

            <div class="form-group">
                <label>Payment Mode</label>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="paymentMode" value="Cash on Delivery" required>
                    <label class="form-check-label">Cash on Delivery</label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="paymentMode" value="Card" required>
                    <label class="form-check-label">Card</label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="paymentMode" value="UPI" required>
                    <label class="form-check-label">UPI</label>
                </div>
            </div>

            <button type="submit" class="confirm-btn">Confirm Payment</button>
        </form>

        <!-- Back to Menu Link -->
        <div class="mt-3">
            <p><a href="menu.jsp">Back to Menu</a></p>
        </div>

        <%
            } else {
        %>
            <p>Your cart is empty. <a href="menu.jsp">Go back to the menu</a> to add items to your cart.</p>
        <%
            }
        %>
    </div>

    <!-- Footer -->
    <footer class="footer">
        <p>&copy; 2024 FoodApp. All rights reserved.</p>
        <div class="social-icons">
            <a href="#" title="Facebook"><i class="fab fa-facebook-square"></i></a>
            <a href="#" title="Twitter"><i class="fab fa-twitter-square"></i></a>
            <a href="#" title="Instagram"><i class="fab fa-instagram-square"></i></a>
        </div>
    </footer>

    <!-- JavaScript for form and confirmation handling -->
    <script>
        document.getElementById('checkoutForm').addEventListener('submit', function(event) {
            event.preventDefault();
            alert("Payment confirmed! Thank you for your order.");
            setTimeout(() => { this.submit(); }, 2000); // Simulate delay
        });
    </script>
</body>
</html>
