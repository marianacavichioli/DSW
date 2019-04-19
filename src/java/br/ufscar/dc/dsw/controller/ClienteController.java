/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufscar.dc.dsw.controller;

import br.ufscar.dc.dsw.model.Cliente;
import br.ufscar.dc.dsw.dao.ClienteDAO;
import br.ufscar.dc.dsw.dao.UsuarioDAO;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/")
public class ClienteController extends HttpServlet {
    
    private ClienteDAO daoCliente;
    private UsuarioDAO daoUsuario;

    @Override
    public void init() {
        System.out.println("ENTREI");
        daoCliente = new ClienteDAO();
        daoUsuario = new UsuarioDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException {
        System.out.println("doPost");
        doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException {
        String action = request.getServletPath();
        try {
            switch (action) {
                case "/cadastro":
                    System.out.println("doGet Cadastro");
                    apresentaFormCadastro(request, response);
                    break;
                case "/insercao":
                    System.out.println("doGet Insercao");
                    insere(request, response);
                    break;
                case "/remocao":
                    remove(request, response);
                    break;
                case "/edicao":
                    apresentaFormEdicao(request, response);
                    break;
                case "/atualizacao":
                    atualize(request, response);
                    break;
                default:
                    lista(request, response);
                    break;
            }
        } catch (RuntimeException | IOException | ServletException e) {
            throw new ServletException(e);
        }
    }

    private void lista(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Cliente> listaClientes = daoCliente.getAll();
        request.setAttribute("listaClientes", listaClientes);
        RequestDispatcher dispatcher = request.getRequestDispatcher("cliente/lista.jsp");
        dispatcher.forward(request, response);
    }

    private void apresentaFormCadastro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("Entrei cadastro");
        RequestDispatcher dispatcher = request.getRequestDispatcher("cliente/formulario.jsp");
        dispatcher.forward(request, response);
    }

    private void apresentaFormEdicao(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Cliente cliente = daoCliente.get(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("cliente/formulario.jsp");
        request.setAttribute("cliente", cliente);
        dispatcher.forward(request, response);
    }

    private void insere(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        
        System.out.println("Entrei insere");
        
        request.setCharacterEncoding("UTF-8");
        String nome = request.getParameter("nome");
        String cpf = request.getParameter("cpf");
        String telefone = request.getParameter("telefone");
        String data_nascimento = request.getParameter("data_nascimento");
        String sexo = request.getParameter("sexo");
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");
        String ativo = request.getParameter("ativo"); 
                
        Cliente cliente = new Cliente(-1, data_nascimento, sexo, cpf, telefone, senha, email, nome, ativo);
        daoCliente.insert(cliente);
        
        response.sendRedirect("lista");
    }

    private void atualize(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        int id = Integer.parseInt(request.getParameter("id"));
        String nome = request.getParameter("nome");
        String cpf = request.getParameter("cpf");
        String telefone = request.getParameter("telefone");
        String data_nascimento = request.getParameter("data_nascimento");
        String sexo = request.getParameter("sexo");
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");
        String ativo = request.getParameter("ativo"); 
        
        Cliente cliente = new Cliente(-1, data_nascimento, sexo, cpf, telefone, senha, email, nome, ativo);
        daoCliente.update(cliente);
        response.sendRedirect("lista");
    }

    private void remove(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Cliente cliente = new Cliente(id);
        daoCliente.delete(cliente);
        response.sendRedirect("lista");
    }
    
}

