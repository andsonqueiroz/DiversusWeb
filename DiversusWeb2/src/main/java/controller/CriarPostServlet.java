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
import model.Post;
import model.PostDao;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;

@MultipartConfig
@WebServlet("/CriarPostServlet")
public class CriarPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public CriarPostServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Especialista esp = (Especialista) session.getAttribute("usuarioLogado");
		
		String titulo = request.getParameter("titulo");
		String subtitulo = request.getParameter("subtitulo");
		String conteudo = request.getParameter("conteudo");
		int iduser =  esp.getId();
		
		ArrayList<String> temas = new ArrayList<String>();
		if(request.getParameter("inclusao") != null) {
		    temas.add("inclusao");
		}
		if(request.getParameter("acessibilidade") != null) {
			temas.add("acessibilidade");
		}
		if(request.getParameter("autismo") != null) {
			temas.add("autismo");
		}
		if(request.getParameter("deficiencia") != null) {
			temas.add("deficiencia");
		}
		
		
		String imageFileName = null;
        Part file = request.getPart("fotopost");

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
            String uploadPath = "C:/Users/Andson/OneDrive/Área de Trabalho/Eclipse Java/DiversusWeb2/src/main/webapp/FotosPost/"+imageFileName;
            
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
        

        Post post = new Post(titulo, subtitulo, conteudo, iduser);
        post.setTemaPredominante(temas.get(0));

        if (imageFileName != null) {
            post.setCaminhoImg(imageFileName);
        }
		
		PostDao.criarPost(post, temas);
		
		response.sendRedirect("RedirecionarServlet?action=inicio");
	}

}
