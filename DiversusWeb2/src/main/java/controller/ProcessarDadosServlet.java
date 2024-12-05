package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.Serial;
import java.sql.SQLException;
import model.EmailDAO;

@WebServlet("/processarDados")
public class ProcessarDadosServlet extends HttpServlet {
    @Serial
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");

        EmailDAO emailDAO = new EmailDAO();
        try {
            emailDAO.removeEmail(email);
            response.getWriter().write("E-mail removido com sucesso.");
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            response.getWriter().write("Erro ao remover e-mail.");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { request.getRequestDispatcher("/adicionarUsuario.html").forward(request, response); }
}

