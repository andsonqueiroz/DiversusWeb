package model;

import java.util.List;
import javax.mail.*;

import controller.EmailSender;

public class Admin extends Usuario{
	private boolean admin;
	
	public Admin(String nome, String email, String senha, String data, String genero) {
		super(nome, email, senha, data, genero);
	}
	
	public Admin(String nome, String email) {
		super(nome, email);
	}
	
	public Admin() {
		
	}
	
	public boolean cadastrarAdmin(Admin admin) {
		return AdminDao.cadastrarAdmin(admin);
	}
	
	public boolean removerAdmin(Admin admin) {
		return AdminDao.deletarAdmin(admin);
	}

	public boolean isAdmin() {
		return admin;
	}

	public void setAdmin(boolean admin) {
		this.admin = admin;
	}
	
	public static void criarEEnviarNewsletter() throws MessagingException {
		enviarNewsletter(criarNewsletter());
	}
	
	private static void enviarNewsletter(String conteudoHTML) throws MessagingException {
        try {
        	EmailSender.sendEmail(NewsletterDAO.getAssinantes(), conteudoHTML);
        } catch (MessagingException e) {
            e.printStackTrace();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
	}
	
	 private static String criarNewsletter() {
	        try {
	            List<PostNewsletter> posts = NewsletterDAO.getPosts();
	            StringBuilder html = new StringBuilder();
	            html.append("<html lang=\"pt-br\">")
	                    .append("<body>")
	                    .append("<!-- Cabecalho -->")
	                    .append("<table class=\"bg-fffffe\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" role=\"presentation\" bgcolor=\"white\" width=\"668.00\" style=\"background-color: white; width: 668px; border-spacing: 0; font-family: Krub, Tahoma, sans-serif; min-width: 668px\">")
	                    .append("<tr><td valign=\"top\" width=\"100.00%\" style=\"padding-top: 17px; width: 100%; vertical-align: top\">")
	                    .append("<td cellpadding=\"0\" cellspacing=\"0\" border=\"0\" role=\"presentation\" width=\"100.00%\" style=\"width: 100%; border-spacing: 0\"><tr>")
	                    .append("<td align=\"center\" style=\"padding-bottom: 36px\">")
	                    .append("<table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" role=\"presentation\" width=\"207.55\" style=\"width: 207.55px; border-spacing: 0\">")
	                    .append("<tr><td valign=\"middle\" style=\"padding-right: 2.55px; vertical-align: middle\">")
	                    .append("<img src=\"https://github.com/Breno6658/Diversus/blob/main/Barra%20superior.png?raw=true\" width=\"210\" style=\"border: none; max-width: initial; object-fit: contain; width: 210px; display: block\" />")
	                    .append("</td></tr></table></td></tr><tr>")
	                    .append("<td align=\"left\" style=\"padding-top: 16px; padding-bottom: 20.85px; padding-left: 20px\">")
	                    .append("<p class=\"color-242424\" width=\"100.00%\" style=\"font-size: 15px; font-weight: 500; color: #242424; margin: 0; padding: 0; width: 100%; line-height: 15.15px; mso-line-height-rule: exactly\">Nossas novidades do dia:</p>")
	                    .append("</td></tr>");
	            for (PostNewsletter post : posts) {
	                html.append("<tr><td valign=\"top\" width=\"419\" style=\"padding-left: 8px; width: 419px; vertical-align: top\">")
	                        .append("<table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" role=\"presentation\" width=\"100.00%\" style=\"width: 100%; border-spacing: 0\">")
	                        .append("<tr><td align=\"left\" style=\"padding-bottom: 5.21px; padding-left: 2px; padding-right: 28px\">")
	                        .append("<p class=\"color-242424\" width=\"100.00%\" style=\"font-size: 15px; font-weight: 700; text-align: left; color: #242424; margin: 0; padding: 0; width: 100%\">")
	                        .append(post.getTitulo())
	                        .append("</p></td></tr><tr><td align=\"left\" style=\"padding-top: 5.21px; padding-bottom: 5.16px; padding-left: 2px; padding-right: 39px\">")
	                        .append("<p class=\"color-999999\" width=\"100.00%\" style=\"font-size: 12px; font-weight: 500; text-align: left; color: #999999; margin: 0; padding: 0; width: 100%\">")
	                        .append(post.getSubtitulo())
	                        .append("</p></td></tr><tr><td align=\"left\" style=\"padding-top: 5.16px; padding-bottom: 4.94px; padding-left: 2px\">")
	                        .append("<p class=\"color-999999\" width=\"100.00%\" style=\"font-size: 11px; font-weight: 500; color: #999999; margin: 0; padding: 0; width: 100%; line-height: 11.11px; mso-line-height-rule: exactly\">")
	                        .append(post.getDiasDesdePostagem())
	                        .append(" dia(s) atrá(s)")
	                        .append("</p></td></tr><tr><td align=\"left\" style=\"padding-top: 4.94px\">")
	                        .append("<table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" role=\"presentation\" style=\"margin: 0; border-spacing: 0\">")
	                        .append("<tr><td valign=\"top\" width=\"31\" style=\"width: 31px; vertical-align: top\">")
	                        .append("<p class=\"color-242424\" width=\"31\" style=\"font-size: 12px; font-weight: 500; color: #242424; margin: 0; padding: 0; width: 31px; line-height: 12.12px; mso-line-height-rule: exactly\">Por:</p>")
	                        .append("</td><td valign=\"top\" width=\"87\" style=\"width: 87px; vertical-align: top\">")
	                        .append("<p class=\"color-242424\" width=\"87\" style=\"font-size: 10px; font-weight: 500; color: #242424; margin: 0; padding: 0; width: 87px; line-height: 15.15px; mso-line-height-rule: exactly\">")
	                        .append(post.getNome())
	                        .append("</p></td></tr></table></td></tr></table></td></tr>");
	                if (posts.indexOf(post) != posts.size() - 1) {
	                    html.append("<tr><td style=\"padding-top: 8.75px; padding-bottom: 7.75px; padding-left: 28.5px; padding-right: 28.5px\">")
	                            .append("<div width=\"611\" style=\"border-top: 1px solid #d9d9d9; width: 611px; mso-border-top-alt: none\"></div></td></tr>");
	                }
	            }
	            html.append("</table>")
	                    .append("<!-- Rodape -->")
	                    .append("<tr><td style=\"padding-top: 16px\"><div class=\"bg-246ce0\" bgcolor=\"#246ce0\" height=\"211\" width=\"668\" style=\"background-color: #246ce0; height: 150px; width: 668px; padding: 16px; color: white; font-family: Arial, sans-serif; font-size: 14px;\">")
	                    .append("<p>Você recebeu este e-mail porque forneceu seu endereço de e-mail para uma lista de assinantes da Newsletter da Diversus.</p>")
	                    .append("<p>Caso você não queira receber nossos comunicados, <a href=\"DiversusWeb/web/CancelarNewsletter.html\" style=\"color: #ffdd00;\">clique aqui</a></p>")
	                    .append("<p style=\"text-decoration: none; color: #ffffff;\">Este e-mail foi enviado por: plataforma.diversus@gmail.com</p>")
	                    .append("</div></td></tr></body>")
	                    .append("</html>");
	            return html.toString();
	        } catch (Exception e) {
	            e.printStackTrace();
	            return "Erro ao criar a newsletter.";
	        }
	    }

	
}
