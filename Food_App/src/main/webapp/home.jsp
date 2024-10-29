<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList,java.util.Set,java.util.HashSet" %>
<%@ page import="com.foodapp.dto.Restaraunt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Restaurant Marketplace</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

    <!-- Custom CSS -->
    <style>
        body {
            background-color: #f5f5f5;
        }

        /* Navbar */
        .navbar {
            background-color: #232f3e;
            color: white;
        }

        .navbar a {
            color: white;
        }

        .navbar a:hover {
            text-decoration: underline;
        }

        /* Featured Section */
        .featured-section {
            padding: 50px 0;
            background-color: #fff;
            text-align: center;
        }

        .featured-section h2 {
        	text-align: center;
            font-size: 2.5em;
            margin-bottom: 40px;
            color: #333;
        }

        .carousel-item {
            height: 400px; /* Set a fixed height */
        }

        .carousel-image {
            height: 100%; /* Ensure the image takes full height of the carousel */
            object-fit: cover; /* Maintain aspect ratio and cover the area */
            border-radius: 10px; /* Rounded corners */
        }

        /* Top Cuisines Section */
        .cuisine-section {
            padding: 50px 0;
            background-image: url('https://example.com/cuisine-bg.jpg');
            background-size: cover;
            background-position: center;
            color: white;
            text-align: center;
            position: relative;
        }

        .cuisine-section::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: rgba(0, 0, 0, 0.5); /* Dark overlay */
            z-index: -1;
        }

        .cuisine-title {
            font-size: 2em;
            margin-bottom: 40px;
        }

        .cuisine-tile {
            transition: transform 0.3s, box-shadow 0.3s;
            padding: 15px;
            text-align: center;
            border-radius: 10px;
            cursor: pointer;
            background-color: rgba(255, 255, 255, 0.8);
            color: black;
        }

        .cuisine-tile:hover {
            transform: scale(1.05);
            box-shadow: 0 6px 16px rgba(0, 0, 0, 0.2);
        }

        .cuisine-tile i {
            font-size: 2em;
            margin-bottom: 10px;
            display: block;
            color: #ff9900;
        }

        /* Customer Testimonials Section */
        .testimonial-section {
            padding: 50px 0;
            position: relative;
            background-image: url('https://example.com/testimonial-bg.jpg');
            background-size: cover;
            background-position: center;
            color: white;
            z-index: 1;
        }

        .testimonial-section::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: -1;
        }

        .testimonial-section h2 {
            font-size: 2.5em;
            text-align: center;
            margin-bottom: 40px;
            color: white;
        }

        .testimonial {
            background-color: rgba(255, 255, 255, 0.2);
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 6px 16px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease-in;
            color: white;
        }

        .testimonial:hover {
            transform: translateY(-10px);
        }

        .stars {
            color: #ffa41c;
        }

        /* Restaurant Card Styling */
        .card {
            border: 1px solid #e1e1e1;
            border-radius: 10px;
            margin: 15px;
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .card:hover {
            transform: scale(1.03);
            box-shadow: 0 6px 16px rgba(0, 0, 0, 0.2);
        }

        .card img {
            height: 200px;
            object-fit: cover;
            border-radius: 10px 10px 0 0;
        }
		
		.text{
			text-align:center;
		}
        .view-menu-btn {
            padding: 10px 20px;
            background-color: #ff9900;
            border: none;
            color: white;
            border-radius: 5px;
            text-align: center;
        }

        .view-menu-btn:hover {
            background-color: #cc7a00;
        }

        /* Add to Cart Button */
        .add-to-cart-btn {
            background-color: #007600;
            color: white;
            padding: 8px 15px;
            border-radius: 5px;
            border: none;
        }

        .add-to-cart-btn:hover {
            background-color: #005700;
        }

        /* Footer */
        footer {
            background-color: #232f3e;
            color: white;
            padding: 20px 0;
            text-align: center;
        }

        footer i {
            font-size: 1.5em;
            margin: 0 10px;
            color: white;
            transition: color 0.3s;
        }

        footer i:hover {
            color: #ff9900;
        }
    </style>
</head>
<body>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark">
        <a class="navbar-brand" href="About.jsp">FoodApp</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
                
                <li class="nav-item">
                    <a class="nav-link" href="viewHistory"><i class="fas fa-history"></i>View History</a>
                </li>
                
                <li class="nav-item">
                    <a class="nav-link" href="viewOrderDetails.jsp"><i class="fas fa-shopping-cart"></i>Cart</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="Account.jsp"><i class="fas fa-user"></i>Account</a>
                </li>
            </ul>
        </div>
    </nav>

    
    <!-- Top Cuisines Section -->
    <section class="cuisine-section">
        <h2 class="cuisine-title">Explore Top Cuisines</h2>
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <div class="cuisine-tile">
                        <h4>Indian</h4>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="cuisine-tile">
                        <h4>South Korean</h4>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="cuisine-tile">
                        <h4>Mexican</h4>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Featured Dishes Section -->
    <section class="featured-dishes-section fade-in">
        <h2 class="text">Featured Dishes</h2>
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <div class="card dish-card">
                        <img src="https://media.istockphoto.com/id/1189709277/photo/pasta-penne-with-roasted-tomato-sauce-mozzarella-cheese-grey-stone-background-top-view.jpg?s=1024x1024&w=is&k=20&c=-cx2OEvdsCqs2TPK_EttPr7QZoTmeNww-Wa2njBeCR0=" class="card-img-top" alt="Dish 1">
                        <div class="card-body">
                            <h5 class="card-title">Spaghetti Carbonara</h5>
                            <p class="card-text">A classic Italian pasta dish with creamy sauce.</p>
                            
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card dish-card">
                        <img src="https://media.istockphoto.com/id/508032520/photo/sushi-set-nigiri-and-sashimi-with-tea.jpg?s=1024x1024&w=is&k=20&c=4XlxBHdLDYm6UkWdgfjK220YJE5JAYjFAgFJi6n0jbI=" class="card-img-top" alt="Dish 2">
                        <div class="card-body">
                            <h5 class="card-title">Sushi Platter</h5>
                            <p class="card-text">An assortment of fresh sushi and sashimi.</p>
                            
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card dish-card">
                        <img src="https://media.istockphoto.com/id/486548089/photo/melting-cheese-in-burger.jpg?s=1024x1024&w=is&k=20&c=rB1OQiPFkU48kRYeMBk_t7G6CMJUc8FdUkUWMQYGnE4=" class="card-img-top" alt="Dish 3">
                        <div class="card-body">
                            <h5 class="card-title">Cheeseburger</h5>
                            <p class="card-text">Juicy beef patty with cheese, lettuce, and tomato.</p>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Special Offers Section -->
    <section class="special-offers-section fade-in">
        <h2 class="text">Special Offers</h2>
        <p class="text">Check out our exclusive deals and discounts!</p>
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <div class="card">
                        <img src="https://media.istockphoto.com/id/1442417585/photo/person-getting-a-piece-of-cheesy-pepperoni-pizza.jpg?s=1024x1024&w=is&k=20&c=faq73viCFGvfpKxcBuHcOI8kyT99B-p-jScipke-VuQ=" class="card-img-top" alt="Offer 1">
                        <div class="card-body">
                            <h5 class="card-title">Buy 1 Get 1 Free</h5>
                            <p class="card-text">On all pizzas every Tuesday!</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <img src="https://media.istockphoto.com/id/1324465031/photo/high-angle-view-close-up-asian-woman-using-meal-delivery-service-ordering-food-online-with.jpg?s=1024x1024&w=is&k=20&c=SBTB9mNIoDe1Ua6OrZfnpY2ad52OdXdTfuRRM2IzVHI=" alt="Offer 2">
                        <div class="card-body">
                            <h5 class="card-title">20% Off on First Order</h5>
                            <p class="card-text">Get a discount on your first order!</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <img src="https://media.istockphoto.com/id/1206704220/vector/free-delivery-sign-free-shipping-service-icon-stock-vector.jpg?s=1024x1024&w=is&k=20&c=0ZbBpbCqH-Lecwfmez0NrodX6RYCyeM6o0SGtxKcQVA=" class="card-img-top" alt="Offer 3">
                        <div class="card-body">
                            <h5 class="card-title">Free Delivery</h5>
                            <p class="card-text">On orders above $50!</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
     <section>
     
    <!-- Restaurant Details Section -->
    <h2 class="text">Restaurants</h2>
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
                                        <a href="InnerMenuServlet?restaurantId=<%= res.getrId() %>" class="btn view-menu-btn">View Menu</a>
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
     
     </section>
    <!-- Upcoming Events Section -->
    <section class="events-section fade-in">
        <h2 class="text">Upcoming Events</h2>
        <p class="text">Join us for exciting food festivals and cooking classes!</p>
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <div class="card">
                        <img src="https://media.istockphoto.com/id/1399630042/photo/personal-perspective-shot-of-a-womans-hand-holding-a-bao-bun-with-tofu-at-a-street-market.jpg?s=1024x1024&w=is&k=20&c=yZtENpV8yqQowDvt2Gxx2JbQ2qeGjcLmLhR30UzQnEU=" class="card-img-top" alt="Event 1">
                        <div class="card-body">
                            <h5 class="card-title">Food Festival</h5>
                            <p class="card-text">Join us on November 15 for a day of fun and food!</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <img src="https://media.istockphoto.com/id/1268900953/photo/cooking-master-class-pasta-preparing-hands.jpg?s=1024x1024&w=is&k=20&c=lgM-guJgNGqE3F9NWt7T_l8cLoyPxdfQHe5pyfgD6Sk=" class="card-img-top" alt="Event 2">
                        <div class="card-body">
                            <h5 class="card-title">Cooking Class</h5>
                            <p class="card-text">Learn to cook Italian cuisine on December 30!</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <img src="https://media.istockphoto.com/id/1495390702/photo/happy-group-of-people-making-a-toast-at-a-wine-tasting.jpg?s=1024x1024&w=is&k=20&c=PFacMX6k4kuCd7h-_IWHFMVOTg9roMGqHv-SIS-EF0Q=" class="card-img-top" alt="Event 3">
                        <div class="card-body">
                            <h5 class="card-title">Wine Tasting</h5>
                            <p class="card-text">Experience the best wines on january 20!</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
	<!-- Customer Testimonials Section -->
    <section class="testimonial-section">
        <h2>What Our Customers Say</h2>
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <div class="testimonial">
                        <p>"Great service and amazing food! Delivery was quick and the dishes were fresh."</p>
                        <div class="stars">★★★★★</div>
                        <p>- John Doe</p>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="testimonial">
                        <p>"I love the variety of cuisines available. The app is easy to use and convenient."</p>
                        <div class="stars">★★★★★</div>
                        <p>- Jane Smith</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Footer -->
    <footer>
        <p>&copy; 2024 FoodApp. All rights reserved.</p>
        <div>
            <a href="https://www.facebook.com/siva.katikam.1?mibextid=ZbWKwL"><i class="fab fa-facebook"></i></a>
            <a href="https://x.com/Siva_im_7?t=6NH-MaD8mL-avCHSgfBRiw&s=09"><i class="fab fa-twitter"></i></a>
            <a href="https://www.instagram.com/siva_im_7/?__pwa=1"><i class="fab fa-instagram"></i></a>
        </div>
    </footer>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
