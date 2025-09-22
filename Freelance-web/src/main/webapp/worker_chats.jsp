<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Worker Chats</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .navbar {
            background-color: #343a40;
        }

        .navbar-brand, .nav-link {
            color: #fff !important;
        }

        .nav-link:hover {
            color: #ffa500 !important; /* Orange hover */
        }

        .chat-container {
            display: flex;
            flex-direction: column;
            height: 90vh;
            max-width: 600px;
            margin: 20px auto;
            border: 1px solid #ccc;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .chat-header {
            background-color: #343a40;
            color: #fff;
            padding: 10px;
            text-align: center;
        }

        .chat-body {
            flex: 1;
            padding: 10px;
            overflow-y: auto;
            background-color: #fff;
        }

        .chat-footer {
            display: flex;
            padding: 10px;
            background-color: #f4f4f4;
        }

        .chat-input {
            flex: 1;
            margin-right: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 5px;
            font-size: 16px;
            width: 100%;
        }

        .chat-upload-button {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s, box-shadow 0.3s;
            margin-right: 10px;
        }

        .chat-upload-button:hover {
            background-color: #0056b3;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
        }

        .chat-send {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s, box-shadow 0.3s;
        }

        .chat-send:hover {
            background-color: #0056b3;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
        }

        .loading-spinner {
            display: none;
            border: 4px solid #f3f3f3;
            border-top: 4px solid #007bff;
            border-radius: 50%;
            width: 20px;
            height: 20px;
            animation: spin 2s linear infinite;
        }

        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }
    </style>
</head>
<body>

    <!-- Navbar -->

<nav class="navbar navbar-expand-lg navbar-dark">
    <a class="navbar-brand" href="#"><i class="fas fa-user-cog"></i> Worker’s Portal</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" href="worker_home.jsp">
                    <i class="fas fa-home"></i> Home
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="logout.jsp">
                    <i class="fas fa-sign-out-alt"></i> Logout
                </a>
            </li>
        </ul>
    </div>
</nav>
    

    <!-- Chat Container -->
    <div class="chat-container">
        <div class="chat-header">
            <h5><i class="fas fa-comments"></i> Chat with Clients</h5>
        </div>
        <div class="chat-body" id="chatBody">
            <!-- Example messages -->
            <div><strong>Client:</strong> Hello, are you available for the painting work?</div>
            <div><strong>You:</strong> Yes, I’m available. When would you like to start?</div>
        </div>
        <div class="chat-footer">
    <input type="text" class="chat-input" placeholder="Type your message..." id="chatInput">
    
    <label class="chat-upload-button" for="fileUpload">
        <i class="fas fa-paperclip"></i>
    </label>
    <input type="file" id="fileUpload" style="display: none;" onchange="handleFileUpload(event)">
    
    <button class="chat-send" onclick="sendMessage()">
        <i class="fas fa-paper-plane"></i>
    </button>
</div>
        
    </div>
    

    <script>
        function sendMessage() {
            const input = document.getElementById('chatInput');
            const message = input.value.trim();
            if (message !== '') {
                const chatBody = document.getElementById('chatBody');
                const div = document.createElement('div');
                div.innerHTML = "<strong>You:</strong> " + message;
                chatBody.appendChild(div);
                input.value = '';
                chatBody.scrollTop = chatBody.scrollHeight;
            }
        }
    </script>

    <!-- Bootstrap JS CDN -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
    <script>
    function handleFileUpload(event) {
        const file = event.target.files[0];
        if (file) {
            const chatBody = document.getElementById('chatBody');
            const div = document.createElement('div');
            div.innerHTML = `<strong>You uploaded:</strong> ${file.name}`;
            chatBody.appendChild(div);
            chatBody.scrollTop = chatBody.scrollHeight;
        }
    }

    </script>
    
</body>
</html>
