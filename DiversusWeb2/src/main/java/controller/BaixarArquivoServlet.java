package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Conexao;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.sql.Blob;
import java.io.OutputStream;


@WebServlet("/BaixarArquivoServlet")
public class BaixarArquivoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public BaixarArquivoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int usuarioId = Integer.parseInt(request.getParameter("id"));
		
		try (Connection conn = Conexao.criarConexao()) {
            String sql = "SELECT nomeCertificado, certificado FROM especialista WHERE id = ?";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setInt(1, usuarioId);

                try (ResultSet rs = stmt.executeQuery()) {
                    if (rs.next()) {
                        String nomeCertificado = rs.getString("nomeCertificado") + "_certificado.pdf";
                        Blob certificadoBlob = rs.getBlob("certificado");

                        response.setContentType("application/pdf");
                        response.setHeader("Content-Disposition", "attachment; filename=" + nomeCertificado);

                        try (InputStream inputStream = certificadoBlob.getBinaryStream();
                             OutputStream outputStream = response.getOutputStream()) {
                            byte[] buffer = new byte[1024];
                            int bytesRead;
                            while ((bytesRead = inputStream.read(buffer)) != -1) {
                                outputStream.write(buffer, 0, bytesRead);
                            }
                        }
                    }
                }
            }
        }catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Erro ao acessar o banco de dados");
        }
	}

}
