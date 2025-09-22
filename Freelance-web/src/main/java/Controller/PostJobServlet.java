package Controller;

import DAO.JobDao;
import Model.JobModel;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

@WebServlet("/PostJobServlet")
public class PostJobServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private JobDao jobDao;

    @Override
    public void init() {
        jobDao = new JobDao();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Retrieve job details from the form
            String title = request.getParameter("jobTitle");
            String description = request.getParameter("jobDescription");
            String location = request.getParameter("location");
            String workType = request.getParameter("workType");
            String payType = request.getParameter("payType");
            double budget = Double.parseDouble(request.getParameter("budget"));
            String deadlineStr = request.getParameter("deadline");
            int clientId = Integer.parseInt(request.getParameter("clientId")); // Assuming client ID is passed

            // Convert deadline string to Date
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date deadline = dateFormat.parse(deadlineStr);

            // Create a JobModel object
            JobModel job = new JobModel();
            job.setJobTitle(title);
            job.setJobDescription(description);
            job.setLocation(location);
            job.setWorkType(workType);
            job.setPayType(payType);
            job.setBudget(budget);
            job.setDeadline(deadline);
            job.setClientId(clientId);

            // Save the job to the database
            boolean isPosted = jobDao.insertJob(job);

            // Redirect based on the result
            if (isPosted) {
                response.sendRedirect("client_home.jsp?success=job_posted");
            } else {
                response.sendRedirect("post_jobs.jsp?error=job_post_failed");
            }
        } catch (SQLException | NumberFormatException | java.text.ParseException e) {
            e.printStackTrace();
            response.sendRedirect("post_jobs.jsp?error=exception");
        }
    }
}
