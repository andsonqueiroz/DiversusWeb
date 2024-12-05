package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Especialista;
import model.ExperienciaDao;
import model.FormacaoDao;

import java.io.IOException;


@WebServlet("/ExcluirPortfolioServlet")
public class ExcluirPortfolioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ExcluirPortfolioServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String action = request.getParameter("action");
		int id = Integer.parseInt(request.getParameter("id"));
		HttpSession session = request.getSession(false);
		Especialista esp = (Especialista) session.getAttribute("usuarioLogado");
		int idUser = esp.getId();
		
		if(action.equals("experiencia")) {
			excluirExperiencia(request, response, id, idUser);
		}
		else if(action.equals("formacao")) {
			excluirFormacao(request, response, id, idUser);
		}
	}
	
	protected void excluirExperiencia(HttpServletRequest request, HttpServletResponse response, int id, int idUser) throws ServletException, IOException {
		ExperienciaDao.deletarExperiencia(id);
		response.sendRedirect("RedirecionarServlet?action=perfil&id="+idUser);
	}
	
	protected void excluirFormacao(HttpServletRequest request, HttpServletResponse response, int id, int idUser) throws ServletException, IOException {
		FormacaoDao.deletarFormacao(id);
		response.sendRedirect("RedirecionarServlet?action=perfil&id="+idUser);
	}


}
