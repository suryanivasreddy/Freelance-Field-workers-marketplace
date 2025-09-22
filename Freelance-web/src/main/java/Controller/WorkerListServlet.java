package Controller;

import DAO.WorkerDao;
import Model.WorkerModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/worker-list")
public class WorkerListServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private WorkerDao workerDao;

    public void init() {
        workerDao = new WorkerDao();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<WorkerModel> workers = workerDao.getAllWorkers();
            request.setAttribute("workerList", workers);
            request.getRequestDispatcher("worker_list.jsp").forward(request, response);
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
}
