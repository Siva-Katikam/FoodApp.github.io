<%@ page session="true" %>
<%@ page import="com.foodapp.daoImpl.Cart, com.foodapp.dto.CartItem, com.foodapp.dto.Menu" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Cart</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        /* Styles for cart page */
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

        .cart-card {
            border: 1px solid #ddd;
            padding: 15px;
            background-color: white;
            margin-bottom: 20px;
            border-radius: 8px;
        }

        .cart-total {
            font-size: 1.5em;
            color: #333;
            text-align: right;
        }

        .btn-primary, .btn-danger {
            margin-top: 10px;
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

    <!-- Cart Items -->
    <div class="container">
        <h2>Your Cart</h2>
        <%
            Menu menu = new Menu();
            Cart cart = (Cart) session.getAttribute("cart");
            if (cart != null && cart.getItems() != null && !cart.getItems().isEmpty()) {
                double total = 0;
        %>
        <div class="row">
            <%
                for (CartItem item : cart.getItems().values()) {
                    double itemTotal = item.getQuantity() * item.getPrice();
                    total += itemTotal;
            %>
            <div class="col-md-4">
                <div class="cart-card">
                    <img src="<%= item.getImagePath() != null ? item.getImagePath() : "https://via.placeholder.com/150" %>" alt="<%= item.getName() %>" class="img-fluid">
                    <h3><%= item.getName() %></h3>
                    <p>Price: Rs <%= String.format("%.2f", item.getPrice()) %></p>
                    <p>Total: Rs <%= String.format("%.2f", itemTotal) %></p>
                    <form action="Cart" method="post" style="display:inline-block;">
                        <input type="hidden" name="itemId" value="<%= item.getItemId() %>">
                        <input type="number" name="quantity" value="<%= item.getQuantity() %>" min="1" class="form-control d-inline-block" style="width: 60px;">
                        <input type="hidden" name="act" value="update">
                        <button type="submit" class="btn btn-primary">Update</button>
                    </form>
                    <form action="Cart" method="post" style="display:inline-block;">
                        <input type="hidden" name="itemId" value="<%= item.getItemId() %>">
                        <input type="hidden" name="act" value="remove">
                        <button type="submit" class="btn btn-danger">Remove</button>
                    </form>
                </div>
            </div>
            <% } %>
        </div>

        <div class="cart-total">
            <h3>Total: Rs <%= String.format("%.2f", total) %></h3>
        </div>
        <%
            } else {
        %>
        <p class="empty-cart text-center">Your cart is empty. Start shopping now!</p>
        <%
            }
        %>
        <div class="cart-actions text-center">
            <a href="menu.jsp" class="btn btn-secondary">Continue Shopping</a>
            <a href="checkout.jsp" class="btn btn-success">Proceed to Checkout</a>
        </div>
    </div>

    <!-- Footer -->
    <footer class="footer">
        <p>&copy; 2024 FoodApp. All rights reserved.</p>
        <div class="social-icons">
            <a href="https://www.facebook.com/siva.katikam.1?mibextid=ZbWKwL" title="Facebook"><i class="fab fa-facebook-square"></i></a>
            <a href="https://x.com/Siva_im_7?t=6NH-MaD8mL-avCHSgfBRiw&s=09" title="Twitter"><i class="fab fa-twitter-square"></i></a>
            <a href="https://www.instagram.com/siva_im_7/?__pwa=1" title="Instagram"><i class="fab fa-instagram-square"></i></a>
        </div>
    </footer>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
