<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Client Home</title>

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
            background-color: #dc3545;
            color: #fff;
            border: none;
            padding: 8px 16px;
            border-radius: 5px;
            text-decoration: none;
        }
        .logout-btn:hover {
            background-color: #a71d2a;
        }
        .welcome-section, .main-section {
            padding: 20px;
        }
        .welcome-section {
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
            text-align: center;
        }
        .main-section h4 {
            margin-top: 20px;
            color: #343a40;
        }
        .card {
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .btn-custom {
            background-color: #007bff;
            color: #fff;
            border-radius: 5px;
        }
        .btn-custom:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Client Portal</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="client_transaction.jsp"><i class="bi bi-graph-up"></i> Transactions</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="post_jobs.jsp"><i class="bi bi-pencil-square"></i> Post Jobs</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="workers_list.jsp"><i class="bi bi-people"></i> Workers List</a>
                </li>
            </ul>
            <a href="logout.jsp" class="btn btn-danger ms-3 logout-btn">Logout</a>
        </div>
    </div>
</nav>

<!-- Welcome Section -->
<section class="welcome-section container">
    <% 
    String username = (String) session.getAttribute("username");
    String role = (String) session.getAttribute("role");
    if (username != null) {
%>
    <h1>Welcome, <%= username %>!</h1>
    <p>Your role is: <%= role %></p>
<% 
    } else {
%>
    <p>Please log in first.</p>
<% 
    }
%>
    
    <p>Complete your profile to get the best experience on our platform.</p>
    <a href="client_profile.jsp" class="btn btn-custom">Update Profile</a>
</section>

<!-- Main Section -->
<section class="main-section container">
    <!-- Search and Filter Workers -->
    <h4>Search for Workers</h4>
    <div class="input-group mb-3">
        <input type="text" class="form-control" placeholder="Search for skills, location, or ratings">
        <button class="btn btn-custom" type="button"><i class="bi bi-search"></i> Search</button>
    </div>

    <!-- Post a Job Section -->
    <h4>Post a Job</h4>
    <div class="card mb-3">
        <div class="card-body">
            <h5 class="card-title">Need help with a task?</h5>
            <p class="card-text">Post a job now to find skilled workers for your tasks.</p>
            <a href="post_jobs.jsp" class="btn btn-custom"><i class="bi bi-pencil-square"></i> Post a Job</a>
        </div>
    </div>

    <!-- My Posted Jobs Section -->
    <!-- My Posted Jobs Section -->
<h4>My Posted Jobs</h4>
<div class="card mb-3">
    <div class="card-body">
        <p>If you have posted jobs, click below to view them.</p>
        <a href="ClientJobsServlet" class="btn btn-custom"><i class="bi bi-briefcase"></i> View My Posted Jobs</a>
    </div>
</div>
    
    
</section>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
