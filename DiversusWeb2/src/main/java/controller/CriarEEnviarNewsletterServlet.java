package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Admin;

import java.io.IOException;

import javax.mail.MessagingException;


@WebServlet("/CriarEEnviarNewsletter")
public class CriarEEnviarNewsletterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        	try {
        		Admin.criarEEnviarNewsletter();
        		
        	} catch (MessagingException e) {
				e.printStackTrace();
			}
        	response.sendRedirect("ListarEspecialistas");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
