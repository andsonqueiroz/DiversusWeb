package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexao {
	
	private static final String user = "root"; 	
	
	private static final String senha = "an789123";	
	
	private static final String url = "jdbc:mysql://localhost:3306/diversus";	
	
	public static Connection con;	
	
	
	public static Connection criarConexao() {
        try {
            if (con == null || con.isClosed()) {
                Class.forName("com.mysql.cj.jdbc.Driver"); // Carrega o driver
                con = DriverManager.getConnection(url, user, senha);
                System.out.println("Conectado com sucesso");            }
            return con;
        } catch (ClassNotFoundException e) {
            System.err.println("Driver JDBC não encontrado.");
            e.printStackTrace();
            return null;
        } catch (SQLException e) {
            System.err.println("Erro ao conectar ao banco de dados.");
            e.printStackTrace();
            return null;
        }
    }

}
