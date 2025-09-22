package DAO;

import Model.ReviewModel;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ReviewDAO {
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

    public boolean insertReview(ReviewModel review) throws SQLException {
        String sql = "INSERT INTO reviews (rating, review_text, client_id, worker_id) VALUES (?, ?, ?, ?)";
        connect();

        PreparedStatement statement = jdbcConnection.prepareStatement(sql);
        statement.setInt(1, review.getRating());
        statement.setString(2, review.getReviewText());
        statement.setInt(3, review.getClientId());
        statement.setInt(4, review.getWorkerId());

        boolean rowInserted = statement.executeUpdate() > 0;
        statement.close();
        disconnect();
        return rowInserted;
    }

    public boolean updateReview(ReviewModel review) throws SQLException {
        String sql = "UPDATE reviews SET rating = ?, review_text = ?, client_id = ?, worker_id = ? WHERE id = ?";
        connect();

        PreparedStatement statement = jdbcConnection.prepareStatement(sql);
        statement.setInt(1, review.getRating());
        statement.setString(2, review.getReviewText());
        statement.setInt(3, review.getClientId());
        statement.setInt(4, review.getWorkerId());
        statement.setInt(5, review.getId());

        boolean rowUpdated = statement.executeUpdate() > 0;
        statement.close();
        disconnect();
        return rowUpdated;
    }

    public boolean deleteReview(int id) throws SQLException {
        String sql = "DELETE FROM reviews WHERE id = ?";
        connect();

        PreparedStatement statement = jdbcConnection.prepareStatement(sql);
        statement.setInt(1, id);

        boolean rowDeleted = statement.executeUpdate() > 0;
        statement.close();
        disconnect();
        return rowDeleted;
    }

    public ReviewModel getReview(int id) throws SQLException {
        ReviewModel review = null;
        String sql = "SELECT * FROM reviews WHERE id = ?";
        connect();

        PreparedStatement statement = jdbcConnection.prepareStatement(sql);
        statement.setInt(1, id);

        ResultSet resultSet = statement.executeQuery();

        if (resultSet.next()) {
            int rating = resultSet.getInt("rating");
            String reviewText = resultSet.getString("review_text");
            int clientId = resultSet.getInt("client_id");
            int workerId = resultSet.getInt("worker_id");

            review = new ReviewModel(id, rating, reviewText, clientId, workerId);
        }

        resultSet.close();
        statement.close();
        disconnect();

        return review;
    }

    public List<ReviewModel> listAllReviews() throws SQLException {
        List<ReviewModel> listReview = new ArrayList<>();

        String sql = "SELECT * FROM reviews";
        connect();

        Statement statement = jdbcConnection.createStatement();
        ResultSet resultSet = statement.executeQuery(sql);

        while (resultSet.next()) {
            int id = resultSet.getInt("id");
            int rating = resultSet.getInt("rating");
            String reviewText = resultSet.getString("review_text");
            int clientId = resultSet.getInt("client_id");
            int workerId = resultSet.getInt("worker_id");

            ReviewModel review = new ReviewModel(id, rating, reviewText, clientId, workerId);
            listReview.add(review);
        }

        resultSet.close();
        statement.close();
        disconnect();

        return listReview;
    }
}
