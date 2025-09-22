<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Worker's Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
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
        .welcome-section {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }
        .section-title {
            font-size: 1.5rem;
            color: #495057;
            margin-bottom: 15px;
        }
        .job-card {
            background-color: #ffffff;
            padding: 15px;
            border-radius: 8px;
            margin-bottom: 15px;
            transition: transform 0.2s ease;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .job-card:hover {
            transform: scale(1.02);
        }
        .footer {
            background-color: #343a40;
            color: #ffffff;
            padding: 10px;
            text-align: center;
            margin-top: 20px;
        }
        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
        }
        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #004085;
        }
        /* Logout Button Styles */
    .logout-btn {
        background-color: #dc3545; /* Red color */
        color: #fff;
        border: none;
        font-size: 16px;
        padding: 8px 16px;
        border-radius: 5px;
        text-decoration: none;
    }

    .logout-btn:hover {
        background-color: #a71d2a; /* Darker red on hover */
        color: #fff;
        text-decoration: none;
    }
    </style>
</head>
<body>
    <!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="worker_home.jsp">${worker.name}'s Profile</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="worker_profile.jsp"><i class="bi bi-person-circle"></i> Profile</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="worker_notifications.jsp"><i class="bi bi-bell"></i> Notifications</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="worker_faqs.jsp"><i class="bi bi-question-circle"></i> FAQs</a>
                </li>
            </ul>
            <!-- Logout Button -->
            <a href="logout.jsp" class="btn btn-danger ms-3 logout-btn">Logout</a>
        </div>
    </div>
</nav>
    

    <!-- Main Content -->
    <div class="container mt-4">
        <!-- Welcome Section -->
        <div class="welcome-section">
            <%
    String flashMessage = (String) session.getAttribute("flashMessage");
    if (flashMessage != null) {
%>
    <div class="alert alert-success text-center" role="alert">
        <%= flashMessage %>
    </div>
<%
        session.removeAttribute("flashMessage");
    }
%>
            
            <h2>Welcome, <span style="color: #007bff;">
    		<%= session.getAttribute("workerName") != null ? session.getAttribute("workerName") : "Worker" %>
			</span>!</h2>
            <p><a href="worker_profile.jsp">Update your profile</a> to get more job opportunities.</p>
        </div>

        <!-- Job Opportunities -->
        <!-- Job Opportunities -->
<div>
    <h3 class="section-title">Job Opportunities</h3>
    
    <c:forEach var="job" items="${jobs}">
        <div class="job-card">
            <h5>${job.title}</h5>
            <p>Location: ${job.location} | Budget: $${job.budget} | Deadline: ${job.deadline}</p>
            <button class="btn btn-primary">Apply Now</button>
        </div>
    </c:forEach>
</div>
        

        <!-- My Bids/Applications -->
        <div>
            <h3 class="section-title">My Applications</h3>
            <table class="table">
                <thead>
                    <tr>
                        <th>Job Title</th>
                        <th>Status</th>
                        <th>Budget</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Floor Polishing</td>
                        <td><span class="badge bg-success">Accepted</span></td>
                        <td>$300</td>
                    </tr>
                    <tr>
                        <td>Painting Job</td>
                        <td><span class="badge bg-warning text-dark">Pending</span></td>
                        <td>$200</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Footer -->
    <div class="footer">
        &copy; 2024 Worker's Platform | All rights reserved.
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
