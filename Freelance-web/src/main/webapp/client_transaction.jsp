<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Transaction Overview</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
    <style>
        /* Your custom CSS */
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg">
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="client_home.jsp"><i class="fas fa-home"></i> Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="logout.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a>
                </li>
            </ul>
        </div>
    </nav>

    <div class="container">
        <!-- Payment History Card -->
        <div class="card">
            <div class="card-header">
                <i class="fas fa-history"></i> Payment History
            </div>
            <div class="card-body">
                <!-- Dynamic Table for Payment History -->
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>Date</th>
                            <th>Job Title</th>
                            <th>Amount</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="transaction" items="${paymentHistory}">
                            <tr>
                                <td>${transaction.transactionDate}</td>
                                <td>${transaction.jobTitle}</td>
                                <td>${transaction.amount}</td>
                                <td>${transaction.status}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- Pending Payments and Refunds Card -->
        <div class="card">
            <div class="card-header">
                <i class="fas fa-clock"></i> Pending Payments and Refunds
            </div>
            <div class="card-body">
                <!-- Dynamic Table for Pending Payments -->
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>Date</th>
                            <th>Job Title</th>
                            <th>Amount</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="transaction" items="${pendingPayments}">
                            <tr>
                                <td>${transaction.transactionDate}</td>
                                <td>${transaction.jobTitle}</td>
                                <td>${transaction.amount}</td>
                                <td>${transaction.status}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- QR Code and Payment Details Section -->
        <div class="card qr-code-section">
            <div class="card-header">
                <i class="fas fa-qrcode"></i> Payment Details
            </div>
            <div class="card-body">
                <img src="images/qr_code.png" alt="QR Code">
                <div class="account-details">
                    <p>
                        Account No.: 1234567890
                        <i class="fas fa-copy copy-icon" onclick="copyToClipboard('1234567890')" title="Copy Account Number"></i>
                    </p>
                    <p>
                        IFSC Code: ABCD1234567
                        <i class="fas fa-copy copy-icon" onclick="copyToClipboard('ABCD1234567')" title="Copy IFSC Code"></i>
                    </p>
                    <p>Bank Name: XYZ Bank</p>
                </div>
                <p class="text-danger mt-3">
                    <i class="fas fa-info-circle"></i> Don't forget to paste the UTR.
                </p>
            </div>
        </div>

        <!-- Submit Payment Form -->
        <div class="card mt-3">
            <div class="card-header">
                <i class="fas fa-upload"></i> Submit Payment Details
            </div>
            <div class="card-body">
                <form method="POST" action="submit_payment_details.jsp">
                    <div class="form-group">
                        <label for="utrNumber">UTR Number</label>
                        <input type="text" class="form-control" id="utrNumber" name="utrNumber" placeholder="Enter UTR Number">
                    </div>
                    <div class="form-group">
                        <label for="fileUpload">Upload Payment Screenshot</label>
                        <input type="file" class="form-control-file" id="fileUpload" name="fileUpload">
                    </div>
                    <button type="submit" class="btn btn-custom">
                        <i class="fas fa-paper-plane"></i> Submit
                    </button>
                </form>
            </div>
        </div>
    </div>

    <script>
        function copyToClipboard(value) {
            navigator.clipboard.writeText(value).then(() => {
                console.log("Copied successfully!");
            }).catch(err => {
                console.log("Failed to copy: ", err);
            });
        }
    </script>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
</body>
</html>
