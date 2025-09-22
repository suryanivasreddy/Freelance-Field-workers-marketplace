package Controller;

import DAO.TransactionDAO;
import Model.TransactionModel;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/transaction_overview")
public class TransactionOverviewServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private TransactionDAO transactionDAO;

    @Override
    public void init() {
        transactionDAO = new TransactionDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Fetch both completed and pending transactions
            List<TransactionModel> paymentHistory = transactionDAO.listAllTransactions(); // Get all transactions
            List<TransactionModel> pendingPayments = new ArrayList<>();
            
            // Filter the pending payments
            for (TransactionModel transaction : paymentHistory) {
                if ("Pending".equals(transaction.getStatus()) || "Refunded".equals(transaction.getStatus())) {
                    pendingPayments.add(transaction);
                }
            }

            // Set attributes for use in the JSP page
            request.setAttribute("paymentHistory", paymentHistory);
            request.setAttribute("pendingPayments", pendingPayments);

            // Forward to the JSP page for displaying transaction overview
            request.getRequestDispatcher("/transaction_overview.jsp").forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
            throw new ServletException("Error retrieving transaction data", e);
        }
    }
}
