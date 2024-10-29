<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.foodapp.dto.User, com.foodapp.dao.UserDAO, com.foodapp.daoImpl.UserDAOImpl" %>
<%@ page session="true" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Address</title>
    <style>
        /* Body styling */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            animation: fadeIn 0.8s ease-in-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        /* Container styling */
        .container {
            width: 40%;
            margin: 80px auto;
            background: #fff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
            animation: slideInFromBottom 0.9s ease-out;
        }

        @keyframes slideInFromBottom {
            from { transform: translateY(50px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }

        /* Header styling */
        h2 {
            text-align: center;
            font-size: 2rem;
            margin-bottom: 20px;
            color: #343a40;
        }

        /* Form styling */
        .form-group {
            margin-bottom: 25px;
        }

        label {
            font-weight: bold;
            color: #555;
        }

        input[type="text"] {
            width: 100%;
            padding: 12px 15px;
            font-size: 1rem;
            border: 1px solid #ccc;
            border-radius: 5px;
            transition: border-color 0.3s ease;
        }

        input[type="text"]:focus {
            border-color: #007bff;
            outline: none;
        }

        /* Button styling */
        .btn {
            width: 100%;
            padding: 12px 15px;
            font-size: 1.1rem;
            border: none;
            border-radius: 5px;
            transition: background-color 0.3s ease, transform 0.2s ease;
            cursor: pointer;
        }

        .btn-primary {
            background-color: #007bff;
            color: white;
        }

        .btn-primary:hover {
            background-color: #0056b3;
            transform: scale(1.05);
        }

        .btn-secondary {
            background-color: #6c757d;
            color: white;
            margin-top: 15px;
        }

        .btn-secondary:hover {
            background-color: #5a6268;
            transform: scale(1.05);
        }

        .btn:active {
            transform: scale(0.98);
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .container {
                width: 80%;
                padding: 20px;
            }
        }

        @media (max-width: 576px) {
            .container {
                width: 90%;
            }

            h2 {
                font-size: 1.8rem;
            }
        }
    </style>
</head>
<body>

<%
    UserDAO userDao = new UserDAOImpl();
    User user = (User) session.getAttribute("user");

    if (user == null) {
        response.sendRedirect("login.jsp");  // If not logged in, redirect to login page
    }
%>

<div class="container">
    <h2>Edit Your Address</h2>

    <form action="UpdateAddressServlet" method="post">
        <div class="form-group">
            <label for="address">New Address:</label>
            <input type="text" id="address" name="address" value="<%= user.getAdress() %>" required>
        </div>
        <input type="hidden" name="userId" value="<%= user.getUser_name() %>">
        <button type="submit" class="btn btn-primary">Update Address</button>
    </form>

    <a href="Account.jsp" class="btn btn-secondary">Back to Account</a>
</div>

</body>
</html>
