/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufscar.dc.dsw.controller;

import br.ufscar.dc.dsw.model.Cliente;
import br.ufscar.dc.dsw.dao.ClienteDAO;
import br.ufscar.dc.dsw.dao.LocacaoDAO;
import br.ufscar.dc.dsw.dao.LocadoraDAO;
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
import javax.swing.JOptionPane;

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
        ClienteDAO clienteDAO = new ClienteDAO();
        LocadoraDAO locadoraDAO = new LocadoraDAO();
        List<Locacao> listaLocacoes = null;

        String email = request.getUserPrincipal().getName();

        UsuarioDAO usuarioDAO = new UsuarioDAO();
        int id_usuario = usuarioDAO.getID(email);
        System.out.println(id_usuario);

        if (clienteDAO.get(id_usuario) != null) {
            String cpf_cliente = clienteDAO.getCPF(id_usuario, email);
            listaLocacoes = daoLocacao.getAll(cpf_cliente, "cliente");
        } else if (locadoraDAO.get(id_usuario) != null) {
            String cnpj_locadora = locadoraDAO.getCNPJ(id_usuario, email);
            listaLocacoes = daoLocacao.getAll(cnpj_locadora, "locadora");
        }

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

        System.out.println("ENTREI INSERT");
        
        request.setCharacterEncoding("UTF-8");

        String email = request.getParameter("email");

        UsuarioDAO usuarioDAO = new UsuarioDAO();
        int id_usuario = usuarioDAO.getID(email);

        ClienteDAO clienteDAO = new ClienteDAO();
        String cpf_cliente = clienteDAO.getCPF(id_usuario, email);

        String cnpj_locadora = request.getParameter("cnpj_locadora");
        String dia = request.getParameter("dia");
        String hora = request.getParameter("hora");
        
        LocacaoDAO locacaoDAO = new LocacaoDAO();
        List<Locacao> listaLocacoes = locacaoDAO.getAllLocacoes();

        boolean locar = true;

        if (listaLocacoes.size() != 0) {
            for (int i = 0; i < listaLocacoes.size(); i++) {
                                
                if (listaLocacoes.get(i).getCpf_cliente().equals(cpf_cliente)
                        && listaLocacoes.get(i).getDia().equals(dia)) {
                                        
                    int hora_locacao = Integer.parseInt(listaLocacoes.get(i).getHora().substring(0, 2));                    
                    int hora_locacao_atual = Integer.parseInt(hora.substring(0, 2));
                    
                    if (hora_locacao_atual >= hora_locacao && hora_locacao_atual <= hora_locacao + 1) {
                        locar = false;
                    }
                } else if (listaLocacoes.get(i).getCnpj_locadora().equals(cnpj_locadora)
                        && listaLocacoes.get(i).getDia().equals(dia)) {
                    
                    int hora_locacao = Integer.parseInt(listaLocacoes.get(i).getHora());
                    int hora_locacao_atual = Integer.parseInt(hora);
                    if (hora_locacao_atual <= hora_locacao && hora_locacao_atual <= hora_locacao + 1) {
                        locar = false;
                    }
                }
            }
        }
        
        if (locar == true) {
            Locacao locacao = new Locacao(-1, cpf_cliente, cnpj_locadora, dia, hora);
            daoLocacao.insert(locacao);

        }else{
            JOptionPane.showMessageDialog(null, "Não é possível cadastrar uma locação neste horário", "Erro de validação", JOptionPane.ERROR_MESSAGE);
        }
        
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
