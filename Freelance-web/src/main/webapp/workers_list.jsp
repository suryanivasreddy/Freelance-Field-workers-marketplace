<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Workers List</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Bootstrap CSS and Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Segoe UI', sans-serif;
        }
        .navbar {
            background-color: #343a40;
        }
        .navbar .nav-link, .navbar-brand {
            color: #ffffff !important;
        }
        .navbar .nav-link:hover {
            color: #ffc107 !important;
        }
        .logout-btn {
            background-color: #dc3545;
            color: #fff;
            border-radius: 5px;
            padding: 6px 14px;
            text-decoration: none;
        }
        .logout-btn:hover {
            background-color: #a71d2a;
        }
        .card {
            border: none;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.07);
            border-radius: 12px;
        }
        .table th {
            background-color: #343a40;
            color: white;
        }
        .table-striped > tbody > tr:nth-child(odd) {
            background-color: #f2f2f2;
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
                    <a class="nav-link active" href="workers_list.jsp"><i class="bi bi-people-fill"></i> Workers List</a>
                </li>
            </ul>
            <a href="logout.jsp" class="btn btn-danger ms-3 logout-btn">Logout</a>
        </div>
    </div>
</nav>

<!-- Workers List -->
<div class="container mt-5">
    <div class="card p-4">
        <h4 class="mb-4 text-center"><i class="bi bi-people-fill"></i> Registered Workers</h4>
        <div class="table-responsive">
            <table class="table table-striped align-middle text-center">
                <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col"><i class="bi bi-person-circle"></i> Name</th>
                        <th scope="col"><i class="bi bi-envelope"></i> Email</th>
                        <th scope="col"><i class="bi bi-telephone"></i> Phone</th>
                        <th scope="col"><i class="bi bi-tools"></i> Skills</th>
                        <th scope="col"><i class="bi bi-geo-alt"></i> Location</th>
                        <th scope="col"><i class="bi bi-calendar"></i> Available From</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- Dynamically render workers from the list -->
                    <c:forEach var="worker" items="${workerList}">
                        <tr>
                            <th scope="row">${worker.userId}</th>
                            <td>${worker.name}</td>
                            <td>${worker.email}</td>
                            <td>${worker.phone}</td>
                            <td>${worker.skills}</td>
                            <td>${worker.location}</td>
                            <td>${worker.joiningDate}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
