/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufscar.dc.dsw.controller;

import br.ufscar.dc.dsw.dao.LocadoraDAO;
import br.ufscar.dc.dsw.dao.UsuarioDAO;
import br.ufscar.dc.dsw.model.Locadora;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author mariana
 */

@WebServlet(urlPatterns = "/locadora")
public class LocadoraController extends HttpServlet{
    
    private LocadoraDAO daoLocadora;
    private UsuarioDAO daoUsuario;

    @Override
    public void init() {
        System.out.println("ENTREIII");
        daoLocadora = new LocadoraDAO();
        daoUsuario = new UsuarioDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException {
        doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException {
        String action = request.getServletPath();
        try {
            switch (action) {
                case "/login":
                    apresentaLogin(request, response);
                case "/cadastro":
                    apresentaFormCadastro(request, response);
                    break;
                case "/insercao":
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
        List<Locadora> listaLocadoras = daoLocadora.getAll();
        request.setAttribute("listaLocadoras", listaLocadoras);
        RequestDispatcher dispatcher = request.getRequestDispatcher("locadora/lista.jsp");
        dispatcher.forward(request, response);
    }

    private void apresentaFormCadastro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("locadora/formulario.jsp");
        dispatcher.forward(request, response);
    }

    private void apresentaFormEdicao(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Locadora locadora = daoLocadora.get(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("locadora/formulario.jsp");
        request.setAttribute("locadora", locadora);
        dispatcher.forward(request, response);
    }

    private void insere(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
                
        request.setCharacterEncoding("UTF-8");
        String nome = request.getParameter("nome");
        String cnpj = request.getParameter("cnpj");
        String cidade = request.getParameter("cidade");
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");
        int ativo = Integer.parseInt(request.getParameter("ativo"));
                
        Locadora locadora = new Locadora(-1, cnpj, cidade, senha, email, nome, ativo);
        daoLocadora.insert(locadora);
        
        response.sendRedirect("lista");
    }

    private void atualize(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        int id = Integer.parseInt(request.getParameter("id"));
        String nome = request.getParameter("nome");
        String cnpj = request.getParameter("cnpj");
        String cidade = request.getParameter("cidade");
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");
        int ativo = Integer.parseInt(request.getParameter("ativo"));
        
        Locadora locadora = new Locadora(-1, cnpj, cidade, senha, email, nome, ativo);
        daoLocadora.update(locadora);
        response.sendRedirect("lista");
    }

    private void remove(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Locadora locadora = new Locadora(id);
        daoLocadora.delete(locadora);
        response.sendRedirect("lista");
    }
    
    private void apresentaLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("login/login.jsp");
        dispatcher.forward(request, response);
    }
}