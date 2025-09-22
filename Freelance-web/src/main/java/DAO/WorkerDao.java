package DAO;

import Model.WorkerModel;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class WorkerDao {

    private final String jdbcURL = "jdbc:mysql://localhost:3307/test2";
    private final String jdbcUsername = "root";
    private final String jdbcPassword = "";

    private static final String UPDATE_SQL =
        "UPDATE workers SET name=?, job_role=?, email=?, phone=?, location=?, joining_date=?, skills=? WHERE user_id=?";

    private static final String SELECT_ALL_SQL = "SELECT * FROM workers";

    // Update worker profile
    public boolean updateWorkerProfile(WorkerModel worker) throws SQLException {
        boolean rowUpdated;

        try (Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
             PreparedStatement stmt = connection.prepareStatement(UPDATE_SQL)) {

            stmt.setString(1, worker.getName());
            stmt.setString(2, worker.getJobRole());
            stmt.setString(3, worker.getEmail());
            stmt.setString(4, worker.getPhone());
            stmt.setString(5, worker.getLocation());
            stmt.setString(6, worker.getJoiningDate()); // String date is fine if DB column is DATE or VARCHAR
            stmt.setString(7, worker.getSkills());
            stmt.setInt(8, worker.getUserId());

            rowUpdated = stmt.executeUpdate() > 0;
        }

        return rowUpdated;
    }

    // Fetch all workers
    public List<WorkerModel> getAllWorkers() throws SQLException {
        List<WorkerModel> workers = new ArrayList<>();

        try (Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
             PreparedStatement stmt = connection.prepareStatement(SELECT_ALL_SQL);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                WorkerModel worker = new WorkerModel();
                worker.setUserId(rs.getInt("user_id"));
                worker.setName(rs.getString("name"));
                worker.setJobRole(rs.getString("job_role"));
                worker.setEmail(rs.getString("email"));
                worker.setPhone(rs.getString("phone"));
                worker.setLocation(rs.getString("location"));
                worker.setJoiningDate(rs.getString("joining_date")); // Format as needed
                worker.setSkills(rs.getString("skills"));

                workers.add(worker);
            }
        }

        return workers;
    }
}
