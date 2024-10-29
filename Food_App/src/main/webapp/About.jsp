<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - FoodApp</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .section {
            padding: 60px 0;
            background-color: #f0f4f8;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            margin-bottom: 30px;
            opacity: 0;
            transform: translateY(20px);
            transition: opacity 0.5s, transform 0.5s;
        }
        .section.visible {
            opacity: 1;
            transform: translateY(0);
        }
        .banner {
           	background: url('https://res.infoq.com/articles/who-is-on-the-team/en/headerimage/who-is-on-the-team-header-1612952290708.jpg') no-repeat center center;
            color: black;
            text-weight:bold;
            text-align: center;
            padding: 100px 20px;
            position: relative;
        }
        .banner::before {
            content: '';
            background-image: url('./images/banner-bg.png');
            background-size: cover;
            background-position: center;
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            opacity: 0.2;
            z-index: 0;
        }
        .banner h2, .banner p {
            position: relative;
            z-index: 1;
        }
        footer {
            background-color: #343a40;
            color: #fff;
            text-align: center;
            padding: 20px 0;
        }
        .icon {
            font-size: 40px;
            color: #5A6268;
            transition: color 0.3s;
        }
        .icon:hover {
            color: #007bff;
        }
    </style>
</head>
<body>

    <header class="bg-dark text-white text-center py-3">
        <h1>FoodApp</h1>
    </header>

    <section class="banner">
        <h2>About Us</h2>
        <p>We are passionate about delivering the best food experience.</p>
    </section>

    <section class="section" id="about-us">
        <div class="container text-center">
            <h2>About FoodApp</h2>
            <p>At FoodApp, we believe in the power of food to connect people and enrich lives...</p>
            <div class="mt-4">
                <i class="fas fa-utensils icon"></i>
                <i class="fas fa-heart icon mx-3"></i>
                <i class="fas fa-globe icon"></i>
            </div>
        </div>
    </section>

    <section class="section" id="our-mission">
        <div class="container text-center">
            <h2>Our Mission</h2>
            <p>At FoodApp, our mission is to connect food lovers with the best local restaurants...</p>
            <div class="mt-4">
                <i class="fas fa-bicycle icon"></i>
                <i class="fas fa-leaf icon mx-3"></i>
                <i class="fas fa-users icon"></i>
            </div>
        </div>
    </section>

    <section class="section" id="our-values">
        <div class="container text-center">
            <h2>Our Values</h2>
            <p>At FoodApp, our core values guide every decision we make...</p>
            <ul class="list-unstyled">
                <li><strong>Quality:</strong> We prioritize fresh ingredients and high standards.</li>
                <li><strong>Community:</strong> Supporting local businesses is at the heart of our mission.</li>
                <li><strong>Innovation:</strong> We're always looking for ways to improve your experience.</li>
                <li><strong>Integrity:</strong> We believe in honesty and transparency.</li>
                <li><strong>Customer Focus:</strong> Our users are our top priority.</li>
            </ul>
            <div class="mt-4">
                <i class="fas fa-star icon"></i>
                <i class="fas fa-hand-holding-heart icon mx-3"></i>
                <i class="fas fa-sync-alt icon"></i>
            </div>
        </div>
    </section>

    <section class="section" id="meet-our-team">
        <div class="container text-center">
            <h2>Meet Our Team</h2>
            <div class="row">
                <div class="col-md-4">
                    <div class="team-member">
                        <img src="images/WhatsApp Image 2024-08-31 at 03.16.13_12213b0f.jpg" alt="CEO" class="rounded-circle mb-3" style="width:150px;height:150px;">
                        <h4>Vijay</h4>
                        <p>CEO & Founder</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="team-member">
                        <img src="images/vija1.jpg" alt="CTO" class="rounded-circle mb-3" style="width:150px;height:150px;">
                        <h4>Vijay</h4>
                        <p>Chief Technology Officer</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="team-member">
                        <img src="images/vijay2.jpg" alt="CMO" class="rounded-circle mb-3" style="width:150px;height:150px;">
                        <h4>Vijay</h4>
                        <p>Head of Marketing</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="section" id="testimonials">
        <div class="container text-center">
            <h2>Customer Testimonials</h2>
            <p>"FoodApp has transformed the way I order food! The variety and quality are unmatched!" - <em>Rita</em></p>
            <p>"I love supporting local restaurants through FoodApp! The app is easy to use." - <em>James</em></p>
            <p>"The service is fantastic! I've had nothing but great experiences!" - <em>Alice</em></p>
            <p>"FoodApp has made my life so much easier. I can explore new restaurants!" - <em>Mark</em></p>
            <p>"The delivery is fast, and the food always arrives hot and fresh. Highly recommend!" - <em>Sara</em></p>
        </div>
    </section>

    <section class="section" id="join-us">
        <div class="container text-center">
            <h2>Join Us</h2>
            <p>If you are passionate about food and technology, consider joining our team!</p>
            <button class="btn btn-primary" onclick="showPopup()">Learn More</button>
            <p id="popup-message" style="display:none;" class="mt-3 alert alert-info">Thank you for your interest! Please check our Careers page for more details.</p>
        </div>
    </section>

    <footer>
        <p>&copy; 2024 FoodApp. All rights reserved.</p>
    </footer>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
        // Scroll animations
        window.addEventListener('scroll', function() {
            const sections = document.querySelectorAll('.section');
            sections.forEach(section => {
                const sectionTop = section.getBoundingClientRect().top;
                const windowHeight = window.innerHeight;
                if (sectionTop < windowHeight * 0.8) {
                    section.classList.add('visible');
                }
            });
        });

        // Show pop-up message
        function showPopup() {
            document.getElementById('popup-message').style.display = 'block';
            setTimeout(() => {
                document.getElementById('popup-message').style.display = 'none';
            }, 3000);
        }
    </script>
</body>
</html>
