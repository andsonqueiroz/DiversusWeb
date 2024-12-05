package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Especialista;
import model.EspecialistaDao;

import java.io.IOException;
import java.util.ArrayList;


@WebServlet("/ListarEspecialistas")
public class ListarEspecialistas extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ListarEspecialistas() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		ArrayList<Especialista> especialistas = EspecialistaDao.buscarEspecialistas();
		request.setAttribute("especialistas", especialistas);
		RequestDispatcher rd = request.getRequestDispatcher("aprovacaoDeEspecialista.jsp");
		rd.forward(request, response);
	}


}
