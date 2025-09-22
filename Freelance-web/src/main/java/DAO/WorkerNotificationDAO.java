package DAO;

import Model.WorkerNotificationModel;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class WorkerNotificationDAO {

    private Connection getConnection() throws SQLException {
        // Provide your database connection code here
        return DriverManager.getConnection("jdbc:mysql://localhost:3306/your_database", "username", "password");
    }

    // Insert notification
    public boolean insertNotification(WorkerNotificationModel notification) throws SQLException {
        String query = "INSERT INTO worker_notifications (workerId, jobId, notificationMessage, status) VALUES (?, ?, ?, ?)";
        try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, notification.getWorkerId());
            stmt.setInt(2, notification.getJobId());
            stmt.setString(3, notification.getNotificationMessage());
            stmt.setString(4, notification.getStatus());
            return stmt.executeUpdate() > 0;
        }
    }

    // Get notifications for a worker
    public List<WorkerNotificationModel> getNotificationsByWorkerId(int workerId) throws SQLException {
        String query = "SELECT * FROM worker_notifications WHERE workerId = ?";
        List<WorkerNotificationModel> notifications = new ArrayList<>();

        try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, workerId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                WorkerNotificationModel notification = new WorkerNotificationModel(
                    rs.getInt("notificationId"),
                    rs.getInt("workerId"),
                    rs.getInt("jobId"),
                    rs.getString("notificationMessage"),
                    rs.getString("status")
                );
                notifications.add(notification);
            }
        }
        return notifications;
    }
}
