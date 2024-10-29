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
            width: 80%;
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
        }

        /* Styling for the table */
        .menu-table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        /* Table header styles */
        .menu-table th {
            background-color: #4CAF50;
            color: white;
            padding: 12px;
            text-align: left;
        }

        /* Table row styles */
        .menu-table td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        /* Table row hover effect */
        .menu-table tr:hover {
            background-color: #f1f1f1;
        }

        /* Menu image styling */
        .menu-image {
            width: 100px;
            height: 100px;
            object-fit: cover;
            border-radius: 4px;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
        }

        /* Message when no menu is found */
        .no-menu-msg {
            color: red;
            text-align: center;
            font-size: 18px;
            margin-top: 20px;
        }

        /* Link to go back to restaurant selection */
        .back-link {
            display: inline-block;
            margin-top: 20px;
            text-align: center;
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
            transition: background-color 0.3s;
        }

        /* Hover effect for the back link */
        .back-link:hover {
            background-color: #45a049;
        }

        /* Link container at the top */
        .link-container {
            text-align: right;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <div class="menu-container">
        <h1>Menu for Restaurant</h1>

        <!-- Add Menu link moved to the top -->
        <div class="link-container">
            <a href="AddMenu.html" class="back-link">Add Menu</a>
        </div>

        <!-- Retrieve the menuList from the session -->
        <%
            List<Menu> menuList = (List<Menu>) session.getAttribute("menuList");

            if (menuList != null && !menuList.isEmpty()) {
        %>

        <!-- Table to display the menu items -->
        <table class="menu-table">
            <thead>
                <tr>
                    <th>Item Name</th>
                    <th>Description</th>
                    <th>Price</th>
                    <th>Available</th>
                    <th>Image</th>
                </tr>
            </thead>
            <tbody>
                <!-- Loop through the menuList and display each item -->
                <%
                    for (Menu menu : menuList) {
                %>
                <tr>
                    <td><%= menu.getItemName() %></td> <!-- Display item name -->
                    <td><%= menu.getDiscription() %></td> <!-- Display description -->
                    <td>Rs:<%= menu.getPrice() %></td> <!-- Display price -->
                    <td><%= menu.isAvailable() ? "Yes" : "No" %></td> <!-- Display availability -->
                    <td>
                        <!-- If image path is available, display the image -->
                        <% if (menu.getImagePath() != null && !menu.getImagePath().isEmpty()) { %>
                            <img src="<%= menu.getImagePath() %>" alt="Menu Image" class="menu-image"/>
                        <% } else { %>
                            <span>No image available</span>
                        <% } %>
                    </td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>

        <%
            } else {
                // Display a message if no menu items are found for the restaurant
        %>
            <p class="no-menu-msg">No menu items found for this restaurant.</p>
        <%
            }
        %>

        <!-- Link to go back to the restaurant selection page -->
        <p><a href="home.jsp" class="back-link">Go back to restaurant selection</a></p>
    </div>
</body>
</html>
