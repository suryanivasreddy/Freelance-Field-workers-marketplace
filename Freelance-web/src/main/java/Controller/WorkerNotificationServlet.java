package Controller;

import Model.WorkerNotificationModel;
import DAO.WorkerNotificationDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/WorkerNotificationServlet")
public class WorkerNotificationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // POST method to send a notification
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        // Get form data
        String workerIdStr = request.getParameter("workerId");
        String notificationMessage = request.getParameter("notificationMessage");
        String jobIdStr = request.getParameter("jobId");
        String notificationStatus = request.getParameter("status");

        int workerId = 0;
        int jobId = 0;

        // Try to parse integers and handle NumberFormatException
        try {
            workerId = Integer.parseInt(workerIdStr);
            jobId = Integer.parseInt(jobIdStr);
        } catch (NumberFormatException e) {
            e.printStackTrace();
            session.setAttribute("flashMessage", "Invalid input for worker or job ID.");
            response.sendRedirect("worker_notifications.jsp");
            return;
        }

        WorkerNotificationModel notification = new WorkerNotificationModel();
        notification.setWorkerId(workerId);
        notification.setJobId(jobId);
        notification.setNotificationMessage(notificationMessage);
        notification.setStatus(notificationStatus);

        WorkerNotificationDAO dao = new WorkerNotificationDAO();
        boolean result = false;

        // Try to insert the notification and handle any potential exceptions
        try {
            result = dao.insertNotification(notification);
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("flashMessage", "Failed to send notification. Please try again.");
            response.sendRedirect("worker_notifications.jsp");
            return;
        }

        if (result) {
            session.setAttribute("flashMessage", "Notification sent successfully!");
        } else {
            session.setAttribute("flashMessage", "Failed to send notification. Please try again.");
        }

        response.sendRedirect("worker_notifications.jsp");
    }

    // GET method to retrieve notifications for the worker
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        WorkerNotificationDAO dao = new WorkerNotificationDAO();

        int workerId = 0;
        // Try to parse the worker ID and handle NumberFormatException
        try {
            workerId = Integer.parseInt(request.getParameter("workerId"));
        } catch (NumberFormatException e) {
            e.printStackTrace();
            session.setAttribute("flashMessage", "Invalid worker ID.");
            response.sendRedirect("worker_notifications.jsp");
            return;
        }

        List<WorkerNotificationModel> notifications = null;

        // Try to retrieve notifications and handle any potential exceptions
        try {
            notifications = dao.getNotificationsByWorkerId(workerId);
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("flashMessage", "Failed to retrieve notifications. Please try again.");
            response.sendRedirect("worker_notifications.jsp");
            return;
        }

        request.setAttribute("notifications", notifications);
        request.getRequestDispatcher("worker_notifications.jsp").forward(request, response);
    }
}
