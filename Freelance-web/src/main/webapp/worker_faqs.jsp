<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FAQs - Company Rules</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .navbar {
            background-color: #343a40;
        }

        .navbar-brand, .nav-link {
            color: #fff !important;
        }

        .nav-link:hover {
            color: #ffa500 !important; /* Orange hover */
        }

        .faq-container {
            max-width: 800px;
            margin: 30px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .faq-title {
            text-align: center;
            font-size: 28px;
            margin-bottom: 20px;
            color: #343a40;
        }

        .faq-item {
            background-color: #f9f9f9;
            margin-bottom: 10px;
            padding: 15px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .faq-item:hover {
            background-color: #f1f1f1;
        }

        .faq-item .faq-question {
            font-size: 18px;
            font-weight: bold;
        }

        .faq-item .faq-answer {
            display: none;
            font-size: 16px;
            margin-top: 10px;
        }

        .faq-item.active .faq-answer {
            display: block;
        }

        .faq-item i {
            margin-right: 10px;
        }

    </style>
</head>
<body>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark">
        <a class="navbar-brand" href="#"><i class="fas fa-building"></i> Company Portal</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="worker_home.jsp"><i class="fas fa-home"></i> Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="logout.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a>
                </li>
            </ul>
        </div>
    </nav>

    <!-- FAQ Section -->
    <div class="faq-container">
        <h2 class="faq-title">Frequently Asked Questions (FAQ)</h2>

        <div class="faq-item">
            <div class="faq-question">
                <i class="fas fa-question-circle"></i> What is the company's policy on attendance?
            </div>
            <div class="faq-answer">
                Our attendance policy requires employees to clock in by 9:00 AM and clock out by 6:00 PM. Any absences should be communicated in advance.
            </div>
        </div>

        <div class="faq-item">
            <div class="faq-question">
                <i class="fas fa-question-circle"></i> How are performance reviews conducted?
            </div>
            <div class="faq-answer">
                Performance reviews are held bi-annually. Supervisors provide feedback based on key performance indicators and goals set at the beginning of the year.
            </div>
        </div>

        <div class="faq-item">
            <div class="faq-question">
                <i class="fas fa-question-circle"></i> What are the company's working hours?
            </div>
            <div class="faq-answer">
                Our standard working hours are from 9:00 AM to 6:00 PM, Monday to Friday. Flexible working hours are available upon request.
            </div>
        </div>

        <div class="faq-item">
            <div class="faq-question">
                <i class="fas fa-question-circle"></i> How can I request time off?
            </div>
            <div class="faq-answer">
                You can request time off via the employee portal or by contacting HR directly. Ensure to provide notice at least one week in advance for vacation days.
            </div>
        </div>

        <div class="faq-item">
            <div class="faq-question">
                <i class="fas fa-question-circle"></i> Is there a dress code in the workplace?
            </div>
            <div class="faq-answer">
                We maintain a business-casual dress code. Employees are expected to dress professionally but comfortably.
            </div>
        </div>
    </div>

    <!-- Bootstrap JS CDN -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- Toggle FAQ answers -->
    <script>
        document.querySelectorAll('.faq-item').forEach(item => {
            item.addEventListener('click', () => {
                item.classList.toggle('active');
            });
        });
    </script>

</body>
</html>
