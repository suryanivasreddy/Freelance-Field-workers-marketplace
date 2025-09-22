<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ratings and Reviews</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Custom CSS -->
    <style>
        body {
            background-color: #f9f9f9;
            font-family: Arial, sans-serif;
        }

        .navbar {
            background-color: #343a40;
        }

        .navbar .nav-link, .navbar-brand {
            color: #ffffff !important;
        }

        .navbar .nav-link:hover {
            color: #f9c74f !important;
        }

        .logout-btn {
            background-color: #dc3545; /* Red color */
            color: #fff;
            border: none;
            padding: 8px 16px;
            border-radius: 5px;
            text-decoration: none;
        }

        .logout-btn:hover {
            background-color: #a71d2a; /* Darker red on hover */
        }

        .container {
            padding: 20px;
        }

        .rating-container {
            margin-bottom: 30px;
        }

        .star-rating i {
            font-size: 30px;
            color: #f0ad4e;
            cursor: pointer;
        }

        .star-rating i:hover {
            color: #d39e00;
        }

        .btn-custom {
            background-color: #007bff;
            color: #fff;
            border-radius: 5px;
        }

        .btn-custom:hover {
            background-color: #0056b3;
        }

        .review-section {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .review-section textarea {
            width: 100%;
            height: 150px;
            margin-bottom: 20px;
            padding: 10px;
            font-size: 16px;
            border-radius: 5px;
            border: 1px solid #ccc;
            resize: none;
        }

        .review-section .btn-submit {
            background-color: #28a745;
            color: white;
            font-size: 16px;
        }
    </style>
</head>
<body>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Client Portal</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="client_home.jsp"><i class="bi bi-house-door"></i> Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="client_chats.jsp"><i class="bi bi-chat-left-text"></i> Chat Access</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#"><i class="bi bi-star"></i> Ratings and Reviews</a>
                    </li>
                </ul>
                <a href="logout.jsp" class="btn btn-danger ms-3 logout-btn">Logout</a>
            </div>
        </div>
    </nav>

    <!-- Ratings & Reviews Section -->
    <div class="container">
        <h2 class="text-center my-4">Rate Your Worker</h2>

        <!-- Rating Section -->
        <div class="rating-container">
            <h4>Rate the Worker:</h4>
            <div class="star-rating">
                <i class="bi bi-star-fill" data-value="1"></i>
                <i class="bi bi-star-fill" data-value="2"></i>
                <i class="bi bi-star-fill" data-value="3"></i>
                <i class="bi bi-star-fill" data-value="4"></i>
                <i class="bi bi-star-fill" data-value="5"></i>
            </div>
            <input type="hidden" id="ratingValue" value="0">
        </div>

        <!-- Review Section -->
        <div class="review-section">
            <h4>Leave a Review:</h4>
            <textarea id="reviewText" placeholder="Write your feedback here..."></textarea>
            <button class="btn btn-submit" id="submitReview">Submit Review</button>
        </div>

        <!-- Success/Failure Message -->
        <div id="message" class="alert alert-info mt-4" style="display: none;"></div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <script>
        // Star rating interaction
        const stars = document.querySelectorAll('.star-rating i');
        let ratingValue = document.getElementById('ratingValue');
        
        stars.forEach(star => {
            star.addEventListener('click', function () {
                ratingValue.value = this.getAttribute('data-value');
                updateStarColors(this.getAttribute('data-value'));
            });
        });

        // Function to highlight the clicked stars
        function updateStarColors(value) {
            stars.forEach(star => {
                if (star.getAttribute('data-value') <= value) {
                    star.style.color = '#ffc107'; // Golden yellow
                } else {
                    star.style.color = '#ccc'; // Light gray
                }
            });
        }

        // Submit review
        document.getElementById('submitReview').addEventListener('click', function () {
            const reviewText = document.getElementById('reviewText').value.trim();
            const rating = ratingValue.value;

            if (rating === "0" || reviewText === "") {
                alert("Please provide a rating and a review.");
                return;
            }

            // Simulate form submission (this would be a real submission in a real scenario)
            document.getElementById('message').style.display = 'block';
            document.getElementById('message').innerText = 'Thank you for your review!';

            // Reset form fields
            document.getElementById('reviewText').value = '';
            updateStarColors(0);
            ratingValue.value = "0";
        });
    </script>
</body>
</html>
