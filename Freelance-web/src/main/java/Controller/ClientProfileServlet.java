package Controller;

import Model.ClientModel;
import DAO.ClientDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/ClientProfileServlet")
public class ClientProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        int clientId = (int) session.getAttribute("clientId");

        ClientModel client = new ClientModel(clientId, fullName, email, phone, address);
        ClientDAO dao = new ClientDAO(); // ✅ Create instance
        boolean result = false;

        try {
            result = dao.updateClientProfile(client);
        } catch (Exception e) {
            e.printStackTrace();
        }

        if (result) {
            session.setAttribute("flashMessage", "Profile updated successfully!");
            session.setAttribute("clientName", fullName);
            session.setAttribute("clientEmail", email);
            session.setAttribute("clientPhone", phone);
            session.setAttribute("clientAddress", address);
        } else {
            session.setAttribute("flashMessage", "Failed to update profile. Try again.");
        }

        response.sendRedirect("client_profile.jsp");
    }
}
