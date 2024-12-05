package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Especialista;
import model.ExperienciaDao;
import model.ExperienciaProjeto;
import model.Formacao;
import model.FormacaoDao;

import java.io.IOException;

/**
 * Servlet implementation class CriarPortfolioServlet
 */
@WebServlet(urlPatterns = {"/CriarPortfolioServlet", "/CriarExperiencia", "/CriarFormacao"})
public class CriarPortfolioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public CriarPortfolioServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String titulo = request.getParameter("conteudoPortfolio");
		int ano = Integer.parseInt(request.getParameter("anoInput"));
		String cidade = request.getParameter("cidadeInput");
		
		String acao = request.getParameter("acao");
		
		if("CriarExperiencia".equals(acao)) {
			criarExperiencia(request, response, titulo, ano, cidade);
		}
		else if("CriarFormacao".equals(acao)) {
			criarFormacao(request, response, titulo, ano, cidade);
		}
		else if("EditarFormacao".equals(acao)) {
			editarFormacao(request, response, titulo, ano, cidade);
		}
		else if("EditarExperiencia".equals(acao)) {
			editarExperiencia(request, response, titulo, ano, cidade);
		}
	}
	
	protected void criarExperiencia(HttpServletRequest request, HttpServletResponse response, String titulo, int ano, String cidade) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		Especialista especialistaLogado = (Especialista) session.getAttribute("usuarioLogado");
		int idUser = especialistaLogado.getId();
		
		ExperienciaProjeto experiencia = new ExperienciaProjeto(ano, titulo, cidade, idUser);
		
		ExperienciaDao.criarExperiencia(experiencia, idUser);
		response.sendRedirect("RedirecionarServlet?action=perfil&id="+idUser);
	}
	
	protected void editarExperiencia(HttpServletRequest request, HttpServletResponse response, String titulo, int ano, String cidade) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		Especialista especialistaLogado = (Especialista) session.getAttribute("usuarioLogado");
		int idUser = especialistaLogado.getId();
		int idExperiencia = Integer.parseInt(request.getParameter("id"));
		
		ExperienciaProjeto experiencia = new ExperienciaProjeto(ano, titulo, cidade, idUser);
		experiencia.setId(idExperiencia);
		
		ExperienciaDao.editarExperiencia(experiencia);
		
		response.sendRedirect("RedirecionarServlet?action=perfil&id="+idUser);
	}
	
	
	protected void criarFormacao(HttpServletRequest request, HttpServletResponse response, String titulo, int ano, String cidade) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		Especialista especialistaLogado = (Especialista) session.getAttribute("usuarioLogado");
		int idUser = especialistaLogado.getId();
		
		Formacao formacao = new Formacao(ano, titulo, cidade, idUser);
		
		FormacaoDao.criarFormacao(formacao, idUser);
		
		response.sendRedirect("RedirecionarServlet?action=perfil&id="+idUser);
	}
	
	protected void editarFormacao(HttpServletRequest request, HttpServletResponse response, String titulo, int ano, String cidade) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		Especialista especialistaLogado = (Especialista) session.getAttribute("usuarioLogado");
		int idUser = especialistaLogado.getId();
		int idFormacao = Integer.parseInt(request.getParameter("id"));
		
		Formacao formacao = new Formacao(ano, titulo, cidade, idUser);
		formacao.setId(idFormacao);
		
		FormacaoDao.editarFormacao(formacao);
		
		response.sendRedirect("RedirecionarServlet?action=perfil&id="+idUser);
	}

}
