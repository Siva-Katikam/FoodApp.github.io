<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.foodapp.dto.Menu" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Restaurant Menu</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        /* Global Styling */
        body {
            background-color: #f4f4f4;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            animation: fadeIn 1s ease-in-out;
        }

        /* Header styling */
        .header {
            background-color: rgba(40, 167, 69, 0.9);
            color: white;
            padding: 20px;
            text-align: center;
        }

        .foodapp-logo {
            font-size: 2.5rem;
            font-weight: bold;
        }

        /* Footer styling */
        .footer {
            background-color: rgba(40, 167, 69, 0.9);
            color: white;
            text-align: center;
            padding: 15px 0;
            position: fixed;
            width: 100%;
            bottom: 0;
            left: 0;
        }

        .social-icons a {
            color: white;
            margin: 0 8px;
            font-size: 1.5rem;
        }

        /* Main container */
        .menu-container {
            width: 80%;
            margin: 80px auto 120px;
            padding: 30px;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        }

        /* Table styling */
        .menu-table {
            width: 100%;
            border-collapse: collapse;
        }

        .menu-table th, .menu-table td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        .menu-table th {
            background-color: rgba(40, 167, 69, 0.9);
            color: white;
        }

        .menu-image {
            width: 100px;
            height: 100px;
            object-fit: cover;
            border-radius: 4px;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
        }

        /* Add to Cart button styling */
        .cart-btn {
            background-color: #28a745;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.2s ease;
        }

        .cart-btn:hover {
            background-color: #218838;
            transform: scale(1.05);
        }

        /* Pop-up message styling */
        .popup-message {
            visibility: hidden;
            background-color: #333;
            color: #fff;
            text-align: center;
            padding: 10px;
            border-radius: 5px;
            position: fixed;
            top: 20px;
            left: 50%;
            transform: translateX(-50%);
            z-index: 1;
        }

        .popup-message.show {
            visibility: visible;
            animation: fadeOut 2s forwards 1s;
        }

        /* Recommendation section styling */
        .recommendation-section {
            margin-top: 30px;
            text-align: center;
            background-color: #e8f5e9;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        }

        .recommendation-section h2 {
            color: #333;
            font-size: 24px;
            margin-bottom: 20px;
        }

        /* Animations */
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        @keyframes fadeOut {
            0% { opacity: 1; }
            100% { opacity: 0; }
        }
    </style>
    <script>
        function showPopup() {
            const popup = document.getElementById("popupMessage");
            popup.classList.add("show");
            setTimeout(() => popup.classList.remove("show"), 3000);
        }
    </script>
</head>
<body>

    <!-- Header -->
    <div class="header">
        <h1 class="foodapp-logo">FoodApp <i class="fas fa-utensils"></i></h1>
    </div>

    <div class="menu-container">
        <h1>Menu for Restaurant</h1>

        <!-- Retrieve the menuList from the session -->
        <%
            List<Menu> menuList = (List<Menu>) session.getAttribute("menuList");
            if (menuList != null && !menuList.isEmpty()) {
        %>

        <!-- Table to display menu items -->
        <table class="menu-table">
            <thead>
                <tr>
                    <th>Item Name</th>
                    <th>Description</th>
                    <th>Price</th>
                    <th>Available</th>
                    <th>Image</th>
                    <th>Quantity</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (Menu menu : menuList) {
                %>
                <tr>
                    <td><%= menu.getItemName() %></td>
                    <td><%= menu.getDiscription() %></td>
                    <td>Rs:<%= menu.getPrice() %></td>
                    <td><%= menu.isAvailable() ? "Yes" : "No" %></td>
                    <td>
                        <% if (menu.getImagePath() != null && !menu.getImagePath().isEmpty()) { %>
                            <img src="<%= menu.getImagePath() %>" alt="Menu Image" class="menu-image"/>
                        <% } else { %>
                            <span>No image available</span>
                        <% } %>
                    </td>
                    <td>
                        <input type="number" name="quantity" value="1" min="1" style="width: 50px;" form="cartForm<%= menu.getItemId() %>">
                    </td>
                    <td>
                        <form id="cartForm<%= menu.getItemId() %>" action="Cart?itemId=<%= menu.getItemId() %>" method="post" onsubmit="showPopup()">
                            <input type="hidden" name="itemName" value="<%= menu.getItemName() %>">
                            <input type="hidden" name="price" value="<%= menu.getPrice() %>">
                            <input type="hidden" name="act" value="add">
                            <input type="submit" value="Add to Cart" class="cart-btn">
                        </form>
                    </td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>

        <%
            } else {
        %>
            <p>No menu items found for this restaurant.</p>
        <%
            }
        %>

        <!-- Recommendation Section -->
        <div class="recommendation-section">
            <h2>Recommended Dishes</h2>
            <p>Explore our popular choices that customers love!</p>
            <!-- Add popular dish images or additional content -->
        </div>
    </div>

    <!-- Footer -->
    <footer class="footer">
        <p>&copy; 2024 FoodApp. All rights reserved.</p>
        <div class="social-icons">
            <a href="https://www.facebook.com/siva.katikam.1?mibextid=ZbWKwL" title="Facebook"><i class="fab fa-facebook-square"></i></a>
            <a href="#" title="Twitter"><i class="fab fa-twitter-square"></i></a>
            <a href="#" title="Instagram"><i class="fab fa-instagram-square"></i></a>
        </div>
    </footer>

    <!-- Pop-up confirmation message -->
    <div id="popupMessage" class="popup-message">Item added to cart!</div>

</body>
</html>
