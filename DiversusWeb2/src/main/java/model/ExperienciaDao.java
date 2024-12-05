package model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ExperienciaDao {
	
	public static boolean criarExperiencia(ExperienciaProjeto experiencia, int idUser) {
		String sql = "INSERT INTO experienciaProjeto(ano, conteudo, cidade, userId) values(?, ?, ?, ?)";
		
		PreparedStatement ps = null;	
		ResultSet rs = null;
		
		boolean sucesso = false;
		
		try {
			ps = Conexao.criarConexao().prepareStatement(sql);
			
			ps.setInt(1, experiencia.getAno());
			ps.setString(2, experiencia.getConteudo());
			ps.setString(3, experiencia.getCidade());
			ps.setInt(4, experiencia.getUserId());


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
	
	
	public static ArrayList<ExperienciaProjeto> listarExperiencias(int idUser){
		String sql= "SELECT * FROM experienciaProjeto WHERE userId =" + idUser;
		
		ArrayList<ExperienciaProjeto> experiencias = new ArrayList<>();
		
		PreparedStatement ps = null;
		
	    ResultSet rs = null;
	    
	    try {
	    	ps = Conexao.criarConexao().prepareStatement(sql);
            rs = ps.executeQuery(); 
            
	    	while(rs.next()) {	    
	    		ExperienciaProjeto experiencia = new ExperienciaProjeto();
	    		experiencia.setId(rs.getInt(1));
	    		experiencia.setAno(rs.getInt(2));
	    		experiencia.setConteudo(rs.getString(3));
	    		experiencia.setCidade(rs.getString(4));
	    		experiencia.setUserId(rs.getInt(5));
	    		
	    		experiencias.add(experiencia);
	    		
	    	}
	    	rs.close();
	    	
	    } catch (SQLException e) {		
            e.printStackTrace();
        }
	    return experiencias;
	}
	
	
	public static boolean deletarExperiencia(int id) {
		String sql = "delete from experienciaProjeto where id = ?";
		
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
	
	
	public static void editarExperiencia(ExperienciaProjeto experiencia) {
		String sql = "update experienciaProjeto set ano = ?, conteudo = ?, cidade = ? where id = ?";
		
		PreparedStatement ps = null;
		
		try {
			ps = Conexao.criarConexao().prepareStatement(sql);
			
			ps.setInt(1, experiencia.getAno());
			ps.setString(2, experiencia.getConteudo());
			ps.setString(3, experiencia.getCidade());
			ps.setInt(4, experiencia.getId());
			
			ps.execute();
			
			ps.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
