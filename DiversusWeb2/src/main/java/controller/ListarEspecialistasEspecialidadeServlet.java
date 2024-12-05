package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Especialista;
import model.EspecialistaDao;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/ListarEspecialistasEspecialidadeServlet")
public class ListarEspecialistasEspecialidadeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ListarEspecialistasEspecialidadeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 HttpSession session = request.getSession(false);
		 
		String especialidade = request.getParameter("especialidade");
		ArrayList <Especialista> especialistas = EspecialistaDao.buscarEspecialistasPorEspecialidade(especialidade);
		
		request.setAttribute("listaEspecialistas", especialistas);
	 
	    if (session != null && session.getAttribute("usuarioLogado") != null) {
	    	RequestDispatcher rd = request.getRequestDispatcher("buscarEspecialistaLogado.jsp");
			rd.forward(request, response);
	    } else {
	    	RequestDispatcher rd = request.getRequestDispatcher("buscarEspecialista.jsp");
			rd.forward(request, response);
	    }
	}

}
