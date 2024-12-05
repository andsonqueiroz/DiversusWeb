package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Conexao;
import model.Especialista;

import java.io.IOException;
import java.io.InputStream;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.http.Part;


@WebServlet("/UploadCertificadoServlet")
@MultipartConfig
public class UploadCertificadoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public UploadCertificadoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Part filePart = request.getPart("anexo"); 
		String fileName = filePart.getSubmittedFileName();
		InputStream fileContent = filePart.getInputStream();
		
		
		HttpSession session = request.getSession();
		Especialista esp = (Especialista) session.getAttribute("usuarioLogado");
		
		String sql = "UPDATE especialista SET nomeCertificado = ?, certificado = ? WHERE email = ?";
		
		PreparedStatement ps = null;	
		
		try {
			
			ps = Conexao.criarConexao().prepareStatement(sql);
			ps.setString(1, fileName);
			ps.setBlob(2, fileContent);
			ps.setString(3, esp.getEmail());
			
			int rowsAffected = ps.executeUpdate();
			
			if(rowsAffected > 0) {
				System.out.print("anexo enviado.");
			}
			else {
				System.out.print("anexo NÃO enviado.");
			}
			
			ps.close();
			
		}catch (SQLException e) {
			e.printStackTrace();
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("pendente.html");
		rd.forward(request, response);
			
	}
	
}
