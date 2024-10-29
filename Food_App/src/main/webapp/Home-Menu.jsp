<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.foodapp.dto.Menu" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Restaurant Menu</title>
    <style>
        /* Container for the entire menu */
        .menu-container {
            width: 90%;
            margin: 0 auto;
            padding: 20px;
            font-family: Arial, sans-serif;
            background-color: #f8f8f8;
            border-radius: 8px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        }

        /* Heading style */
        .menu-container h1 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
            font-size: 2.5rem;
        }

        /* Grid layout for cards */
        .menu-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 20px;
        }

        /* Card styles */
        .menu-card {
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 15px;
            background-color: white;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            transition: box-shadow 0.3s;
        }

        .menu-card:hover {
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
        }

        /* Image styles */
        .menu-image {
            width: 100%;
            height: 150px;
            object-fit: cover;
            border-radius: 4px;
            margin-bottom: 10px;
        }

        /* Button styling */
        .cart-btn {
            background-color: #4CAF50;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.2s;
            width: 100%;
        }

        .cart-btn:hover {
            background-color: #45a049;
            transform: translateY(-2px);
        }

        /* No menu message styling */
        .no-menu-msg {
            color: red;
            text-align: center;
            font-size: 1.5rem;
            margin-top: 20px;
        }

        /* Back link styling */
        .back-link {
            display: inline-block;
            margin-top: 20px;
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
            transition: background-color 0.3s, transform 0.2s;
        }

        .back-link:hover {
            background-color: #45a049;
            transform: translateY(-2px);
        }

        /* Modal styling */
        .modal {
            display: none;
            position: fixed;
            z-index: 1000;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            justify-content: center;
            align-items: center;
        }

        .modal-content {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            text-align: center;
            width: 80%;
            max-width: 400px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
        }

        .close-btn {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 20px;
            margin-top: 20px;
            border-radius: 5px;
            cursor: pointer;
        }

        .close-btn:hover {
            background-color: #45a049;
        }
    </style>
    <script>
        // Show the modal on page load
        window.onload = function() {
            document.getElementById("loginModal").style.display = "flex";
        };

        // Close the modal
        function closeModal() {
            document.getElementById("loginModal").style.display = "none";
        }
    </script>
</head>
<body>

    <!-- Modal for login message -->
    <div id="loginModal" class="modal">
        <div class="modal-content">
            <p>Please log in to order or add items to the cart.</p>
            <button class="close-btn" onclick="closeModal()">OK</button>
        </div>
    </div>

    <div class="menu-container">
        <h1>Menu for Restaurant</h1>

        <!-- Retrieve the menuList from the session -->
        <%
            List<Menu> menuList = (List<Menu>) session.getAttribute("menuList");

            if (menuList != null && !menuList.isEmpty()) {
        %>

        <!-- Display each menu item as a card in a grid -->
        <div class="menu-grid">
        <%
            for (Menu menu : menuList) {
        %>
        <div class="menu-card">
            <img src="<%= menu.getImagePath() != null && !menu.getImagePath().isEmpty() ? menu.getImagePath() : "default-image.jpg" %>" alt="Menu Image" class="menu-image"/>
            <div class="menu-text">
                <h2><%= menu.getItemName() %></h2>
                <p><%= menu.getDiscription() %></p>
                <p><strong>Price:</strong> Rs:<%= menu.getPrice() %></p>
                <p><strong>Available:</strong> <%= menu.isAvailable() ? "Yes" : "No" %></p>
            </div>
            <div>
                <form id="cartForm<%= menu.getItemId() %>" action="Cart?itemId=<%= menu.getItemId() %>" method="post">
                    <input type="hidden" name="itemName" value="<%= menu.getItemName() %>">
                    <input type="hidden" name="price" value="<%= menu.getPrice() %>">
                  
                </form>
            </div>
        </div>
        <%
            }
        %>
        </div>

        <%
            } else {
        %>
            <p class="no-menu-msg">No menu items found for this restaurant.</p>
        <%
            }
        %>

        <p><a href="HomePage.jsp" class="back-link">Go back to restaurant selection</a></p>
    </div>
</body>
</html>
