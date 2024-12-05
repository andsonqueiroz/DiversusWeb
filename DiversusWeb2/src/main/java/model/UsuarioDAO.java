package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class UsuarioDAO {
    public void adicionarUsuario(String email) throws SQLException, ClassNotFoundException {
        String sql = "INSERT INTO assinante (email) VALUES (?);";
        try (Connection conn = Conexao.criarConexao();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, email);
            stmt.executeUpdate();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
