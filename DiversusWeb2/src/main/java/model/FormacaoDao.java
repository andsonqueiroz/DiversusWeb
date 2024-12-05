package model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class FormacaoDao {
	
	public static boolean criarFormacao(Formacao formacao, int idUser) {
		String sql = "INSERT INTO formacao(ano, conteudo, cidade, userId) values(?, ?, ?, ?)";
		
		PreparedStatement ps = null;	
		ResultSet rs = null;
		
		boolean sucesso = false;
		
		try {
			ps = Conexao.criarConexao().prepareStatement(sql);
			
			ps.setInt(1, formacao.getAno());
			ps.setString(2, formacao.getConteudo());
			ps.setString(3, formacao.getCidade());
			ps.setInt(4, formacao.getUserId());


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
	
	
	public static ArrayList<Formacao> listarFormacoes(int idUser){
		String sql= "SELECT * FROM formacao WHERE userId =" + idUser;
		
		ArrayList<Formacao> formacoes = new ArrayList<>();
		
		PreparedStatement ps = null;
		
	    ResultSet rs = null;
	    
	    try {
	    	ps = Conexao.criarConexao().prepareStatement(sql);
            rs = ps.executeQuery(); 
            
	    	while(rs.next()) {	    
	    		Formacao formacao = new Formacao();
	    		formacao.setId(rs.getInt(1));
	    		formacao.setAno(rs.getInt(2));
	    		formacao.setConteudo(rs.getString(3));
	    		formacao.setCidade(rs.getString(4));
	    		formacao.setUserId(rs.getInt(5));
	    		
	    		formacoes.add(formacao);
	    		
	    	}
	    	rs.close();
	    	
	    } catch (SQLException e) {		
            e.printStackTrace();
        }
	    return formacoes;
	}
	
	
	public static boolean deletarFormacao(int id) {
		String sql = "delete from formacao where id = ?";
		
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
	
	
	public static void editarFormacao(Formacao formacao) {
		String sql = "update formacao set ano = ?, conteudo = ?, cidade = ? where id = ?";
		
		PreparedStatement ps = null;
		
		try {
			ps = Conexao.criarConexao().prepareStatement(sql);
			
			ps.setInt(1, formacao.getAno());
			ps.setString(2, formacao.getConteudo());
			ps.setString(3, formacao.getCidade());
			ps.setInt(4, formacao.getId());
			
			ps.execute();
			
			ps.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
