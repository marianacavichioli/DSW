package br.ufscar.dc.dsw.dao;

import br.ufscar.dc.dsw.model.Cliente;
import br.ufscar.dc.dsw.model.Locadora;
import br.ufscar.dc.dsw.model.Papel;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class LocadoraDAO {
    
    public LocadoraDAO() {
        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    protected Connection getConnection() throws SQLException {
        return DriverManager.getConnection("jdbc:derby://localhost:1527/Locacao", "root", "root");
    }

    public void insert(Locadora locadora) {
        UsuarioDAO usuarioDAO = new UsuarioDAO();
        int id = usuarioDAO.insert(locadora);
        
        Papel papel = new Papel(locadora.getEmail(), "ROLE_LOCADORA");
        
        PapelDAO papelDAO = new PapelDAO();
        papelDAO.insert(papel);
        
        System.out.println("papel locadora");
        
        String sql = "INSERT INTO Locadora (id, nome, cnpj, cidade) VALUES (?, ?, ?, ?)";
        try {
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);;
            statement = conn.prepareStatement(sql);
            statement.setInt(1, id);
            statement.setString(2, locadora.getNome());
            statement.setString(3, locadora.getCnpj());
            statement.setString(4, locadora.getCidade());
            statement.executeUpdate();
            statement.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public List<Locadora> getAll() {
        
        //Pegar senha e email também??
        
        List<Locadora> listaLocadoras = new ArrayList<>();
        String sql = "SELECT * FROM Locadora c, Usuario u WHERE c.id = u.id";
        try {
            Connection conn = this.getConnection();
            Statement statement = conn.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String cnpj = resultSet.getString("cnpj");
                String cidade = resultSet.getString("cidade");
                String nome = resultSet.getString("nome");
                String email = resultSet.getString("email");
                int ativo = resultSet.getInt("ativo");
                
                Locadora locadora = new Locadora(id, nome, cnpj, cidade, email, ativo);
                listaLocadoras.add(locadora);
            }
            resultSet.close();
            statement.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listaLocadoras;
    }

    public void delete(Locadora locadora) {
        
        // Quando eu deleto de usuário ainda preciso deletar de cliente??
        
        String sql = "DELETE FROM Locadora where id = ?";
        try {
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setInt(1, locadora.getId());
            statement.executeUpdate();
            statement.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        
        UsuarioDAO usuarioDAO = new UsuarioDAO();
        usuarioDAO.delete(locadora);
    }

    public void update(Locadora locadora) {
               
        String sql = "UPDATE Locadora SET nome = ?, cnpj = ?, cidade = ?";
        sql += " WHERE id = ?";
        try {
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, locadora.getNome());
            statement.setString(2, locadora.getCnpj());
            statement.setString(3, locadora.getCidade());
            statement.setInt(4, locadora.getId());
            statement.executeUpdate();
            statement.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        
        UsuarioDAO usuarioDAO = new UsuarioDAO();
        usuarioDAO.update(locadora);
    }

    public Locadora get(int id) {
        Locadora locadora = null;
        String sql = "SELECT * FROM Locadora c, Usuario u WHERE c.id = ? and c.id = u.id";
        try {
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                String cnpj = resultSet.getString("cnpj");
                String cidade = resultSet.getString("cidade");
                String senha = resultSet.getString("senha");
                String nome = resultSet.getString("nome");
                String email = resultSet.getString("email");
                int ativo = resultSet.getInt("ativo");
                
                locadora = new Locadora(id, nome, cnpj, cidade, senha, email, ativo);
            }
            resultSet.close();
            statement.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return locadora;
    }
}
