package DAO;

import Model.TransactionModel;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TransactionDAO {
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

    public boolean insertTransaction(TransactionModel transaction) throws SQLException {
        String sql = "INSERT INTO transactions (transaction_date, job_title, amount, status, utr_number, payment_screenshot, client_id) VALUES (?, ?, ?, ?, ?, ?, ?)";
        connect();

        PreparedStatement statement = jdbcConnection.prepareStatement(sql);
        statement.setDate(1, new java.sql.Date(transaction.getTransactionDate().getTime()));
        statement.setString(2, transaction.getJobTitle());
        statement.setDouble(3, transaction.getAmount());
        statement.setString(4, transaction.getStatus());
        statement.setString(5, transaction.getUtrNumber());
        statement.setString(6, transaction.getPaymentScreenshot());
        statement.setInt(7, transaction.getClientId());

        boolean rowInserted = statement.executeUpdate() > 0;
        statement.close();
        disconnect();
        return rowInserted;
    }

    public boolean updateTransaction(TransactionModel transaction) throws SQLException {
        String sql = "UPDATE transactions SET transaction_date = ?, job_title = ?, amount = ?, status = ?, utr_number = ?, payment_screenshot = ?, client_id = ? WHERE id = ?";
        connect();

        PreparedStatement statement = jdbcConnection.prepareStatement(sql);
        statement.setDate(1, new java.sql.Date(transaction.getTransactionDate().getTime()));
        statement.setString(2, transaction.getJobTitle());
        statement.setDouble(3, transaction.getAmount());
        statement.setString(4, transaction.getStatus());
        statement.setString(5, transaction.getUtrNumber());
        statement.setString(6, transaction.getPaymentScreenshot());
        statement.setInt(7, transaction.getClientId());
        statement.setInt(8, transaction.getId());

        boolean rowUpdated = statement.executeUpdate() > 0;
        statement.close();
        disconnect();
        return rowUpdated;
    }

    public boolean deleteTransaction(int id) throws SQLException {
        String sql = "DELETE FROM transactions WHERE id = ?";
        connect();

        PreparedStatement statement = jdbcConnection.prepareStatement(sql);
        statement.setInt(1, id);

        boolean rowDeleted = statement.executeUpdate() > 0;
        statement.close();
        disconnect();
        return rowDeleted;
    }

    public TransactionModel getTransaction(int id) throws SQLException {
        TransactionModel transaction = null;
        String sql = "SELECT * FROM transactions WHERE id = ?";
        connect();

        PreparedStatement statement = jdbcConnection.prepareStatement(sql);
        statement.setInt(1, id);

        ResultSet resultSet = statement.executeQuery();

        if (resultSet.next()) {
            java.util.Date transactionDate = new java.util.Date(resultSet.getDate("transaction_date").getTime());
            String jobTitle = resultSet.getString("job_title");
            double amount = resultSet.getDouble("amount");
            String status = resultSet.getString("status");
            String utrNumber = resultSet.getString("utr_number");
            String paymentScreenshot = resultSet.getString("payment_screenshot");
            int clientId = resultSet.getInt("client_id");

            transaction = new TransactionModel(id, transactionDate, jobTitle, amount, status, utrNumber, paymentScreenshot, clientId);
        }

        resultSet.close();
        statement.close();
        disconnect();

        return transaction;
    }

    public List<TransactionModel> listAllTransactions() throws SQLException {
        List<TransactionModel> listTransaction = new ArrayList<>();

        String sql = "SELECT * FROM transactions";
        connect();

        Statement statement = jdbcConnection.createStatement();
        ResultSet resultSet = statement.executeQuery(sql);

        while (resultSet.next()) {
            int id = resultSet.getInt("id");
            java.util.Date transactionDate = new java.util.Date(resultSet.getDate("transaction_date").getTime());
            String jobTitle = resultSet.getString("job_title");
            double amount = resultSet.getDouble("amount");
            String status = resultSet.getString("status");
            String utrNumber = resultSet.getString("utr_number");
            String paymentScreenshot = resultSet.getString("payment_screenshot");
            int clientId = resultSet.getInt("client_id");

            TransactionModel transaction = new TransactionModel(id, transactionDate, jobTitle, amount, status, utrNumber, paymentScreenshot, clientId);
            listTransaction.add(transaction);
        }

        resultSet.close();
        statement.close();
        disconnect();

        return listTransaction;
    }
}
