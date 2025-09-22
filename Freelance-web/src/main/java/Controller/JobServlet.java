package Controller;

import Model.JobModel;
import DAO.JobDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/JobServlet")
public class JobServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        String jobTitle = request.getParameter("jobTitle");
        String jobDescription = request.getParameter("jobDescription");
        String location = request.getParameter("location");
        String workType = request.getParameter("workType");
        String payType = request.getParameter("payType");
        String budgetStr = request.getParameter("budget");
        String deadlineStr = request.getParameter("deadline");
        int clientId = (int) session.getAttribute("clientId");

        double budget = 0.0;
        Date deadline = null;

        try {
            budget = Double.parseDouble(budgetStr);
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            deadline = formatter.parse(deadlineStr);
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("flashMessage", "Invalid input. Please check budget or deadline.");
            response.sendRedirect("post_job.jsp");
            return;
        }

        JobModel job = new JobModel();
        job.setJobTitle(jobTitle);
        job.setJobDescription(jobDescription);
        job.setLocation(location);
        job.setWorkType(workType);
        job.setPayType(payType);
        job.setBudget(budget);
        job.setDeadline(deadline);
        job.setClientId(clientId);

        JobDao dao = new JobDao();
        boolean result = false;

        try {
            result = dao.insertJob(job);
        } catch (Exception e) {
            e.printStackTrace();
        }

        if (result) {
            session.setAttribute("flashMessage", "Job posted successfully!");
        } else {
            session.setAttribute("flashMessage", "Failed to post job. Please try again.");
        }

        response.sendRedirect("post_job.jsp");
    }
}
