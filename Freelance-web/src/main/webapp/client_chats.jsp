<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chat Page</title>
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
    <nav class="navbar navbar-expand-lg">
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="client_home.jsp"><i class="fas fa-home"></i> Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="logout.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a>
                </li>
            </ul>
        </div>
    </nav>

    <div class="chat-container">
        <div class="chat-header">
            <h4>Chat with Worker</h4>
        </div>
        <div class="chat-body" id="chatBody">
            <!-- Messages will appear here -->
        </div>
        <div class="chat-footer">
            <button class="chat-upload-button">
                <i class="fas fa-paperclip"></i>
                <input type="file" id="chatUpload" style="display: none;" onchange="handleFileUpload()">
            </button>
            <input type="text" class="chat-input" id="chatInput" placeholder="Type a message...">
            <button class="chat-send" onclick="sendMessage()">Send</button>
        </div>
    </div>

    <div class="loading-spinner" id="loadingSpinner"></div>

    <script>
        function handleFileUpload() {
            const chatUploadButton = document.querySelector('.chat-upload-button');
            const chatUploadInput = document.getElementById('chatUpload');
            const fileName = chatUploadInput.files[0] ? chatUploadInput.files[0].name : '';
            chatUploadButton.innerHTML = `<i class="fas fa-paperclip"></i> ${fileName}`;
        }

        function sendMessage() {
            const chatBody = document.getElementById("chatBody");
            const chatInput = document.getElementById("chatInput");
            const chatUpload = document.getElementById("chatUpload");
            const loadingSpinner = document.getElementById("loadingSpinner");

            if (chatInput.value.trim() === "" && !chatUpload.value) {
                alert("Please enter a message or select a file to upload.");
                return;
            }

            loadingSpinner.style.display = "block"; // Show loading spinner

            setTimeout(() => {
                const message = chatInput.value.trim();
                const file = chatUpload.files[0];

                const messageElement = document.createElement("div");
                messageElement.textContent = message;

                if (file) {
                    const fileElement = document.createElement("div");
                    fileElement.textContent = `File: ${file.name}`;
                    messageElement.appendChild(fileElement);
                }

                chatBody.appendChild(messageElement);
                chatInput.value = "";
                chatUpload.value = "";
                chatUploadButton.innerHTML = `<i class="fas fa-paperclip"></i>`;
                chatBody.scrollTop = chatBody.scrollHeight;

                loadingSpinner.style.display = "none"; // Hide loading spinner
            }, 2000); // Simulate 2 seconds of loading time
        }
    </script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
</body>
</html>
