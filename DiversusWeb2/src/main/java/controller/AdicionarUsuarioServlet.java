package controller;

import model.PostDao;
import model.UsuarioDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/adicionarUsuario")
public class AdicionarUsuarioServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String action = (String) request.getParameter("action");

        UsuarioDAO usuarioDAO = new UsuarioDAO();
        try {
            usuarioDAO.adicionarUsuario(email);
            
        } catch (Exception e) {
        }
        
        switch (action) {
	        
			case "inicio":
				response.sendRedirect("RedirecionarServlet?action=inicio");
				break;
				
			case "especialistas":
				response.sendRedirect("RedirecionarServlet?action=especialistas");
				break;
				
			case "tema":
				String tema = request.getParameter("temaPagina");
				response.sendRedirect("RedirecionarServlet?action="+tema);
				break;
				
			case "post":
				int idPost = Integer.parseInt(request.getParameter("idPost"));
				String temaPost = PostDao.listarPostId(idPost).getTemaPredominante();
				response.sendRedirect("RedirecionarServlet?action=post&id="+ idPost +"&tema="+temaPost);
				break;
		}
        
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/adicionarUsuario.html").forward(request, response);
    }
}
