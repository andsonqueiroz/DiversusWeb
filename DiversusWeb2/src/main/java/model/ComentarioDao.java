package model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ComentarioDao {
	
	public static boolean criarComentario(Comentario comentario) {
		String sql = "INSERT INTO comentario(conteudo, idpost, idUser) values(?, ?, ?)";
		
		PreparedStatement ps = null;	
		ResultSet rs = null;
		
		boolean sucesso = false;
		
		try {
			ps = Conexao.criarConexao().prepareStatement(sql);
			
			ps.setString(1, comentario.getConteudo());
			ps.setInt(2, comentario.getIdPost());
			ps.setInt(3, comentario.getIdUser());


			int rowsAffected = ps.executeUpdate();

			if(rowsAffected > 0) {
				sucesso = true;
			}
			ps.close();
			
			
		}catch (SQLException e) {
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
	
	public static ArrayList<Comentario> listarComentarios(int idPost){
		String sql= "SELECT * FROM comentario WHERE idpost =" + idPost;
		
		ArrayList<Comentario> comentarios = new ArrayList<>();
		
		PreparedStatement ps = null;
		
	    ResultSet rs = null;
	    
	    try {
	    	ps = Conexao.criarConexao().prepareStatement(sql);
            rs = ps.executeQuery(); 
            
	    	while(rs.next()) {	    
	    		Comentario comentario = new Comentario();
	    		comentario.setId(rs.getInt(1));
	    		comentario.setConteudo(rs.getString(2));
	    		comentario.setIdPost(rs.getInt(3));
	    		comentario.setIdUser(rs.getInt(4));
	    		
	    		comentarios.add(comentario);
	    		
	    	}
	    	rs.close();
	    	
	    } catch (SQLException e) {		
            e.printStackTrace();
        }
	    return comentarios;
	}
	
	public static boolean deletarComentario(int id) {
		String sql = "delete from comentario where id = ?";
		
		boolean sucesso = false;
		
		PreparedStatement ps = null;
		
		try {
			ps = Conexao.criarConexao().prepareStatement(sql);
			
			ps.setInt(1, id);
			
			int rowsAffected = ps.executeUpdate();
			
			if(rowsAffected > 0) {
				sucesso = true;
			}
			
			ps.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return sucesso;
	}
	

}
