<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.foodapp.dto.Restaraunt" %>

<%
    // Assuming the restaurant details are fetched using a request attribute "restaurant"
    Restaraunt restaurant = (Restaraunt) request.getAttribute("restaurant");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Restaurant</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(135deg, #fcb045, #fd1d1d, #833ab4);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        form {
            background-color: #fff;
            padding: 20px;
            border-radius: 15px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
            max-width: 500px;
            width: 100%;
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        input[type="text"], input[type="number"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        input[type="submit"] {
            background-color: #3498db;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
            margin-top: 20px;
        }
    </style>
</head>
<body>

<form action="EditRestarauntServlet" >
    <h2>Edit Restaurant</h2>
    <input type="hidden" name="rId" value="<%= restaurant.getrId() %>">
    
    <label for="name">Restaurant Name:</label>
    <input type="text" name="name" id="name" value="<%= restaurant.getname() %>" required>

    <label for="cuisineType">Cuisine Type:</label>
    <input type="text" name="cuisineType" id="cuisineType" value="<%= restaurant.getCusineType() %>" required>

    <label for="deliveryTime">Delivery Time (mins):</label>
    <input type="number" name="deliveryTime" id="deliveryTime" value="<%= restaurant.getDeliveryTime() %>" required>

    <label for="rating">Rating:</label>
    <input type="number" name="rating" id="rating" min="1" max="5" value="<%= restaurant.getRating() %>" required>

    <label for="imgPath">Image Path:</label>
    <input type="text" name="imgPath" id="imgPath" value="<%= restaurant.getimgPath() %>">

    <input type="submit" value="Update Restaurant">
</form>

</body>
</html>
