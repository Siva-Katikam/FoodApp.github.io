<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us</title>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
            background: url('https://images.unsplash.com/photo-1511637336339-d25ff9997c09') no-repeat center center fixed;
            background-size: cover;
            color: #333;
            animation: fadeIn 0.5s ease-in-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        .header {
            background-color: rgba(40, 167, 69, 0.8); /* Semi-transparent green */
            padding: 20px 0;
            text-align: center;
            animation: slideDown 0.6s ease;
        }

        .foodapp-logo {
            font-size: 3rem; /* Adjust font size of the logo */
            margin: 0; /* Remove default margin */
        }

        .foodapp-logo i {
            font-size: 3rem; /* Increase the font size of the thumbs-up symbol */
            vertical-align: middle; /* Align the thumbs-up symbol with the text */
            margin-left: 5px; /* Add some space between the text and the icon */
            color: white; /* Change color to white for better visibility */
        }

        h1 {
            color: #28a745; /* Green color for the header */
            margin-bottom: 30px;
            animation: zoomIn 0.5s ease;
            font-weight: bold; /* Make the text bold */
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5); /* Add a shadow for better readability */
        }

        @keyframes zoomIn {
            from { transform: scale(0.8); opacity: 0; }
            to { transform: scale(1); opacity: 1; }
        }

        .container {
            margin-top: 50px;
            padding: 30px;
            background: rgba(255, 255, 255, 0.9); /* White with transparency */
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.3);
            transition: transform 0.3s ease;
        }

        .container:hover {
            transform: translateY(-5px);
        }

        .btn-success {
            margin-top: 20px;
        }

        .alert {
            display: none; /* Initially hidden */
        }

        footer {
            background-color: rgba(40, 167, 69, 0.8);
            color: white;
            text-align: center;
            padding: 20px 0;
            position: relative;
            bottom: 0;
            width: 100%;
            animation: slideUp 0.6s ease;
        }

        @keyframes slideUp {
            from { transform: translateY(100%); }
            to { transform: translateY(0); }
        }

        .social-icons a {
            color: white;
            margin: 0 10px; /* Space between icons */
            text-decoration: none;
            font-size: 1.5rem; /* Icon size */
        }
    </style>
</head>
<body>
    <div class="header">
        <h1 class="foodapp-logo">
            <i class="fas fa-utensils"></i> FoodApp <i class="fas fa-thumbs-up"></i>
        </h1>
    </div>

    <div class="container">
        <h1>Contact Us</h1>
        <form id="contactForm">
            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" class="form-control" id="name" required>
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" class="form-control" id="email" required>
            </div>
            <div class="form-group">
                <label for="message">Message:</label>
                <textarea class="form-control" id="message" rows="5" required></textarea>
            </div>
            <button type="submit" class="btn btn-success">Send Message</button>
        </form>
        <div class="alert alert-success mt-3" id="successMessage">
            Your message has been sent successfully!
        </div>
    </div>

    <footer>
        <p>&copy; 2024 FoodApp. All rights reserved.</p>
        <div class="social-icons">
            <a href="#" title="Facebook"><i class="fab fa-facebook-square"></i></a>
            <a href="#" title="Twitter"><i class="fab fa-twitter-square"></i></a>
            <a href="#" title="Instagram"><i class="fab fa-instagram-square"></i></a>
        </div>
    </footer>

    <!-- Bootstrap and jQuery JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
        // JavaScript for form submission
        document.getElementById('contactForm').addEventListener('submit', function(event) {
            event.preventDefault(); // Prevent the default form submission
            
            // Show the success message with animation
            $('#successMessage').fadeIn().delay(3000).fadeOut(); // Show the success message
            this.reset(); // Reset the form fields
        });
    </script>
</body>
</html>
