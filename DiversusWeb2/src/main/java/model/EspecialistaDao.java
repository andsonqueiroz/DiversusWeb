package model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EspecialistaDao {
	
	public static boolean cadastrarEspecialista(Especialista especialista) {
		
		boolean sucesso = false;
	
		String sql = "INSERT INTO especialista(nome, email, senha, dataNasc, genero, especialista, especialidade, formacao, biografia) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)";	
		
		PreparedStatement ps = null;	
		
		try {	
			ps = Conexao.criarConexao().prepareStatement(sql);		 
			
			ps.setString(1, especialista.getNome());
			ps.setString(2, especialista.getEmail());	
			ps.setString(3, especialista.getSenha());	
			ps.setString(4, especialista.getData());
			ps.setString(5, especialista.getGenero());
			ps.setBoolean(6, especialista.isEspecialista());
			ps.setString(7, especialista.getEspecialidade());
			ps.setString(8, especialista.getFormacao());
			ps.setString(9, especialista.getBiografia());	
			
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
	
	public static ArrayList<Especialista> buscarEspecialistas() {

		
		String sql = "SELECT * FROM especialista WHERE especialista = 0";	
			
		ArrayList<Especialista> especialistas = new ArrayList<>();
		
		PreparedStatement ps = null;
		
	    ResultSet rs = null;	
	    
	    try {
            ps = Conexao.criarConexao().prepareStatement(sql);
            
            rs = ps.executeQuery(); 

            while (rs.next()) {		
                
                Especialista especialista = new Especialista();
                especialista.setId(rs.getInt(1));
                especialista.setNome(rs.getString(2));
                especialista.setEmail(rs.getString(3));
                especialista.setSenha(rs.getString(4));
                especialista.setData(rs.getString(5));
                especialista.setGenero(rs.getString(6));
                especialista.setEspecialista(rs.getInt(7));
                especialista.setEspecialidade(rs.getString(8));
                especialista.setFormacao(rs.getString(9));
                especialista.setBiografia(rs.getString(10));
                
                especialistas.add(especialista);
            }

            rs.close();
            
            ps.close();
            
        } catch (SQLException e) {		
            e.printStackTrace();
        }
	    return especialistas;
	}
	
	
	public static Especialista buscarEspecialistaPorEmail(String email) {
		
		String sql = "SELECT * FROM especialista where email = ?";	
		
		PreparedStatement ps = null;
		
	    ResultSet rs = null;	
	    
	    Especialista esp = null;
	    
		try {
            ps = Conexao.criarConexao().prepareStatement(sql);
            
            ps.setString(1, email);
            
            rs = ps.executeQuery(); 

            if(rs.next()) {
            	
            	int id = rs.getInt("id");
            	email = rs.getString("email");
            	String senha = rs.getString("senha");
            	int especialista = rs.getInt("especialista");
            	
            	esp = new Especialista(email, senha);
            	esp.setId(id);
            	esp.setEspecialista(especialista);
            }

            rs.close();
            
            ps.close();
            
        } catch (SQLException e) {		
            e.printStackTrace();
        }
		
		return esp;
	}
	
	public static Especialista buscarEspecialistaPorId(int id) {
		String sql = "SELECT * FROM especialista where id = ?";	
		PreparedStatement ps = null;
		
	    ResultSet rs = null;	
	    
	    Especialista esp = null;
	    
	    try {
            ps = Conexao.criarConexao().prepareStatement(sql);
            
            ps.setInt(1, id);
            
            rs = ps.executeQuery(); 

            if(rs.next()) {
            	
            	id = rs.getInt("id");
            	String nome = rs.getString("nome");
            	String email = rs.getString("email");
            	String especialidade = rs.getString("especialidade");
            	String telefone = rs.getString("telefone");
            	String caminhoImg = rs.getString("caminhoImg");
            	String cidade = rs.getString("cidade");
            	
            	esp = new Especialista();
            	esp.setId(id);
            	esp.setEmail(email);
            	esp.setNome(nome);
            	esp.setEspecialidade(especialidade);
            	esp.setTelefone(telefone);
            	esp.setCaminhoImg(caminhoImg);
            	esp.setCidade(cidade);
            }

            rs.close();
            
            ps.close();
            
        } catch (SQLException e) {		
            e.printStackTrace();
        }
		
		return esp;

	}
	
	public static ArrayList<Especialista> buscarEspecialistasPorEspecialidade(String especialidade) {
		String sql = "select * from especialista where especialidade like ?";
		ArrayList <Especialista> especialistas = new ArrayList<>();
		PreparedStatement ps = null;
		ResultSet rs = null;	
	    
	    try {
            ps = Conexao.criarConexao().prepareStatement(sql);
            
            ps.setString(1, "%" + especialidade + "%");
            rs = ps.executeQuery(); 

            while (rs.next()) {		
                
                Especialista especialista = new Especialista();
                especialista.setId(rs.getInt(1));
                especialista.setNome(rs.getString(2));
                especialista.setEmail(rs.getString(3));
                especialista.setSenha(rs.getString(4));
                especialista.setData(rs.getString(5));
                especialista.setGenero(rs.getString(6));
                especialista.setEspecialista(rs.getInt(7));
                especialista.setEspecialidade(rs.getString(8));
                especialista.setFormacao(rs.getString(9));
                especialista.setBiografia(rs.getString(10));
                especialista.setCidade(rs.getString(14));
                especialista.setCaminhoImg(rs.getString(13));
                
                especialistas.add(especialista);
            }

            rs.close();
            
            ps.close();
            
        } catch (SQLException e) {		
            e.printStackTrace();
        }
	    return especialistas;
		
	}
	
	public static boolean inserirFotoEspecialista(String caminhoImg, int idUser) {
		String sql = "UPDATE especialista SET caminhoImg = ? WHERE id = ?";
		boolean sucesso = false;
		
		PreparedStatement ps = null;
		
		try {
			ps = Conexao.criarConexao().prepareStatement(sql);
			
			ps.setString(1, caminhoImg);
			ps.setInt(2, idUser);
			
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
	
	public static boolean removerFotoEspecialista(int idUser) {
		String sql = "UPDATE especialista SET caminhoImg = null WHERE id = ?";
		boolean sucesso = false;
		
		PreparedStatement ps = null;
		
		try {
			ps = Conexao.criarConexao().prepareStatement(sql);
			
			ps.setInt(1, idUser);
			
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
	
	
	
	public static boolean inserirCidade(String cidade, int idUser) {
		String sql = "UPDATE especialista SET cidade = ? WHERE id = ?";
		boolean sucesso = false;
		
		PreparedStatement ps = null;
		
		try {
			ps = Conexao.criarConexao().prepareStatement(sql);
			
			ps.setString(1, cidade);
			ps.setInt(2, idUser);
			
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
	
	
	
	public static void editar(String nome, String especialidade, String email, String telefone, String cidade, int id) {
		String sql = "update especialista set nome = ?, especialidade = ?, email = ?, telefone = ?, cidade = ? where id = ?";
		
		PreparedStatement ps = null;
		
		try {
			ps = Conexao.criarConexao().prepareStatement(sql);
			
			ps.setString(1, nome);
			ps.setString(2, especialidade);
			ps.setString(3, email);
			ps.setString(4, telefone);
			ps.setString(5, cidade);
			ps.setInt(6, id);
			
			ps.execute();
			
			ps.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	public boolean deletarEspecialista(Especialista especialista) {
		String sql = "delete from especialista where id = ?";
		
		boolean sucesso = false;
		
		PreparedStatement ps = null;
		
		try {
			ps = Conexao.criarConexao().prepareStatement(sql);
			
			ps.setInt(1, especialista.getId());
			
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
