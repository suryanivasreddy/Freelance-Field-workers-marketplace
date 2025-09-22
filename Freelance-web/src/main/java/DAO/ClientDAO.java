package DAO;

import Model.ClientModel;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ClientDAO {
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

    public boolean updateClientProfile(ClientModel client) throws SQLException {
        String sql = "UPDATE clients SET full_name = ?, email = ?, phone = ?, address = ? WHERE id = ?";
        connect();

        PreparedStatement statement = jdbcConnection.prepareStatement(sql);
        statement.setString(1, client.getFullName());
        statement.setString(2, client.getEmail());
        statement.setString(3, client.getPhone());
        statement.setString(4, client.getAddress());
        statement.setInt(5, client.getId());

        boolean rowUpdated = statement.executeUpdate() > 0;

        statement.close();
        disconnect();

        return rowUpdated;
    }
}
