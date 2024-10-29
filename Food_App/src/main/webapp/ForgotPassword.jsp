<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forgot Password</title>
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
        input {
            margin-bottom: 15px;
            border-radius: 10px;
            border: 2px solid rgba(255, 255, 255, 0.5);
            background-color: rgba(255, 255, 255, 0.2);
            color: #fff;
        }
        .btn-custom {
            background-color: #5c67f2;
            border: 2px solid transparent;
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
            <h1>Forgot Password</h1>
            <p>Please enter your email to receive a password reset link.</p>
            <form action="ForgotPassword" method="POST">
                <div class="form-group">
                    <input type="email" name="email" class="form-control" placeholder="Email" required>
                </div>
                <button type="submit" class="btn btn-custom btn-block">Send Reset Link</button>
            </form>
            <p class="mt-3"><a href="LoginPage.html" style="color: #5c67f2;">Back to Login</a></p>
        </div>
    </div>
    <div class="footer">
        <p>&copy; 2024 Food App. All rights reserved.</p>
    </div>
</body>
</html>
    