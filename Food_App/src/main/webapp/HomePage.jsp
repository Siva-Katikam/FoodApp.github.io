<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList,java.util.Set,java.util.HashSet" %>
<%@ page import="com.foodapp.dto.Restaraunt,com.foodapp.daoImpl.Cart " %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Food App - Home</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.1/font/bootstrap-icons.min.css" rel="stylesheet">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Arial:wght@400&family=Verdana:wght@400&display=swap" rel="stylesheet">

    <style>
        /* Custom Navbar Styling with Bootstrap Icon as Logo */
        .navbar {
            background-color: #343a40;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            transition: background-color 0.5s ease-in-out;
        }

        .navbar:hover {
            background-color: #495057;
        }

        .navbar .logo {
            font-size: 1.5rem;
            color: white;
            font-weight: bold;
            display: flex;
            align-items: center;
        }

        .navbar .logo .bi-basket3 {
            font-size: 2rem;
            margin-right: 10px;
        }

        .navbar-nav .nav-link {
            color: white !important;
            transition: color 0.3s ease-in-out;
        }

        .navbar-nav .nav-link:hover {
            background-color: #007bff;
            border-radius: 5px;
            color: #f8f9fa !important;
        }

        /* Body Background */
        body {
            background-color: #f8f9fa;
            font-family: 'Arial', sans-serif;
        }

        /* Jumbotron Section */
        .jumbotron {
            background: url('https://media.istockphoto.com/id/1404169915/photo/empty-glass-water-with-bokeh-background.jpg?s=612x612&w=0&k=20&c=suM509fqA7UVa0u4kHJhQr6uW45_HzlPDsjNDZYP7JQ=') no-repeat center center;
            background-size: cover;
            color: white;
            padding: 100px 0;
            text-align: center;
            box-shadow: inset 0 0 0 1000px rgba(0, 0, 0, 0.7);
            margin-bottom: 30px;
            animation: fadeIn 1.5s ease-in-out;
        }

        .jumbotron h1 {
            font-size: 4em;
            font-weight: bold;
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.5);
        }

        .jumbotron p {
            font-size: 1.5em;
            margin-top: 20px;
        }

        /* Ensure uniform card height */
        .card {
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            height: 100%;
        }

        /* Ensure uniform image height and card image fit */
        .card img {
            width: 100%;
            height: 200px; /* Fixed height for images */
            object-fit: cover; /* Ensures the image covers the area without stretching */
            border-radius: 10px 10px 0 0; /* Optional: Rounded corners for images */
        }

        /* Ensure the card body has consistent padding */
        .card-body {
            flex-grow: 1;
            padding: 15px;
            text-align: center;
        }

        /* Set minimum heights for content to align the text */
        .card-body h3 {
            min-height: 60px; /* Ensures all titles take the same space */
            font-size: 1.5em;
            margin-bottom: 10px;
        }

        .card-body p {
            min-height: 40px;
        }

        .view-menu-btn {
            background-color: #007bff;
            color: white;
        }

        .view-menu-btn:hover {
            background-color: #0056b3;
            color: white;
        }

        /* Animation Styles */
        .fadeIn {
            animation: fadeIn 1s ease-in-out forwards;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }

        .slideIn {
            animation: slideIn 0.5s ease-in-out forwards;
        }

        @keyframes slideIn {
            from {
                transform: translateY(20px);
                opacity: 0;
            }
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }

        /* Testimonials and Contact Section */
        .testimonial, .contact {
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            margin-bottom: 30px;
        }
    </style>
</head>
<body>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container-fluid">
            <a class="navbar-brand logo" href="About.jsp">
                <i class="bi bi-basket3"></i> FoodApp
            </a>
            <div class="navbar-nav">
                <a href="LoginPage.html" class="nav-link btn btn-success mx-2">
                    <i class="bi bi-box-arrow-in-right"></i> Login
                </a>
                <a href="RegisterPage.html" class="nav-link btn btn-primary">
                    <i class="bi bi-person-plus"></i> Register
                </a>
            </div>
        </div>
    </nav>

    <!-- Jumbotron Section -->
    <div class="jumbotron">
        <div class="container">
            <h1>Welcome to the Best Food Delivery Service</h1>
            <p>Order your favorite food from top restaurants near you</p>
        </div>
    </div>

    <!-- Restaurant Details Section -->
    <div class="container my-5">
        <div class="row">
            <% 
                ArrayList<Restaraunt> restaurantList = (ArrayList<Restaraunt>) session.getAttribute("restaurantList");
                if (restaurantList != null && !restaurantList.isEmpty()) {
                    Set<String> restaurantNames = new HashSet<>();
                    for (Restaraunt res : restaurantList) {
                        if (!restaurantNames.contains(res.getname())) {
                            restaurantNames.add(res.getname());
            %>
                            <div class="col-md-4 mb-4">
                                <div class="card fadeIn">
                                    <img src="<%= res.getimgPath() %>" alt="Image of <%= res.getname() %>">
                                    <div class="card-body">
                                        <h3><%= res.getname() %></h3>
                                        <p><strong>Cuisine:</strong> <%= res.getCusineType() %></p>
                                        <p><strong>Delivery Time:</strong> <%= res.getDeliveryTime() %> mins</p>
                                        <p><strong>Rating:</strong> ⭐⭐⭐⭐</p>
                                        <a href="MenuServlet?restaurantId=<%= res.getrId() %>" class="btn view-menu-btn">View Menu</a>
                                    </div>
                                </div>
                            </div>
            <%
                        }
                    }
                } else {
            %>
                <p class="text-center">No restaurants available at the moment.</p>
            <%
                }
            %>
        </div>
    </div>

    <!-- Testimonials Section -->
    <div class="container my-5">
        <h2 class="text-center">What Our Customers Say</h2>
        <div class="row">
            <div class="col-md-4">
                <div class="testimonial slideIn">
                    <p>"Great food and fast delivery!" - John Doe</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="testimonial slideIn">
                    <p>"I love the variety of cuisines!" - Jane Smith</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="testimonial slideIn">
                    <p>"Always my go-to app for food!" - Alice Brown</p>
                </div>
            </div>
        </div>
    </div>

    <!-- Contact Us Section -->
    <div class="container my-5">
        <h2 class="text-center">Contact Us</h2>
        <div class="contact fadeIn">
            <p>If you have any questions or feedback, feel free to reach out to us:</p>
            <form action="contact.jsp">
                <div class="mb-3">
                    <label for="name" class="form-label">Name</label>
                    <input type="text" class="form-control" id="name" required>
                </div>
                <div class="mb-3">
                    <label for="email" class="form-label">Email</label>
                    <input type="email" class="form-control" id="email" required>
                </div>
                <div class="mb-3">
                    <label for="message" class="form-label">Message</label>
                    <textarea class="form-control" id="message" rows="4" required></textarea>
                </div>
                <button type="submit" class="btn btn-primary">Send Message</button>
            </form>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
