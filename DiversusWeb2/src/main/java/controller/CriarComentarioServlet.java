package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Comentario;
import model.ComentarioDao;
import model.Especialista;
import model.PostDao;

import java.io.IOException;

@WebServlet(urlPatterns = {"/CriarComentarioServlet", "/excluirComentarioServlet"})
public class CriarComentarioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public CriarComentarioServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		int idComentario = Integer.parseInt(request.getParameter("id"));
		int idPost = Integer.parseInt(request.getParameter("idpost"));
		
		if(action.equals("excluir")) {
			ComentarioDao.deletarComentario(idComentario);
		}
		response.sendRedirect("RedirecionarServlet?action=post&id="+idPost+"&tema="+PostDao.listarPostId(idPost).getTemaPredominante());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Especialista especialista = (Especialista) session.getAttribute("usuarioLogado");
		
		int idUser = especialista.getId();
		String conteudo = request.getParameter("conteudo");
		String idPostString = request.getParameter("idPost");
		int idPost = Integer.parseInt(idPostString);
		
		Comentario comentario = new Comentario(conteudo, idPost, idUser);
		
		ComentarioDao.criarComentario(comentario);
		
		response.sendRedirect("RedirecionarServlet?action=post&id="+idPost+"&tema="+PostDao.listarPostId(idPost).getTemaPredominante());
	}

}
