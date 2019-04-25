/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufscar.dc.dsw.controller;

import br.ufscar.dc.dsw.model.Cliente;
import br.ufscar.dc.dsw.dao.ClienteDAO;
import br.ufscar.dc.dsw.dao.LocacaoDAO;
import br.ufscar.dc.dsw.dao.UsuarioDAO;
import br.ufscar.dc.dsw.model.Locacao;
import java.io.IOException;
import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/locacao_crud/*")
public class LocacaoController extends HttpServlet {
    
    private LocacaoDAO daoLocacao;

    @Override
    public void init() {
        daoLocacao = new LocacaoDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException {
        doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException {
        String action = request.getRequestURI();
        action = action.split("/")[action.split("/").length - 1];
        try {
            switch (action) {
                case "cadastro":
                    apresentaFormCadastro(request, response);
                    break;
                case "insercao":
                    insere(request, response);
                    break;
                case "remocao":
                    remove(request, response);
                    break;
                case "edicao":
                    apresentaFormEdicao(request, response);
                    break;
                case "atualizacao":
                    atualize(request, response);
                    break;
                default:
                    lista(request, response);
                    break;
            }
        } catch (RuntimeException | IOException | ServletException e) {
            throw new ServletException(e);
        } catch (ParseException ex) {
            Logger.getLogger(LocacaoController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void lista(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String email = request.getUserPrincipal().getName();
        ClienteDAO clienteDAO = new ClienteDAO();
        String cpf_cliente = clienteDAO.getCPF(email);
        
        List<Locacao> listaLocacoes = daoLocacao.getAll(cpf_cliente);
        request.setAttribute("listaLocacoes", listaLocacoes);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/locacao/lista.jsp");
        dispatcher.forward(request, response);
    }

    private void apresentaFormCadastro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/locacao/formulario.jsp");
        dispatcher.forward(request, response);
    }

    private void apresentaFormEdicao(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Locacao locacao = daoLocacao.get(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/locacao/formulario.jsp");
        request.setAttribute("locacao", locacao);
        dispatcher.forward(request, response);
    }

    private void insere(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ParseException {
                                
        request.setCharacterEncoding("UTF-8");
        
        String email = request.getParameter("email");
        ClienteDAO clienteDAO = new ClienteDAO();
        String cpf_cliente = clienteDAO.getCPF(email);
        
        String cnpj_locadora = request.getParameter("cnpj_locadora");
        String dia = request.getParameter("dia");
        String hora = request.getParameter("hora");
        
        Locacao locacao = new Locacao(-1, cpf_cliente, cnpj_locadora, dia, hora);
        daoLocacao.insert(locacao);
        
        response.sendRedirect("lista");
    }

    private void atualize(HttpServletRequest request, HttpServletResponse response) throws IOException, ParseException {
        request.setCharacterEncoding("UTF-8");
        int id = Integer.parseInt(request.getParameter("id"));
        String cpf_cliente = request.getParameter("cpf_cliente");
        String cnpj_locadora = request.getParameter("cnpj_locadora");
        String dia = request.getParameter("dia");
        String hora = request.getParameter("hora");
        
        Locacao locacao = new Locacao(-1, cpf_cliente, cnpj_locadora, dia, hora);
        daoLocacao.update(locacao);
        response.sendRedirect("lista");
    }

    private void remove(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Locacao locacao = new Locacao(id);
        daoLocacao.delete(locacao);
        response.sendRedirect("lista");
    }
    
}

