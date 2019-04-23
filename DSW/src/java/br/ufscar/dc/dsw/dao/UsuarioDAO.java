/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufscar.dc.dsw.dao;

import br.ufscar.dc.dsw.login.ConnectionManager;
import br.ufscar.dc.dsw.model.Usuario;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author mariana
 */
public class UsuarioDAO {
    
    static Connection currentCon = null; 
    static ResultSet rs = null; 

    public UsuarioDAO() {
        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    protected Connection getConnection() throws SQLException {
        return DriverManager.getConnection("jdbc:derby://localhost:1527/Locacao", "root", "root");
    }

    public int insert(Usuario usuario) {
        int id;
        String sql = "INSERT INTO Usuario (email, senha, nome, ativo) VALUES (?, ?, ?, ?)";
        try {
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            statement.setString(1, usuario.getEmail());
            statement.setString(2, usuario.getSenha());
            statement.setString(3, usuario.getNome());
            statement.setInt(4, usuario.getAtivo());
            statement.executeUpdate();

            ResultSet rs = statement.getGeneratedKeys();
            rs.next();
            id = rs.getInt(1);

            statement.close();
            conn.close();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return id;
    }

    public List<Usuario> getAll() {
        List<Usuario> listaUsuarios = new ArrayList<>();
        String sql = "SELECT * FROM Usuario";
        try {
            Connection conn = this.getConnection();
            Statement statement = conn.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String email = resultSet.getString("email");
                String senha = resultSet.getString("senha");
                String nome = resultSet.getString("nome");
                int ativo = resultSet.getInt("ativo");
                Usuario usuario = new Usuario(senha, email, nome, ativo);
                listaUsuarios.add(usuario);
            }
            resultSet.close();
            statement.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listaUsuarios;
    }

    public void delete(Usuario usuario) {
        String sql = "DELETE FROM Usuario where id = ?";
        try {
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setInt(1, usuario.getId());
            statement.executeUpdate();
            statement.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void update(Usuario usuario) {
        String sql = "UPDATE Usuario SET email = ?, senha = ?, nome = ?, ativo = ?";
        sql += " WHERE id = ?";
        try {
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, usuario.getEmail());
            statement.setString(2, usuario.getSenha());
            statement.setString(3, usuario.getNome());
            statement.setInt(4, usuario.getAtivo());
            statement.setInt(5, usuario.getId());
            statement.executeUpdate();
            statement.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public Usuario get(int id) {
        Usuario usuario = null;
        String sql = "SELECT * FROM Usuario WHERE id = ?";
        try {
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                String email = resultSet.getString("email");
                String senha = resultSet.getString("senha");
                String nome = resultSet.getString("nome");
                int ativo = resultSet.getInt("ativo");
                usuario = new Usuario(senha, email, nome, ativo);
            }
            resultSet.close();
            statement.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return usuario;
    }

    public static Usuario login(Usuario usuario) { //preparing some objects for connection 
        Statement stmt = null;
        String email = usuario.getEmail();
        String senha = usuario.getSenha();
        String searchQuery = "select * from usuario where email='" + email + "' AND senha='" + senha + "'";
        
        System.out.println("Your user name is " + email);
        System.out.println("Your password is " + senha);
        System.out.println("Query: " + searchQuery);
        try { //connect to DB 
            currentCon = ConnectionManager.getConnection();
            stmt = currentCon.createStatement();
            rs = stmt.executeQuery(searchQuery);
            boolean more = rs.next(); // if user does not exist set the isValid variable to false 
            if (!more) {
                System.out.println("Sorry, you are not a registered user! Please sign up first");
                usuario.setAtivo(0);
            } //if user exists set the isValid variable to true 
            else if (more) {
                String nome = rs.getString("nome");
                System.out.println("Welcome " + nome);
                usuario.setNome(nome);
                usuario.setAtivo(1);
            }
        } catch (Exception ex) {
            System.out.println("Log In failed: An Exception has occurred! " + ex);
        } //some exception handling 
        finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception e) {
                }
                rs = null;
            }
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (Exception e) {
                }
                stmt = null;
            }
            if (currentCon != null) {
                try {
                    currentCon.close();
                } catch (Exception e) {
                }
                currentCon = null;
            }
        }
        return usuario;
    }
}

