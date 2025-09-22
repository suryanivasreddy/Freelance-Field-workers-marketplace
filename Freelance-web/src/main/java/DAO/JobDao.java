package DAO;

import Model.JobModel;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class JobDao {
    private String jdbcURL = "jdbc:mysql://localhost:3307/test2";
    private String jdbcUsername = "root";
    private String jdbcPassword = "";

    private Connection jdbcConnection;

    protected void connect() throws SQLException {
        if (jdbcConnection == null || jdbcConnection.isClosed()) {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
            } catch (ClassNotFoundException e) {
                throw new SQLException(e);
            }
            jdbcConnection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        }
    }

    protected void disconnect() throws SQLException {
        if (jdbcConnection != null && !jdbcConnection.isClosed()) {
            jdbcConnection.close();
        }
    }

    public boolean insertJob(JobModel job) throws SQLException {
        String sql = "INSERT INTO jobs (job_title, job_description, location, work_type, pay_type, budget, deadline, client_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        connect();

        PreparedStatement statement = jdbcConnection.prepareStatement(sql);
        statement.setString(1, job.getJobTitle());
        statement.setString(2, job.getJobDescription());
        statement.setString(3, job.getLocation());
        statement.setString(4, job.getWorkType());
        statement.setString(5, job.getPayType());
        statement.setDouble(6, job.getBudget());
        if (job.getDeadline() != null) {
            statement.setDate(7, new java.sql.Date(job.getDeadline().getTime()));
        } else {
            statement.setNull(7, java.sql.Types.DATE);
        }
        statement.setInt(8, job.getClientId());

        boolean rowInserted = statement.executeUpdate() > 0;
        statement.close();
        disconnect();
        return rowInserted;
    }

    public boolean updateJob(JobModel job) throws SQLException {
        String sql = "UPDATE jobs SET job_title = ?, job_description = ?, location = ?, work_type = ?, pay_type = ?, budget = ?, deadline = ?, client_id = ? WHERE id = ?";
        connect();

        PreparedStatement statement = jdbcConnection.prepareStatement(sql);
        statement.setString(1, job.getJobTitle());
        statement.setString(2, job.getJobDescription());
        statement.setString(3, job.getLocation());
        statement.setString(4, job.getWorkType());
        statement.setString(5, job.getPayType());
        statement.setDouble(6, job.getBudget());
        statement.setDate(7, new java.sql.Date(job.getDeadline().getTime()));
        statement.setInt(8, job.getClientId());
        statement.setInt(9, job.getId());

        boolean rowUpdated = statement.executeUpdate() > 0;
        statement.close();
        disconnect();
        return rowUpdated;
    }

    public boolean deleteJob(int id) throws SQLException {
        String sql = "DELETE FROM jobs WHERE id = ?";
        connect();

        PreparedStatement statement = jdbcConnection.prepareStatement(sql);
        statement.setInt(1, id);

        boolean rowDeleted = statement.executeUpdate() > 0;
        statement.close();
        disconnect();
        return rowDeleted;
    }

    public JobModel getJob(int id) throws SQLException {
        JobModel job = null;
        String sql = "SELECT * FROM jobs WHERE id = ?";
        connect();

        PreparedStatement statement = jdbcConnection.prepareStatement(sql);
        statement.setInt(1, id);

        ResultSet resultSet = statement.executeQuery();

        if (resultSet.next()) {
            String jobTitle = resultSet.getString("job_title");
            String jobDescription = resultSet.getString("job_description");
            String location = resultSet.getString("location");
            String workType = resultSet.getString("work_type");
            String payType = resultSet.getString("pay_type");
            double budget = resultSet.getDouble("budget");
            java.util.Date deadline = new java.util.Date(resultSet.getDate("deadline").getTime());
            int clientId = resultSet.getInt("client_id");

            job = new JobModel(id, jobTitle, jobDescription, location, workType, payType, budget, deadline, clientId);
        }

        resultSet.close();
        statement.close();
        disconnect();

        return job;
    }

    public List<JobModel> listAllJobs() throws SQLException {
        List<JobModel> listJob = new ArrayList<>();

        String sql = "SELECT * FROM jobs";
        connect();

        Statement statement = jdbcConnection.createStatement();
        ResultSet resultSet = statement.executeQuery(sql);

        while (resultSet.next()) {
            int id = resultSet.getInt("id");
            String jobTitle = resultSet.getString("job_title");
            String jobDescription = resultSet.getString("job_description");
            String location = resultSet.getString("location");
            String workType = resultSet.getString("work_type");
            String payType = resultSet.getString("pay_type");
            double budget = resultSet.getDouble("budget");
            java.util.Date deadline = new java.util.Date(resultSet.getDate("deadline").getTime());
            int clientId = resultSet.getInt("client_id");

            JobModel job = new JobModel(id, jobTitle, jobDescription, location, workType, payType, budget, deadline, clientId);
            listJob.add(job);
        }

        resultSet.close();
        statement.close();
        disconnect();

        return listJob;
    }
    
    public List<JobModel> getJobsByClientId(int clientId) throws SQLException {
        List<JobModel> listJob = new ArrayList<>();

        String sql = "SELECT * FROM jobs WHERE client_id = ?";
        connect();

        PreparedStatement statement = jdbcConnection.prepareStatement(sql);
        statement.setInt(1, clientId);
        ResultSet resultSet = statement.executeQuery();

        while (resultSet.next()) {
            int id = resultSet.getInt("id");
            String jobTitle = resultSet.getString("job_title");
            String jobDescription = resultSet.getString("job_description");
            String location = resultSet.getString("location");
            String workType = resultSet.getString("work_type");
            String payType = resultSet.getString("pay_type");
            double budget = resultSet.getDouble("budget");
            java.util.Date deadline = new java.util.Date(resultSet.getDate("deadline").getTime());

            JobModel job = new JobModel(id, jobTitle, jobDescription, location, workType, payType, budget, deadline, clientId);
            listJob.add(job);
        }

        resultSet.close();
        statement.close();
        disconnect();

        return listJob;
    }

}
