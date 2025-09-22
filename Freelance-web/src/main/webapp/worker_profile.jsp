<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>${worker.name}'s Profile</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap & Icons -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
    <!-- Styles -->
    <style>
    :root {
        --primary-color: #007bff;
        --secondary-color: #0056b3;
        --bg-color: #f2f2f2;
        --text-color: #343a40;
        --card-bg: #ffffff;
        --border-radius: 15px;
        --box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
    }

    body {
        background-color: var(--bg-color);
        font-family: 'Segoe UI', sans-serif;
        margin: 0;
        padding: 0;
    }

    .navbar {
        background-color: var(--text-color);
    }

    .navbar-brand, .nav-link {
        color: #fff !important;
    }

    .nav-link:hover {
        color: #ffc107 !important;
    }

    .profile-container {
        max-width: 900px;
        margin: 40px auto;
        background-color: var(--card-bg);
        border-radius: var(--border-radius);
        box-shadow: var(--box-shadow);
        padding: 30px;
    }

    .profile-header {
        display: flex;
        flex-direction: row;
        justify-content: space-between;
        align-items: center;
        flex-wrap: wrap;
    }

    .profile-header h3 {
        color: var(--text-color);
        margin-bottom: 20px;
        font-weight: 600;
    }

    .profile-photo {
        width: 120px;
        height: 120px;
        border-radius: 50%;
        object-fit: cover;
        border: 3px solid var(--primary-color);
    }

    .profile-info {
        margin-top: 20px;
    }

    .profile-info p {
        font-size: 16px;
        margin-bottom: 10px;
        color: #555;
    }

    .profile-info i {
        width: 25px;
        color: var(--primary-color);
        margin-right: 8px;
    }

    .btn-edit {
        background-color: var(--primary-color);
        color: #fff;
        border-radius: 8px;
        padding: 8px 20px;
        transition: background-color 0.3s ease;
    }

    .btn-edit:hover {
        background-color: var(--secondary-color);
    }

    #editSection {
        display: none;
        margin-top: 40px;
        border-top: 1px solid #ccc;
        padding-top: 30px;
    }

    .form-group {
        position: relative;
        margin-bottom: 20px;
    }

    .form-group i {
        position: absolute;
        top: 12px;
        left: 15px;
        color: var(--primary-color);
    }

    .form-group input,
    .form-group select {
        padding-left: 40px;
        height: 45px;
        border-radius: 10px;
        border: 1px solid #ccc;
        width: 100%;
    }

    .btn-save {
        background-color: var(--primary-color);
        color: white;
        border-radius: 10px;
        padding: 10px 25px;
        transition: background-color 0.3s ease;
    }

    .btn-save:hover {
        background-color: var(--secondary-color);
    }

    @media (max-width: 576px) {
        .profile-header {
            flex-direction: column;
            align-items: flex-start;
        }

        .profile-photo {
            margin-top: 15px;
        }

        .text-right {
            text-align: center !important;
        }
    }
</style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark">
    <a class="navbar-brand" href="worker_home.jsp"><i class="fas fa-tools"></i> Worker Dashboard</a>
    <div class="collapse navbar-collapse justify-content-end">
        <ul class="navbar-nav">
            <li class="nav-item"><a class="nav-link" href="worker_home.jsp"><i class="fas fa-home"></i> Home</a></li>
            <li class="nav-item"><a class="nav-link" href="logout.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a></li>
        </ul>
    </div>
</nav>

<!-- Profile Section -->
<div class="profile-container">
    <div class="profile-header">
        <h3><i class="fas fa-user"></i> ${worker.name}'s Profile</h3>
        <img src="${worker.photoPath}" alt="Profile Photo" class="profile-photo">
    </div>

    <div class="profile-info mt-3">
        <p><i class="fas fa-id-badge"></i> <strong>Worker ID:</strong> ${worker.workerId}</p>
        <p><i class="fas fa-briefcase"></i> <strong>Job Role:</strong> ${worker.jobRole}</p>
        <p><i class="fas fa-envelope"></i> <strong>Email:</strong> ${worker.email}</p>
        <p><i class="fas fa-phone-alt"></i> <strong>Phone:</strong> ${worker.phone}</p>
        <p><i class="fas fa-map-marker-alt"></i> <strong>Location:</strong> ${worker.location}</p>
        <p><i class="fas fa-calendar-alt"></i> <strong>Joining Date:</strong> ${worker.joiningDate}</p>
        <p><i class="fas fa-star"></i> <strong>Rating:</strong> 
            <span class="text-warning">
                ★★★★☆ (${worker.rating})
            </span>
        </p>
    </div>

    <!-- Edit Button -->
    <div class="text-right mt-3">
        <button class="btn btn-edit" onclick="toggleEdit()"><i class="fas fa-edit"></i> Edit Profile</button>
    </div>

    <!-- Embedded Edit Form Section -->
    <div id="editSection">
        <h4 class="mb-3"><i class="fas fa-user-edit"></i> Update Your Information</h4>
        <!-- Updated form fields with placeholders -->
        <form action="EditWorkerProfileServlet" method="post">
            <input type="hidden" name="userId" value="${worker.userId}">
            
            <div class="form-group position-relative">
                <i class="fas fa-user"></i>
                <input type="text" class="form-control" name="name" value="${worker.name}" required placeholder="Enter full name">
            </div>
            
            <div class="form-group position-relative">
                <i class="fas fa-id-badge"></i>
                <input type="text" class="form-control" name="workerId" value="${worker.workerId}" readonly placeholder="Worker ID (read-only)">
            </div>
            
            <div class="form-group position-relative">
                <i class="fas fa-briefcase"></i>
                <input type="text" class="form-control" name="jobRole" value="${worker.jobRole}" placeholder="Enter job role">
            </div>
            
            <div class="form-group position-relative">
                <i class="fas fa-envelope"></i>
                <input type="email" class="form-control" name="email" value="${worker.email}" placeholder="Enter email address">
            </div>
            
            <div class="form-group position-relative">
                <i class="fas fa-phone-alt"></i>
                <input type="tel" class="form-control" name="phone" value="${worker.phone}" placeholder="Enter phone number">
            </div>
            
            <div class="form-group position-relative">
                <i class="fas fa-map-marker-alt"></i>
                <input type="text" class="form-control" name="location" value="${worker.location}" placeholder="Enter location or city">
            </div>
            
            <div class="form-group position-relative">
                <i class="fas fa-calendar-alt"></i>
                <input type="date" class="form-control" name="joiningDate" value="${worker.joiningDate}" required>
            </div>
            
            <div class="form-group position-relative">
                <i class="fas fa-tools"></i>
                <input type="text" class="form-control" name="skills" value="${worker.skills}" placeholder="Enter your skills (e.g., Carpentry, Plumbing)">
            </div>
            
            <div class="text-center">
                <button type="submit" class="btn btn-save"><i class="fas fa-save"></i> Save Changes</button>
            </div>
        </form>
    </div>
</div>

<!-- Scripts -->
<script>
    function toggleEdit() {
        const section = document.getElementById("editSection");
        section.style.display = section.style.display === "none" ? "block" : "none";
    }
</script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
