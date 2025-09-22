<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, jakarta.servlet.http.HttpSession" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Job Posted Successfully</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

    <div class="container">
        <div class="alert alert-success mt-5">
            <h3>Job Posted Successfully!</h3>
            <a href="client_home.jsp" class="btn btn-primary">Go to Dashboard</a>
        </div>
    </div>

    <%
        // Get form parameters
        String jobTitle = request.getParameter("jobTitle");
        String jobDescription = request.getParameter("jobDescription");
        String location = request.getParameter("location");
        String workType = request.getParameter("workType");
        String payType = request.getParameter("payType");

        double budget = 0.0;
        String budgetParam = request.getParameter("budget");
        if (budgetParam != null && !budgetParam.trim().isEmpty()) {
            try {
                budget = Double.parseDouble(budgetParam);
            } catch (NumberFormatException e) {
                out.println("<div class='alert alert-danger'>Invalid budget value. Please enter a valid number.</div>");
                return;
            }
        }

        String deadline = request.getParameter("deadline");

        // Get client_id from session (stored as userId)
        Integer clientId = null;
        if (session != null && session.getAttribute("userId") != null) {
            clientId = Integer.parseInt((String)session.getAttribute("userId"));
        } else {
            out.println("<div class='alert alert-danger'>Session expired. Please login again.</div>");
            return;
        }

        // DB connection
        String url = "jdbc:mysql://localhost:3307/test2";
        String dbUser = "root";
        String dbPassword = "";

        String sql = "INSERT INTO jobs (job_title, job_description, location, work_type, pay_type, budget, deadline, client_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, dbUser, dbPassword);

            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, jobTitle);
            stmt.setString(2, jobDescription);
            stmt.setString(3, location);
            stmt.setString(4, workType);
            stmt.setString(5, payType);
            stmt.setDouble(6, budget);
            stmt.setString(7, deadline);
            stmt.setInt(8, clientId); // Set client_id

            stmt.executeUpdate();

            stmt.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
            out.println("<div class='alert alert-danger'>An error occurred while posting the job.</div>");
        }
    %>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
