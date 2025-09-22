package DAO;

import Model.ChatModel;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ChatDAO {
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

    public boolean insertChat(ChatModel chat) throws SQLException {
        String sql = "INSERT INTO chats (sender_id, receiver_id, message_text, attachment, timestamp) VALUES (?, ?, ?, ?, ?)";
        connect();

        PreparedStatement statement = jdbcConnection.prepareStatement(sql);
        statement.setString(1, chat.getSenderId());
        statement.setString(2, chat.getReceiverId());
        statement.setString(3, chat.getMessageText());
        statement.setString(4, chat.getAttachment());
        statement.setTimestamp(5, new Timestamp(chat.getTimestamp().getTime()));

        boolean rowInserted = statement.executeUpdate() > 0;
        statement.close();
        disconnect();
        return rowInserted;
    }

    public boolean updateChat(ChatModel chat) throws SQLException {
        String sql = "UPDATE chats SET sender_id = ?, receiver_id = ?, message_text = ?, attachment = ?, timestamp = ? WHERE id = ?";
        connect();

        PreparedStatement statement = jdbcConnection.prepareStatement(sql);
        statement.setString(1, chat.getSenderId());
        statement.setString(2, chat.getReceiverId());
        statement.setString(3, chat.getMessageText());
        statement.setString(4, chat.getAttachment());
        statement.setTimestamp(5, new Timestamp(chat.getTimestamp().getTime()));
        statement.setInt(6, chat.getId());

        boolean rowUpdated = statement.executeUpdate() > 0;
        statement.close();
        disconnect();
        return rowUpdated;
    }

    public boolean deleteChat(int id) throws SQLException {
        String sql = "DELETE FROM chats WHERE id = ?";
        connect();

        PreparedStatement statement = jdbcConnection.prepareStatement(sql);
        statement.setInt(1, id);

        boolean rowDeleted = statement.executeUpdate() > 0;
        statement.close();
        disconnect();
        return rowDeleted;
    }

    public ChatModel getChat(int id) throws SQLException {
        ChatModel chat = null;
        String sql = "SELECT * FROM chats WHERE id = ?";
        connect();

        PreparedStatement statement = jdbcConnection.prepareStatement(sql);
        statement.setInt(1, id);

        ResultSet resultSet = statement.executeQuery();

        if (resultSet.next()) {
            String senderId = resultSet.getString("sender_id");
            String receiverId = resultSet.getString("receiver_id");
            String messageText = resultSet.getString("message_text");
            String attachment = resultSet.getString("attachment");
            java.util.Date timestamp = new java.util.Date(resultSet.getTimestamp("timestamp").getTime());

            chat = new ChatModel(id, senderId, receiverId, messageText, attachment, timestamp);
        }

        resultSet.close();
        statement.close();
        disconnect();

        return chat;
    }

    public List<ChatModel> listAllChats() throws SQLException {
        List<ChatModel> listChat = new ArrayList<>();

        String sql = "SELECT * FROM chats";
        connect();

        Statement statement = jdbcConnection.createStatement();
        ResultSet resultSet = statement.executeQuery(sql);

        while (resultSet.next()) {
            int id = resultSet.getInt("id");
            String senderId = resultSet.getString("sender_id");
            String receiverId = resultSet.getString("receiver_id");
            String messageText = resultSet.getString("message_text");
            String attachment = resultSet.getString("attachment");
            java.util.Date timestamp = new java.util.Date(resultSet.getTimestamp("timestamp").getTime());

            ChatModel chat = new ChatModel(id, senderId, receiverId, messageText, attachment, timestamp);
            listChat.add(chat);
        }

        resultSet.close();
        statement.close();
        disconnect();

        return listChat;
    }
}
