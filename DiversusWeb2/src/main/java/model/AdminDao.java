package model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.mail.*;
import javax.mail.MessagingException;

public class AdminDao {
	
	public static boolean cadastrarAdmin(Admin admin) {
			
			boolean sucesso = false;
		
			String sql = "INSERT INTO admin(nome, email, senha, dataNasc, genero) VALUES(?, ?, ?, ?, ?)";	
			
			PreparedStatement ps = null;	
			
			try {	
				ps = Conexao.criarConexao().prepareStatement(sql);		 
				
				ps.setString(1, admin.getNome());
				ps.setString(2, admin.getEmail());	
				ps.setString(3, admin.getSenha());	
				ps.setString(4, admin.getData());
				ps.setString(5, admin.getGenero());
				
				int rowsAffected = ps.executeUpdate();
				
				if(rowsAffected > 0) {
					sucesso = true;
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
	
	
	public static boolean deletarAdmin(Admin admin) {
		String sql = "delete from admin where id = ?";
		
		boolean sucesso = false;
		
		PreparedStatement ps = null;
		
		try {
			ps = Conexao.criarConexao().prepareStatement(sql);
			
			ps.setInt(1, admin.getId());
			
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
	
public static Admin buscarAdminPorEmail(String email) {
		
		String sql = "SELECT * FROM admin where email = ?";	
		
		PreparedStatement ps = null;
		
	    ResultSet rs = null;	
	    
	    Admin admin = null;
	    
		try {
            ps = Conexao.criarConexao().prepareStatement(sql);
            
            ps.setString(1, email);
            
            rs = ps.executeQuery(); 

            if(rs.next()) {
            	
            	int id = rs.getInt("id");
            	email = rs.getString("email");
            	String senha = rs.getString("senha");
            	
            	admin = new Admin(email, senha);
            	admin.setId(id);
            }

            rs.close();
            
            ps.close();
            
        } catch (SQLException e) {		
            e.printStackTrace();
        }
		
		return admin;
	}
}
