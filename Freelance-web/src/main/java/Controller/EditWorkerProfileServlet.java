package Controller;

import DAO.WorkerDao;
import Model.WorkerModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/EditWorkerProfileServlet")
public class EditWorkerProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private WorkerDao workerDao;

    @Override
    public void init() {
        workerDao = new WorkerDao();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String userIdStr = request.getParameter("userId");
            if (userIdStr == null || userIdStr.isEmpty()) {
                response.sendRedirect("worker_profile.jsp?error=missing_user_id");
                return;
            }

            int userId = Integer.parseInt(userIdStr);
            String name = request.getParameter("name");
            String jobRole = request.getParameter("jobRole");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String location = request.getParameter("location");
            String joiningDate = request.getParameter("joiningDate");  // Must be yyyy-MM-dd
            String skills = request.getParameter("skills");

            // Debug log
            System.out.println("Updating worker with ID: " + userId);

            WorkerModel worker = new WorkerModel();
            worker.setUserId(userId);
            worker.setName(name);
            worker.setJobRole(jobRole);
            worker.setEmail(email);
            worker.setPhone(phone);
            worker.setLocation(location);
            worker.setJoiningDate(joiningDate);
            worker.setSkills(skills);

            boolean updated = workerDao.updateWorkerProfile(worker);

            if (updated) {
                response.sendRedirect("worker_profile.jsp?success=1");
            } else {
                response.sendRedirect("worker_profile.jsp?error=update_failed");
            }

        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.sendRedirect("worker_profile.jsp?error=invalid_user_id");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("worker_profile.jsp?error=sql_exception");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("worker_profile.jsp?error=unexpected_exception");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }
}
