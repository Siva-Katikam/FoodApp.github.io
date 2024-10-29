<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.foodapp.dto.Restaraunt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Home - Restaurant Management</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(135deg, #fcb045 0%, #fd1d1d 50%, #833ab4 100%);
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        h2 {
            text-align: center;
            background: linear-gradient(135deg, #ff6f61, #ff9a85);
            color: white;
            padding: 20px;
            margin: 0;
            font-size: 2em;
            border-radius: 10px 10px 0 0;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
        }

        .container-wrapper {
            background-color: #ffffff;
            border-radius: 15px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
            overflow: hidden;
            max-width: 1200px;
            width: 100%;
            margin: 20px;
        }

        .add-btn {
            display: block;
            width: fit-content;
            margin: 20px auto;
            padding: 10px 20px;
            font-size: 1em;
            color: white;
            background-color: #2ecc71;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            text-align: center;
            transition: background-color 0.3s ease, transform 0.3s ease;
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.1);
        }

        .add-btn:hover {
            background-color: #27ae60;
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.15);
        }

        .container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            margin: 20px;
            padding: 10px;
            gap: 20px;
        }

        .card {
            width: 300px;
            background: linear-gradient(135deg, #fff 0%, #fafafa 100%);
            border-radius: 15px;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.15);
            transition: transform 0.2s, box-shadow 0.2s;
            padding: 20px;
            text-align: center;
        }

        .card:hover {
            transform: translateY(-10px);
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.25);
        }

        .card img {
            width: 100%;
            height: 200px;
            object-fit: cover;
            border-radius: 10px;
            margin-bottom: 15px;
        }

        .card h3 {
            font-size: 1.5em;
            margin: 10px 0;
            color: #444;
            border-bottom: 2px solid #e0e0e0;
            padding-bottom: 10px;
        }

        .card p {
            font-size: 1em;
            margin: 10px 0;
            color: #555;
        }

        .card p strong {
            color: #000;
        }

        .card p .cuisine-type {
            color: #3498db;
        }

        .card p .delivery-time {
            color: #e74c3c;
        }

        .action-btns {
            display: flex;
            justify-content: space-around;
            margin-top: 15px;
        }

        .action-btns a {
            padding: 8px 16px;
            font-size: 0.9em;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }

        .view-menu-btn {
            background-color: #3498db;
        }

        .view-menu-btn:hover {
            background-color: #2980b9;
        }

        .edit-btn {
            background-color: #f1c40f;
        }

        .edit-btn:hover {
            background-color: #e1b40f;
        }

        .delete-btn {
            background-color: #e74c3c;
        }

        .delete-btn:hover {
            background-color: #c0392b;
        }

        @media (max-width: 768px) {
            .card {
                width: 90%;
            }
        }
    </style>
</head>
<body>
    <div class="container-wrapper">
        <h2>Admin Dashboard - Restaurant Management</h2>
        
        <!-- Styled "Add Restaurant" button -->
        <a href="AddRestaraunt.html" class="add-btn">Add Restaurant</a>

        <div class="container">
            <%!
                ArrayList<Restaraunt> restaurantList;
            %>

            <%
                // Fetch the restaurant list from session or request attribute
                restaurantList = (ArrayList<Restaraunt>) session.getAttribute("restaurantList");

                if (restaurantList != null && !restaurantList.isEmpty()) {
                    for (Restaraunt restaurant : restaurantList) {
            %>
                <div class="card">
                    <img src="<%= restaurant.getimgPath() %>" alt="Image of <%= restaurant.getname() %>" onerror="this.onerror=null; this.src='images/default.jpg';"> <!-- Added image -->

                    <h3><%= restaurant.getname() %></h3> 
                    <p><strong>RID:</strong> <%= restaurant.getrId() %></p>
                    <p class="cuisine-type"><strong>Cuisine Type:</strong> <%= restaurant.getCusineType() %></p>
                    <p class="delivery-time"><strong>Delivery Time:</strong> <%= restaurant.getDeliveryTime() %> mins</p>

                    <!-- Admin actions: View Menu, Edit Restaurant, Delete Restaurant -->
                    <div class="action-btns">
                        <a href="AdminMenu?restaurantId=<%= restaurant.getrId() %>" class="view-menu-btn">View Menu</a>
                        <a href="EditRestarauntServlet?restaurantId=<%= restaurant.getrId() %>" class="edit-btn">Edit</a>
                        <a href="DeleteRestaurantServlet?restaurantId=<%= restaurant.getrId() %>" class="delete-btn">Delete</a>
                    </div>
                </div>
            <%
                    }
                } else {
            %>
                <p>No restaurant data available.</p>
            <%
                }
            %>
        </div>
    </div>
</body>
</html>
