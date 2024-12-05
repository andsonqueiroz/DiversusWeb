package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Conexao;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


@WebServlet(urlPatterns = {"/AprovacaoServlet", "/aprovarEspecialista", "/reprovarEspecialista"})
public class AprovacaoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public AprovacaoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getServletPath();
		
		if(action.equals("/aprovarEspecialista")) {
			aprovarEspecialista(request, response);
		}
		else if(action.equals("/reprovarEspecialista")) {
			reprovarEspecialista(request, response);
		}
		
	}
	
	protected void aprovarEspecialista(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		int usuarioId = Integer.parseInt(request.getParameter("id"));
			
		try (Connection conn = Conexao.criarConexao()) {
			String sql = "UPDATE especialista SET especialista = 1 WHERE id = ?";
			try (PreparedStatement stmt = conn.prepareStatement(sql)) {
				stmt.setInt(1, usuarioId);
	
				stmt.execute();
	                
				stmt.close();
			}
		}catch (SQLException e) {
			e.printStackTrace();
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Erro ao acessar o banco de dados");
		}
		
		response.sendRedirect("ListarEspecialistas");
	}
	
	protected void reprovarEspecialista(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		int usuarioId = Integer.parseInt(request.getParameter("id"));
			
		try (Connection conn = Conexao.criarConexao()) {
			String sql = "DELETE from especialista WHERE id = ?";
			try (PreparedStatement stmt = conn.prepareStatement(sql)) {
				stmt.setInt(1, usuarioId);
	
				stmt.execute();
	                
				stmt.close();
			}
		}catch (SQLException e) {
			e.printStackTrace();
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Erro ao acessar o banco de dados");
		}
		
		response.sendRedirect("ListarEspecialistas");
	}

}
