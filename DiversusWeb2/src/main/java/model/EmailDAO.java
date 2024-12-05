package model;

import model.Conexao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class EmailDAO {
    public void removeEmail(String email) throws SQLException, ClassNotFoundException {
        try (Connection conn = Conexao.criarConexao();
             PreparedStatement stmt = conn.prepareStatement("DELETE FROM assinante WHERE email = ?")) {
                stmt.setString(1, email);
                stmt.executeUpdate();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public void adicionarEmail(String email) throws SQLException, ClassNotFoundException {
        try (Connection conn = Conexao.criarConexao();
             PreparedStatement stmt = conn.prepareStatement("INSERT INTO assinante (email) VALUES (?)")) {
            stmt.setString(1, email);
            stmt.executeUpdate();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

}
