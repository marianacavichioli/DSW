package br.ufscar.dc.dsw.dao;

import br.ufscar.dc.dsw.model.Cliente;
import br.ufscar.dc.dsw.model.Locacao;
import br.ufscar.dc.dsw.model.Usuario;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;

public class LocacaoDAO {
    public LocacaoDAO() {
        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    protected Connection getConnection() throws SQLException {
        return DriverManager.getConnection("jdbc:derby://localhost:1527/Locacao", "root", "root");
    }

    public void insert(Locacao locacao) {
                
        String sql = "INSERT INTO Locacao (cpf_cliente, cnpj_locadora, dia, hora) VALUES (?, ?, ?, ?)";
        try {
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);;
            statement = conn.prepareStatement(sql);
            statement.setString(1, locacao.getCpf_cliente());
            statement.setString(2, locacao.getCnpj_locadora());
            statement.setString(3, locacao.getDia());
            statement.setString(4, locacao.getHora());

            statement.executeUpdate();
            statement.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public List<Locacao> getAll(String cpf_cnpj, String usuario) {
        
        String sql = null;
        List<Locacao> listaLocacoes = new ArrayList<>();
        if(usuario == "cliente"){
            sql = "SELECT * FROM Locacao l WHERE l.cpf_cliente = ?";
        }else{
            sql = "SELECT * FROM Locacao l WHERE l.cnpj_locadora = ?";
        }
        try {
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, cpf_cnpj);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String cpf_cliente = resultSet.getString("cpf_cliente");
                String cnpj_locadora = resultSet.getString("cnpj_locadora");
                String dia = resultSet.getString("dia");
                String hora = resultSet.getString("hora");
                
                Locacao locacao = new Locacao(id, cpf_cliente, cnpj_locadora, dia, hora);
                listaLocacoes.add(locacao);
            }
            resultSet.close();
            statement.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        
        return listaLocacoes;
    }

    public void delete(Locacao locacao) {
                
        String sql = "DELETE FROM Locacao where id = ?";
        try {
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setInt(1, locacao.getId());
            statement.executeUpdate();
            statement.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void update(Locacao locacao) {
               
        String sql = "UPDATE Locacao SET cpf_cliente = ?, cnpj_locadora = ?, dia = ?, hora = ?";
        sql += " WHERE id = ?";
        try {
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setInt(1, locacao.getId());
            statement.setString(2, locacao.getCpf_cliente());
            statement.setString(3, locacao.getCnpj_locadora());
            statement.setString(4, locacao.getDia());
            statement.setString(5, locacao.getHora());
            statement.executeUpdate();
            statement.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public Locacao get(int id) {
        Locacao locacao = null;
        String sql = "SELECT * FROM Locacao";
        try {
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                String cpf_cliente = resultSet.getString("cpf_cliente");
                String cnpj_locadora = resultSet.getString("cnpj_locadora");
                String dia = resultSet.getString("dia");
                String hora = resultSet.getString("hora");
                
                locacao = new Locacao(id, cpf_cliente, cnpj_locadora, dia, hora);
            }
            resultSet.close();
            statement.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        
        return locacao;
    }
    
    public List<Locacao> getAllLocacoes() {
        List<Locacao> listaLocacoes = new ArrayList<>();
        String sql = "SELECT * FROM Locacao";
       
        try {
            Connection conn = this.getConnection();
            Statement statement = conn.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String cpf_cliente = resultSet.getString("cpf_cliente");
                String cnpj_locadora = resultSet.getString("cnpj_locadora");
                String dia = resultSet.getString("dia");
                String hora = resultSet.getString("hora");
                
                Locacao locacao = new Locacao(id, cpf_cliente, cnpj_locadora, dia, hora);
                listaLocacoes.add(locacao);
            }
            resultSet.close();
            statement.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        
        return listaLocacoes;
    }
}
