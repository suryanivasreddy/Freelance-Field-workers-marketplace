package Controller;

import DAO.JobDao;
import Model.JobModel;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/ClientJobsServlet")
public class ClientJobsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private JobDao jobDao;

    @Override
    public void init() {
        jobDao = new JobDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Get the session and retrieve client ID
            HttpSession session = request.getSession(false);
            if (session == null || session.getAttribute("userId") == null) {
                // No session or not logged in, redirect to login page
                response.sendRedirect("login.html");
                return;
            }

            int clientId = (int) session.getAttribute("userId");

            // Fetch the jobs posted by the client
            List<JobModel> jobList = jobDao.getJobsByClientId(clientId);

            // Set the job list in the request scope
            request.setAttribute("jobList", jobList);

            // Forward to client_jobs.jsp (NOT client_home.jsp)
            request.getRequestDispatcher("client_jobs.jsp").forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("client_jobs.jsp?error=load_failed");
        }
    }
}
