package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Conexao;
import model.EspecialistaDao;
import model.Especialista;

import java.io.IOException;
import java.io.PrintWriter;


@WebServlet("/CadastrarUsuarioServlet")
public class CadastrarUsuarioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public CadastrarUsuarioServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String nome = request.getParameter("nome");
		String especialidade = request.getParameter("especialidade");
		String email = request.getParameter("email");
		String dataNasc = request.getParameter("dataNasc");
		String genero = request.getParameter("genero");
		String senha = request.getParameter("senha");
		
		boolean inserido = false;
		
		if(EspecialistaDao.buscarEspecialistaPorEmail(email) == null) {
			Especialista especialista = new Especialista(nome, email, senha, dataNasc, genero, especialidade);

			inserido = EspecialistaDao.cadastrarEspecialista(especialista);
		}
		else {
			request.setAttribute("erro", "Uma conta com este Email já existe.");
			RequestDispatcher dispatcher = request.getRequestDispatcher("cadastro.jsp");
	        dispatcher.forward(request, response);
		}
		
		
		if(inserido) {
			Especialista e = new Especialista(email, senha);
			HttpSession session = request.getSession();
			session.setAttribute("usuarioLogado", e);
			
			  RequestDispatcher dispatcher = request.getRequestDispatcher("certificado.html");
		        dispatcher.forward(request, response);	/*DISPATCHER FORWARD: a requisição do usuário será encaminhada para ser 
		        atendida por outro recurso (outro servlet), e com reprodução de imagem de certificado.html */
		}

	}

}
