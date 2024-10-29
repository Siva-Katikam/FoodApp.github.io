<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thank You!</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #f5f7fa, #c3cfe2);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .thank-you-container {
            text-align: center;
            background-color: #fff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
            animation: fadeIn 1s ease-in-out forwards;
            opacity: 0;
            max-width: 500px;
        }
        .thank-you-icon {
            font-size: 4em;
            color: #28a745;
        }
        h1 {
            font-size: 2.5em;
            color: #333;
            margin-top: 20px;
        }
        p {
            font-size: 1.2em;
            color: #666;
            margin-top: 10px;
        }
        .btn-container {
            margin-top: 30px;
        }
        .btn-custom {
            font-size: 1em;
            padding: 12px 25px;
            border-radius: 5px;
            transition: all 0.3s;
            margin: 10px;
        }
        .btn-main {
            background-color: #007bff;
            color: white;
        }
        .btn-main:hover {
            background-color: #0056b3;
        }
        .btn-secondary {
            background-color: #28a745;
            color: white;
        }
        .btn-secondary:hover {
            background-color: #218838;
        }
        /* Animation */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        /* Confetti Animation */
        .confetti {
            position: fixed;
            width: 15px;
            height: 15px;
            background: #ffc107;
            animation: fall 5s linear infinite;
        }
        .confetti:nth-child(2) { left: 20%; animation-delay: 0.2s; }
        .confetti:nth-child(3) { left: 40%; animation-delay: 0.4s; }
        .confetti:nth-child(4) { left: 60%; animation-delay: 0.6s; }
        .confetti:nth-child(5) { left: 80%; animation-delay: 0.8s; }
        @keyframes fall {
            0% { transform: translateY(-50px) rotate(0deg); opacity: 1; }
            100% { transform: translateY(100vh) rotate(360deg); opacity: 0; }
        }
    </style>
</head>
<body>
    <!-- Confetti elements -->
    <div class="confetti"></div>
    <div class="confetti"></div>
    <div class="confetti"></div>
    <div class="confetti"></div>
    <div class="confetti"></div>

    <div class="thank-you-container">
        <div class="thank-you-icon">🎉</div>
        <h1>Thank You!</h1>
        <p>Your feedback has been successfully submitted.</p>
        <p>We appreciate your effort to help us improve.</p>

        <div class="btn-container">
            <a href="HomePage.jsp" class="btn btn-main btn-custom">Back to Menu</a>
            
        </div>
    </div>

    <!-- jQuery and Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
