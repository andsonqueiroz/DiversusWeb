package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import model.Especialista;
import model.EspecialistaDao;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Path;
import java.nio.file.Paths;

@MultipartConfig
@WebServlet("/InserirFotoPerfilServlet")
public class InserirFotoPerfilServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public InserirFotoPerfilServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Especialista esp = (Especialista) session.getAttribute("usuarioLogado");
		
		int idUser = esp.getId();
		
		EspecialistaDao.removerFotoEspecialista(idUser);
		response.sendRedirect("RedirecionarServlet?action=perfil&id="+idUser);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		Especialista esp = (Especialista) session.getAttribute("usuarioLogado");
		
		int idUser = esp.getId();
		String imageFileName = null;
        Part file = request.getPart("fotoperfil");

        // Se o arquivo foi selecionado, salva no diretório
        if (file != null && file.getSubmittedFileName() != null && !file.getSubmittedFileName().isEmpty()) {
        	String contentType = file.getContentType();
            String fileExtension = "";
            
            if (contentType.equals("image/jpeg")) {
                fileExtension = ".jpg";
            } else if (contentType.equals("image/png")) {
                fileExtension = ".png";
            } else if (contentType.equals("image/avif")) {
                fileExtension = ".avif";
            } else {
                return;
            }
            imageFileName = Paths.get(file.getSubmittedFileName()).getFileName().toString().replaceAll("\\..*", "") + fileExtension;

            // Caminho relativo ao diretório da aplicação
            String uploadPath = "C:/Users/Andson/OneDrive/Área de Trabalho/Eclipse Java/DiversusWeb2/src/main/webapp/FotosUser/"+imageFileName;
            
            Path uploadDir = Paths.get(uploadPath);
            
            Path filePath = uploadDir.resolve(imageFileName);
            
            
            try
    		{
    		
    		FileOutputStream fos=new FileOutputStream(uploadPath);
    		InputStream is=file.getInputStream();
    		
    		byte[] data=new byte[is.available()];
    		is.read(data);
    		fos.write(data);
    		fos.close();
    		
    		}
    		
    		catch(Exception e)
    		{
    			e.printStackTrace();
    		}
        }
        
        EspecialistaDao.inserirFotoEspecialista(imageFileName, idUser);
        
        response.sendRedirect("RedirecionarServlet?action=perfil&id="+idUser);
	}

}
