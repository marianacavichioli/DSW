package br.ufscar.dc.dsw.dao;

import br.ufscar.dc.dsw.model.Cliente;
import br.ufscar.dc.dsw.model.Papel;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ClienteDAO {

    public ClienteDAO() {
        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    protected Connection getConnection() throws SQLException {
        return DriverManager.getConnection("jdbc:derby://localhost:1527/Locacao", "root", "root");
    }

    public void insert(Cliente cliente) {
        UsuarioDAO usuarioDAO = new UsuarioDAO();
        int id = usuarioDAO.insert(cliente);

        Papel papel = new Papel(cliente.getEmail(), "ROLE_CLIENTE");

        PapelDAO papelDAO = new PapelDAO();
        papelDAO.insert(papel);

        String sql = "INSERT INTO Cliente (id, nome, cpf, telefone, data_nascimento, sexo) VALUES (?, ?, ?, ?, ?, ?)";
        try {
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);;
            statement = conn.prepareStatement(sql);
            statement.setInt(1, id);
            statement.setString(2, cliente.getNome());
            statement.setString(3, cliente.getCpf());
            statement.setString(4, cliente.getTelefone());
            statement.setString(5, cliente.getData_nascimento());
            statement.setString(6, cliente.getSexo());

            statement.executeUpdate();
            statement.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public List<Cliente> getAll() {

        List<Cliente> listaClientes = new ArrayList<>();
        String sql = "SELECT * FROM Cliente c, Usuario u WHERE c.id = u.id";
        try {
            Connection conn = this.getConnection();
            Statement statement = conn.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String nome = resultSet.getString("nome");
                String cpf = resultSet.getString("cpf");
                String telefone = resultSet.getString("telefone");
                String data_nascimento = resultSet.getString("data_nascimento");
                String sexo = resultSet.getString("sexo");
                String email = resultSet.getString("email");
                int ativo = resultSet.getInt("ativo");

                Cliente cliente = new Cliente(id, nome, cpf, telefone, data_nascimento, sexo, email, ativo);
                listaClientes.add(cliente);
            }
            resultSet.close();
            statement.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listaClientes;
    }

    public void delete(Cliente cliente) {

        // Quando eu deleto de usuário ainda preciso deletar de cliente??
        String sql = "DELETE FROM Cliente where id = ?";
        try {
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setInt(1, cliente.getId());
            statement.executeUpdate();
            statement.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        UsuarioDAO usuarioDAO = new UsuarioDAO();
        usuarioDAO.delete(cliente);
    }

    public void update(Cliente cliente) {
        String sql = "UPDATE Cliente SET nome = ?, cpf = ?, telefone = ?, data_nascimento = ?, sexo = ?";
        sql += " WHERE id = ?";
        try {
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, cliente.getNome());
            statement.setString(2, cliente.getCpf());
            statement.setString(3, cliente.getTelefone());
            statement.setString(4, cliente.getData_nascimento());
            statement.setString(5, cliente.getSexo());
            statement.setInt(6, cliente.getId());
            statement.executeUpdate();
            statement.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        UsuarioDAO usuarioDAO = new UsuarioDAO();
        usuarioDAO.update(cliente);
    }

    public Cliente get(int id) {
        Cliente cliente = null;
        String sql = "SELECT * FROM Cliente c, Usuario u WHERE c.id = ? and c.id = u.id";
        try {
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                String sexo = resultSet.getString("sexo");
                String cpf = resultSet.getString("cpf");
                String telefone = resultSet.getString("telefone");
                String data_nascimento = resultSet.getString("data_nascimento");
                String senha = resultSet.getString("senha");
                String nome = resultSet.getString("nome");
                String email = resultSet.getString("email");
                int ativo = resultSet.getInt("ativo");

                cliente = new Cliente(id, nome, cpf, telefone, data_nascimento, sexo, senha, email, ativo);
            }
            resultSet.close();
            statement.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return cliente;
    }

    public String getCPF(int id_usuario, String email) {
        Cliente cliente = null;
                
//        UsuarioDAO usuarioDAO = new UsuarioDAO();
//        int id_usuario = usuarioDAO.getID(email);
                
        String sql = "SELECT * FROM Cliente c, Usuario u WHERE c.id = ? and c.id = u.id";
        try {
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setInt(1, id_usuario);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                String sexo = resultSet.getString("sexo");
                String cpf = resultSet.getString("cpf");
                String telefone = resultSet.getString("telefone");
                String data_nascimento = resultSet.getString("data_nascimento");
                String senha = resultSet.getString("senha");
                String nome = resultSet.getString("nome");
                int ativo = resultSet.getInt("ativo");
                cliente = new Cliente(id_usuario, nome, cpf, telefone, data_nascimento, sexo, senha, email, ativo);
            }
            resultSet.close();
            statement.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return cliente.getCpf();
    }
}
