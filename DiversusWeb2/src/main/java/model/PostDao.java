package model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class PostDao {
	
	public static boolean criarPost(Post post, ArrayList<String> temas) {
		boolean sucesso = false;
		String sql = "INSERT INTO post(titulo, subtitulo, conteudo, iduser, temaPredominante, caminhoImg) values (?, ?, ?, ?, ?, ?)";
		
		PreparedStatement ps = null;	
		ResultSet rs = null;

		try {
			ps = Conexao.criarConexao().prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
			
			ps.setString(1, post.getTitulo());
			ps.setString(2, post.getSubtitulo());
			ps.setString(3, post.getConteudo());
			ps.setInt(4, post.getIduser());

			if(post.getTemaPredominante().equals("inclusao")) {
				ps.setString(5, "Inclusão Educacional");
			}
			else if(post.getTemaPredominante().equals("acessibilidade")) {
				ps.setString(5, "Acessibilidade");
			}
			else if(post.getTemaPredominante().equals("autismo")) {
				ps.setString(5, "Autismo");
			}
			else if(post.getTemaPredominante().equals("deficiencia")) {
				ps.setString(5, "Deficiência Visual");
			}
			
			ps.setString(6, post.getCaminhoImg());
			
			int rowsAffected = ps.executeUpdate();
			
			if(rowsAffected > 0) {
				sucesso = true;
				rs = ps.getGeneratedKeys();
				
				if (rs.next()) {
	                int idPost = rs.getInt(1);
	                inserirPostTema(temas, idPost);
	            }
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();	
		}finally {
		    try {
		        if (ps != null) {
		            ps.close();
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }
		}
		return sucesso;	
	}
	
	public static boolean inserirPostTema(ArrayList<String> temas, int id) {
		boolean sucesso = false;
		
		PreparedStatement ps = null;
		
		for(int i=0; i < temas.size(); i++) {
			try {
				
				String temaTabela = temas.get(i);
				String sql = "INSERT INTO " + temaTabela + " (idPost) VALUES (?)";
				
				ps = Conexao.criarConexao().prepareStatement(sql);
				
				ps.setInt(1, id);
				
				int rowsAffected = ps.executeUpdate();
				
				if(rowsAffected > 0) {
					sucesso = true;
				}
				ps.close();
				
				
			}catch (SQLException e) {
				e.printStackTrace();	
			}
		}
		return sucesso;
	}
	
	
	public static ArrayList<Post> listarPosts(){
		String sql = "SELECT * from post";
		
		ArrayList<Post> posts = new ArrayList<>();
		PreparedStatement ps = null;
		
	    ResultSet rs = null;
	    
	    try {
	    	ps = Conexao.criarConexao().prepareStatement(sql);
            
            rs = ps.executeQuery(); 
            
	    	while(rs.next()) {
	    		Post post = new Post();
	    		
	    		post.setId(rs.getInt(1));
	    		post.setTitulo(rs.getString(2));
	    		post.setSubtitulo(rs.getString(3));
	    		post.setConteudo(rs.getString(4));
	    		post.setIduser(rs.getInt(5));
	    		post.setDatapub(rs.getString(6));
	    		post.setTemaPredominante(rs.getString(7));
	    		post.setCaminhoImg(rs.getString(8));
	    		
	    		posts.add(post);
	    	}
	    	
	    } catch (SQLException e) {		
            e.printStackTrace();
        }
	    return posts;
	}
	
	
	public static Post listarPostId(int id){
		String sql = "SELECT * from post where id = ?";
		
		Post post = new Post();
		PreparedStatement ps = null;
		
	    ResultSet rs = null;
	    
	    try {
	    	ps = Conexao.criarConexao().prepareStatement(sql);
	    	ps.setInt(1, id);
            
            rs = ps.executeQuery(); 
            
	    	if(rs.next()) {	    		
	    		post.setId(rs.getInt(1));
	    		post.setTitulo(rs.getString(2));
	    		post.setSubtitulo(rs.getString(3));
	    		post.setConteudo(rs.getString(4));
	    		post.setIduser(rs.getInt(5));
	    		post.setDatapub(rs.getString(6));
	    		post.setTemaPredominante(rs.getString(7));
	    		post.setCaminhoImg(rs.getString(8));
	    		
	    	}
	    	rs.close();
	    	
	    } catch (SQLException e) {		
            e.printStackTrace();
        }
	    return post;
	}
	
	
	public static ArrayList<Post> listarPostsUser(int iduser){
		String sql = "SELECT * from post where iduser = ?";
		
		ArrayList<Post> posts = new ArrayList<>();
		PreparedStatement ps = null;
		
	    ResultSet rs = null;
	    
	    try {
	    	ps = Conexao.criarConexao().prepareStatement(sql);
	    	ps.setInt(1, iduser);

            rs = ps.executeQuery(); 
            
	    	while(rs.next()) {
	    		Post post = new Post();
	    		
	    		post.setId(rs.getInt(1));
	    		post.setTitulo(rs.getString(2));
	    		post.setSubtitulo(rs.getString(3));
	    		post.setConteudo(rs.getString(4));
	    		post.setIduser(rs.getInt(5));
	    		post.setDatapub(rs.getString(6));
	    		post.setTemaPredominante(rs.getString(7));
	    		post.setCaminhoImg(rs.getString(8));
	    		
	    		posts.add(post);
	    	}
	    	
	    } catch (SQLException e) {		
            e.printStackTrace();
        }
	    return posts;
	}
	
	
	
	public static ArrayList<Post> listarPostsTema(String tema){
		String sql = "SELECT * from "+tema;
		
		ArrayList<Post> posts = new ArrayList<>();
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			ps = Conexao.criarConexao().prepareStatement(sql);				
			rs = ps.executeQuery();
			
			while(rs.next()) {
				Post post = listarPostId(rs.getInt(2));
				
	    		posts.add(post);
			}
			
		}catch (SQLException e) {		
            e.printStackTrace();
        }
	    return posts;
	}
	
	public static String exibirHorarioPub(int id) {
		String sql = "SELECT CASE WHEN TIMESTAMPDIFF(MINUTE, datapub, NOW()) < 60 THEN "
				+ "CONCAT(TIMESTAMPDIFF(MINUTE, datapub, NOW()), ' minuto(s) atrás')"
				+ "WHEN TIMESTAMPDIFF(HOUR, datapub, NOW()) < 24 THEN "
				+ "CONCAT(TIMESTAMPDIFF(HOUR, datapub, NOW()), ' hora(s) atrás')"
				+ "ELSE CONCAT(TIMESTAMPDIFF(DAY, datapub, NOW()), ' dia(s) atrás')"
				+ "END AS tempo_decorrido FROM post where id = ?";
		String horario = "";
		
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			ps = Conexao.criarConexao().prepareStatement(sql);
			ps.setInt(1, id);
			
			rs = ps.executeQuery();
			
			if(rs.next()) {
				horario = rs.getString(1);
			}
		}catch (SQLException e) {		
            e.printStackTrace();
        }
		return horario;
	}
	
	
	public static int exibirTotalComentarios(int idPost){
		String sql = "SELECT count(*) from comentario where idpost = ?";
		int total = 0;
		
		PreparedStatement ps = null;
		
	    ResultSet rs = null;
	    
	    try {
	    	ps = Conexao.criarConexao().prepareStatement(sql);
	    	ps.setInt(1, idPost);
            
            rs = ps.executeQuery(); 
            
	    	if(rs.next()) {	    		
	    		total = rs.getInt(1);
	    	}
	    	rs.close();
	    	
	    } catch (SQLException e) {		
            e.printStackTrace();
        }
	    return total;
	}
	
	public static void excluirPostId(int id) {
		String sql = "DELETE FROM post WHERE id = ?";
		
		PreparedStatement ps = null;
		
		try {
			ps = Conexao.criarConexao().prepareStatement(sql);
			
			ps.setInt(1, id);
		
			ps.execute();
			ps.close();
			
			
		} catch (SQLException e) {
			e.printStackTrace();	
		}
	}
}
