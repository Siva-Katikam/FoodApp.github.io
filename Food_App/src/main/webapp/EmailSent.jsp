<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Email Sent</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background: url('https://images.pexels.com/photos/3184295/pexels-photo-3184295.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1') no-repeat center center;
            background-size: cover;
            color: #fff;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            height: 100vh;
            overflow: hidden;
        }
        .login-container {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100%;
            backdrop-filter: blur(10px);
        }
        .form-container {
            background-color: rgba(0, 0, 0, 0.8);
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 4px 30px rgba(0, 0, 0, 0.5);
            width: 100%;
            max-width: 400px;
            text-align: center;
        }
        .footer {
            position: absolute;
            bottom: 20px;
            width: 100%;
            text-align: center;
            color: #ddd;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <div class="form-container">
            <h1>Email Sent</h1>
            <p>A password reset link has been sent to your email address.</p>
            <p>Please check your inbox and follow the instructions.</p>
            <a href="LoginPage.html" class="btn btn-custom">Back to Login</a>
        </div>
    </div>
    <div class="footer">
        <p>&copy; 2024 Food App. All rights reserved.</p>
    </div>
</body>
</html>
