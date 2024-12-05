package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.PostDao;

import java.io.IOException;

@WebServlet("/ExcluirPostServlet")
public class ExcluirPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ExcluirPostServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idPostString = request.getParameter("id");
		int idPost = Integer.parseInt(idPostString);
		PostDao.excluirPostId(idPost);
		response.sendRedirect("RedirecionarServlet?action=inicio");
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
