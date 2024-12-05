package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Admin;
import model.AdminDao;
import model.Especialista;
import model.EspecialistaDao;

import java.io.IOException;


@WebServlet(urlPatterns = {"/LoginServlet", "/LoginAdmin"})
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String senha = request.getParameter("senha");
		
		String action = request.getServletPath();
		
		if(action.equals("/LoginAdmin")) {
			logarAdmin(request, response);
		}
		else {
			Especialista e = EspecialistaDao.buscarEspecialistaPorEmail(email);
		
			boolean loginsucesso = false;
			
			if(e != null && e.getSenha().equals(senha)) {
				
				if(!e.isEspecialista()) {
					RequestDispatcher rd = request.getRequestDispatcher("pendente.html");
					rd.forward(request, response);
				}
				else {
					loginsucesso = true;
				}
			}
			if(loginsucesso) {
				HttpSession session = request.getSession();
				session.setAttribute("usuarioLogado", e);
				response.sendRedirect("RedirecionarServlet?action=inicio");
			}
			else {
				request.setAttribute("erro", "Email e/ou senha incorretos");
				RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
				rd.forward(request, response);
			}
		}
		
	}
	
	protected void logarAdmin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String senha = request.getParameter("senha");
		
		Admin a = AdminDao.buscarAdminPorEmail(email);
		
		boolean loginsucesso = false;
		
		if(a != null && a.getSenha().equals(senha)) {
			
			HttpSession session = request.getSession();
			session.setAttribute("adminLogado", a);
			
			loginsucesso = true;
		}
		else {
			request.setAttribute("erro", "Email e/ou senha incorretos");
			
			RequestDispatcher rd = request.getRequestDispatcher("loginAdmin.jsp");
			rd.forward(request, response);
		}
		if(loginsucesso) {
			response.sendRedirect("ListarEspecialistas");
		}
	}

}
