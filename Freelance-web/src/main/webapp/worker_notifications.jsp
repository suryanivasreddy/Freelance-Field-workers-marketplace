<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Worker Notifications</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f8f9fa;
        }

        .container {
            margin-top: 60px;
            padding: 0 40px;
        }

        .page-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
        }

        .page-title {
            font-size: 28px;
            font-weight: bold;
            color: #333;
        }

        .home-btn {
            background-color: #0d6efd;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 6px;
            text-decoration: none;
            font-size: 16px;
        }

        .home-btn i {
            margin-right: 6px;
        }

        .notification-card {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
            padding: 20px;
            margin-bottom: 20px;
            transition: all 0.3s ease;
        }

        .notification-card:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
        }

        .notification-header {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
        }

        .notification-icon {
            font-size: 24px;
            color: #0d6efd;
            margin-right: 10px;
        }

        .notification-title {
            font-weight: 600;
            font-size: 18px;
        }

        .notification-body {
            font-size: 15px;
            color: #444;
            margin-bottom: 10px;
        }

        .notification-time {
            text-align: right;
            font-size: 13px;
            color: #777;
            margin-bottom: 10px;
        }

        .notification-actions {
            display: flex;
            justify-content: flex-end;
            gap: 10px;
        }

        .btn {
            padding: 8px 14px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 14px;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
        }

        .btn-accept {
            background-color: #28a745;
            color: white;
        }

        .btn-chat {
            background-color: #17a2b8;
            color: white;
        }

        .btn i {
            margin-right: 6px;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="page-header">
        <div class="page-title"><i class="fas fa-bell"></i> Notifications</div>
        <a href="worker_home.jsp" class="home-btn"><i class="fas fa-home"></i> Home</a>
    </div>

    <!-- Dynamically display notifications -->
    <c:forEach var="notification" items="${notifications}">
        <div class="notification-card">
            <div class="notification-header">
                <i class="fas fa-briefcase notification-icon"></i>
                <div class="notification-title">${notification.notificationMessage}</div>
            </div>
            <div class="notification-body">
                Job ID: ${notification.jobId} <br>
                Status: ${notification.status}
            </div>
            <div class="notification-time">Posted just now</div>
            <div class="notification-actions">
                <button class="btn btn-accept"><i class="fas fa-check-circle"></i> Accept</button>
                <a href="worker_chats.jsp" class="btn btn-chat"><i class="fas fa-comments"></i> Chat</a>
            </div>
        </div>
    </c:forEach>

</div>

</body>
</html>
