<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.foodapp.dto.User" %>
<%@ page session="true" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Account</title>
    <style>
        /* General Styles */
        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(135deg, #f3f4f7, #e2e4e9);
            margin: 0;
            padding: 0;
            animation: fadeIn 0.6s ease;
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        /* Container Styles */
        .container {
            width: 80%;
            max-width: 600px;
            margin: 50px auto;
            background: #fff;
            border-radius: 15px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            padding: 30px;
            position: relative;
            overflow: hidden;
            animation: slideIn 0.7s ease;
        }

        @keyframes slideIn {
            from { transform: translateY(-50px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }

        /* Title Styles */
        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        /* Card Styles */
        .card {
            background: #f9f9f9;
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 20px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            transition: transform 0.2s;
        }

        .card:hover {
            transform: translateY(-5px);
        }

        /* Form Styles */
        .form-group {
            margin-bottom: 15px;
        }

        label {
            font-weight: bold;
            color: #555;
        }

        input[type="text"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            transition: border-color 0.3s;
        }

        input[type="text"]:focus {
            border-color: #007bff;
            outline: none;
        }

        /* Button Styles */
        .btn {
            display: block;
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 5px;
            color: #fff;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.2s;
            text-align: center;
            margin-top: 10px;
        }

        .btn-primary {
            background-color: #007bff;
        }

        .btn-primary:hover {
            background-color: #0056b3;
            transform: translateY(-2px);
        }

        .btn-danger {
            background-color: #dc3545;
        }

        .btn-danger:hover {
            background-color: #c82333;
            transform: translateY(-2px);
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

<%
    // Ensure the user is logged in
    User user = (User) session.getAttribute("user");

    if (user == null) {
        response.sendRedirect("login.jsp");  // If not logged in, redirect to login page
    } else {
        // Display user details from the session
%>

<div class="container">
    <h2>User Account</h2>

    <div class="card">
        <h4>User Details</h4>
        <p><strong>Name:</strong> <%= user.getUser_name() %></p>
        <p><strong>Email:</strong> <%= user.getEmail() %></p>
        <p><strong>Address:</strong> <%= user.getAdress() %></p>

        <!-- Edit Address Form -->
        <form action="UpdateAddressServlet" method="post">
            <div class="form-group">
                <label for="address">Edit Address:</label>
                <input type="text" class="form-control" id="address" name="address" value="<%= user.getAdress() %>" required>
            </div>
            <input type="hidden" name="userId" value="<%= user.getUser_name() %>">
            <button type="submit" class="btn btn-primary">Edit Address</button>
        </form>
    </div>

    <div class="card">
        <!-- Logout Button -->
        <form action="LogoutServlet" method="post">
            <button type="submit" class="btn btn-danger">Log Out</button>
        </form>
    </div>
</div>

<%
    }
%>

</body>
</html>
