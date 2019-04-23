/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author rafaelsaito
 */
package br.ufscar.dc.dsw.login;

import br.ufscar.dc.dsw.dao.UsuarioDAO;
import br.ufscar.dc.dsw.model.Usuario;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, java.io.IOException {
        try {
            Usuario usuario = new Usuario(request.getParameter("email"), request.getParameter("senha"));
            usuario = UsuarioDAO.login(usuario);
            if (usuario.getAtivo() == 1) {
                HttpSession session = request.getSession(true);
                session.setAttribute("currentSessionUser", usuario);
                response.sendRedirect("userLogged.jsp"); //logged-in page 
            } else {
                response.sendRedirect("invalidLogin.jsp"); //error page 
            }
        } catch (IOException theException) {
            System.out.println(theException);
        }
    }
}
