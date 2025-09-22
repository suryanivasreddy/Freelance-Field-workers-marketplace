<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Post a Job</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">

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
        .container {
            margin-top: 30px;
        }
        .form-section {
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            padding: 30px;
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
            <a class="navbar-brand" href="#"><i class="bi bi-building"></i> Client Portal</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="client_home.jsp"><i class="bi bi-house-door-fill"></i> Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="client_transaction.jsp"><i class="bi bi-graph-up"></i> Transactions</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="post_jobs.jsp"><i class="bi bi-pencil-square"></i> Post Jobs</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="workers_list.jsp"><i class="bi bi-people-fill"></i> Workers List</a>
                    </li>
                </ul>
                <a href="logout.jsp" class="btn btn-danger ms-3 logout-btn">Logout</a>
            </div>
        </div>
    </nav>

    <!-- Post Job Form -->
    <div class="container">
        <div class="form-section">
            <h3 class="mb-4 text-center"><i class="bi bi-pencil-square"></i> Post a New Job</h3>
            <form action="submit_job.jsp" method="post">
                <div class="mb-3">
                    <label for="title" class="form-label">Job Title</label>
                    <input type="text" class="form-control" id="title" name="jobTitle" placeholder="Enter job title" required>
                </div>
                <div class="mb-3">
                    <label for="description" class="form-label">Job Description</label>
                    <textarea class="form-control" id="description" name="jobDescription" rows="4" placeholder="Describe the job" required></textarea>
                </div>
                <div class="mb-3">
                    <label for="location" class="form-label">Location</label>
                    <input type="text" class="form-control" id="location" name="location" placeholder="e.g., New York, Remote" required>
                </div>

                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="workType" class="form-label">Work Type</label>
                        <select class="form-select" id="workType" name="workType" required>
                            <option value="" disabled selected>Select work type</option>
                            <option value="Full-Time">Full-Time</option>
                            <option value="Part-Time">Part-Time</option>
                        </select>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="payType" class="form-label">Pay Type</label>
                        <select class="form-select" id="payType" name="payType" required>
                            <option value="" disabled selected>Select pay type</option>
                            <option value="Hourly">Hourly</option>
                            <option value="Per Day">Per Day</option>
                        </select>
                    </div>
                </div>

                <div class="mb-3">
                    <label for="budget" class="form-label">Budget ($)</label>
                    <input type="number" class="form-control" id="budget" name="budget" placeholder="Enter your budget" required>
                </div>
                <div class="mb-3">
                    <label for="deadline" class="form-label">Deadline</label>
                    <input type="date" class="form-control" id="deadline" name="deadline" required>
                </div>
                <button type="submit" class="btn btn-custom"><i class="bi bi-send-fill"></i> Post Job</button>
            </form>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
