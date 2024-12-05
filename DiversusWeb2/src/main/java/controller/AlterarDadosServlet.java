package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Especialista;
import model.EspecialistaDao;

import java.io.IOException;

/**
 * Servlet implementation class AlterarDadosServlet
 */
@WebServlet("/AlterarDadosServlet")
public class AlterarDadosServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AlterarDadosServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		Especialista esp = (Especialista) session.getAttribute("usuarioLogado");
		int id = esp.getId();
		String nome = request.getParameter("nome");
		String especialidade = request.getParameter("especialidade");
		String email = request.getParameter("email");
		String telefone = request.getParameter("telefone");
		String cidade = request.getParameter("cidade");
		
		EspecialistaDao.editar(nome, especialidade, email, telefone, cidade, id);
		
		response.sendRedirect("RedirecionarServlet?action=perfil&id="+id);
	}

}
