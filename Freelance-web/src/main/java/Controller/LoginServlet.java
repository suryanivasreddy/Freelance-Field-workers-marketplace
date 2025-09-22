package Controller;

import DAO.LoginDao;
import Model.RegisterModel;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private LoginDao loginDao;

    public void init() {
        loginDao = new LoginDao();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
            // Validate the user credentials
            RegisterModel user = loginDao.validateUser(username, password);
            if (user != null) {
                // Create a session
                HttpSession session = request.getSession();
                
                // Save user details in the session
                session.setAttribute("username", user.getUsername());
                session.setAttribute("role", user.getRole());

                // Redirect based on the user's role
                switch (user.getRole()) {
                    case "worker":
                        response.sendRedirect("worker_home.jsp");
                        break;
                    case "client":
                        response.sendRedirect("client_home.jsp");
                        break;
                    default:
                        response.sendRedirect("login.html?error=invalid_role");
                        break;
                }
            } else {
                // Redirect back to login page with error message
                response.sendRedirect("login.html?error=invalid_credentials");
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }
}
