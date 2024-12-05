package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class NewsletterDAO {
	
	private Connection getConnection() throws Exception {
        return Conexao.criarConexao();
    }

    public static List<PostNewsletter> getPosts() throws Exception {
        List<PostNewsletter> posts = new ArrayList<>();
        try (Connection conn = Conexao.criarConexao();
             PreparedStatement stmt = conn.prepareStatement("SELECT p.titulo, p.subtitulo, DATEDIFF(current_date, p.datapub) AS diasDesdePostagem, e.nome FROM post p JOIN especialista e ON p.iduser = e.id WHERE DATEDIFF(current_date, p.datapub) <= 5 LIMIT 3;");
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                posts.add(new PostNewsletter(
                        rs.getString("titulo"),
                        rs.getString("subtitulo"),
                        rs.getString("diasDesdePostagem"),
                        rs.getString("nome")));
            }
        } catch (RuntimeException e) {
            throw new RuntimeException(e);
        }
        return posts;
    }

    public static List<String> getAssinantes()throws Exception {
        List<String> assinantes = new ArrayList<>();
        try (Connection conn = Conexao.criarConexao();
             PreparedStatement stmt = conn.prepareStatement("SELECT * FROM assinante;");
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                assinantes.add(rs.getString("email"));
            }
        } catch (RuntimeException e) {
            throw new RuntimeException(e);
        }
        return assinantes;
    }
    
}



