package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Comentario;
import model.ComentarioDao;
import model.Especialista;
import model.EspecialistaDao;
import model.ExperienciaDao;
import model.ExperienciaProjeto;
import model.Formacao;
import model.FormacaoDao;
import model.Post;
import model.PostDao;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/RedirecionarServlet")
public class RedirecionarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public RedirecionarServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}


	
	 private void processRequest(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
		 String action = request.getParameter("action");
		 HttpSession session = request.getSession(false);
		 
		 ArrayList<Post> postsTema = new ArrayList<Post>();
		 
		 switch(action) {
		 
		 case "cadastro":
			 response.sendRedirect("cadastro.jsp");
             break;
             
		 case "login":
			 response.sendRedirect("login.jsp");
			 break;
			 
		 case "esqueci":
			 if (session != null && session.getAttribute("usuarioLogado") != null) {
			        response.sendRedirect("inicioLogado.jsp");
			    } else {
			        response.sendRedirect("recuperarSenha.jsp");
			    }
			 break;
			 
		 case "sobre":
			 if (session != null && session.getAttribute("usuarioLogado") != null) {
			        response.sendRedirect("sobreLogado.jsp");
			    } else {
			        response.sendRedirect("sobre.html");
			    }
			 break;
			 
		 case "admin":
			 if(session != null && session.getAttribute("adminLogado") != null) {
				 response.sendRedirect("ListarEspecialistas");
			 }
			 else {
				 response.sendRedirect("loginAdmin.jsp");
			 }
			
			 break;
			 
		 case "inicio":
			 ArrayList<Post> posts = PostDao.listarPosts();
			 request.setAttribute("posts", posts);
			 
			 if (session != null && session.getAttribute("usuarioLogado") != null) {
			        RequestDispatcher rd = request.getRequestDispatcher("inicioLogado.jsp");
					rd.forward(request, response);
			    } else {
			    	RequestDispatcher rd = request.getRequestDispatcher("inicio.jsp");
					rd.forward(request, response);
			    }
			 break;
			 
		 case "inclusao":
			 postsTema = PostDao.listarPostsTema("inclusao");
			 request.setAttribute("postsTema", postsTema);
			 request.setAttribute("tema", "Inclusão Escolar");
			 
			 if (session != null && session.getAttribute("usuarioLogado") != null) {
			        RequestDispatcher rd = request.getRequestDispatcher("iniciotemaLogado.jsp");
					rd.forward(request, response);
			    } else {
			    	RequestDispatcher rd = request.getRequestDispatcher("iniciotema.jsp");
					rd.forward(request, response);
			    }
			 break;
			 
		 case "acessibilidade":
			 postsTema = PostDao.listarPostsTema("acessibilidade");
			 request.setAttribute("postsTema", postsTema);
			 request.setAttribute("tema", "Acessibilidade");
			 
			 if (session != null && session.getAttribute("usuarioLogado") != null) {
			        RequestDispatcher rd = request.getRequestDispatcher("iniciotemaLogado.jsp");
					rd.forward(request, response);
			    } else {
			    	RequestDispatcher rd = request.getRequestDispatcher("iniciotema.jsp");
					rd.forward(request, response);
			    }
			 break;
			 
		 case "deficiencia":
			 postsTema = PostDao.listarPostsTema("deficiencia");
			 request.setAttribute("postsTema", postsTema);
			 request.setAttribute("tema", "Deficiência Visual");
			 
			 if (session != null && session.getAttribute("usuarioLogado") != null) {
			        RequestDispatcher rd = request.getRequestDispatcher("iniciotemaLogado.jsp");
					rd.forward(request, response);
			    } else {
			    	RequestDispatcher rd = request.getRequestDispatcher("iniciotema.jsp");
					rd.forward(request, response);
			    }
			 break;
			 
		 case "autismo":
			 postsTema = PostDao.listarPostsTema("autismo");
			 request.setAttribute("postsTema", postsTema);
			 request.setAttribute("tema", "Autismo");
			 
			 if (session != null && session.getAttribute("usuarioLogado") != null) {
			        RequestDispatcher rd = request.getRequestDispatcher("iniciotemaLogado.jsp");
					rd.forward(request, response);
			    } else {
			    	RequestDispatcher rd = request.getRequestDispatcher("iniciotema.jsp");
					rd.forward(request, response);
			    }
			 break;
			 
		 case "post":
			 int idPost = Integer.parseInt(request.getParameter("id"));
			 Post post = PostDao.listarPostId(idPost);
			 String tema = request.getParameter("tema");
			 ArrayList<Comentario> comentarios = ComentarioDao.listarComentarios(idPost);
			 
			 request.setAttribute("post", post);
			 request.setAttribute("tema", tema);
			 request.setAttribute("comentarios", comentarios);
			 
			 if (session != null && session.getAttribute("usuarioLogado") != null) {
			        RequestDispatcher rd = request.getRequestDispatcher("paginapostLogado.jsp");
					rd.forward(request, response);
			    } else {
			    	RequestDispatcher rd = request.getRequestDispatcher("paginapost.jsp");
					rd.forward(request, response);
			    }
			 break;
			 
		 case "especialistas":
			 
			    if (session != null && session.getAttribute("usuarioLogado") != null) {
			        response.sendRedirect("buscarEspecialistaLogado.jsp");
			    } else {
			        response.sendRedirect("buscarEspecialista.jsp");
			    }
			 break;
			 
		 case "perfil":
			 int idUser = Integer.parseInt(request.getParameter("id"));
			 Especialista esp = EspecialistaDao.buscarEspecialistaPorId(idUser);
			 esp.setExperiencias(ExperienciaDao.listarExperiencias(idUser));
			 esp.setFormacoes(FormacaoDao.listarFormacoes(idUser));
			 esp.setPostsUser(PostDao.listarPostsUser(idUser));
			 
			 request.setAttribute("especialista", esp);

			 
			 if (session != null && session.getAttribute("usuarioLogado") != null) {
				 	RequestDispatcher rd = request.getRequestDispatcher("perfilLogado.jsp");
					rd.forward(request, response);
			    } else {
			    	RequestDispatcher rd = request.getRequestDispatcher("perfil.jsp");
					rd.forward(request, response);
			    }
			 break;
			 
		 case "configuracoes":
			 if (session != null && session.getAttribute("usuarioLogado") != null) {
			        response.sendRedirect("configuracoes.jsp");
			    } else {
			        response.sendRedirect("login.jsp");
			    }
			 break;
		 case "editarPerfil":
			 response.sendRedirect("AlterarDadosEspecialista.jsp");
			 break;
		 }
	 }

}
