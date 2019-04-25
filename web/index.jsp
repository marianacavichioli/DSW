<%-- 
    Document   : index
    Created on : Apr 20, 2019, 3:31:35 PM
    Author     : julia
--%>

<%@page import="br.ufscar.dc.dsw.model.Locadora"%>
<%@page import="br.ufscar.dc.dsw.dao.LocadoraDAO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>

    <style>
        <%@include file="estilo.css"%>
    </style>

    <head>
        <fmt:bundle basename="i18n.sistema">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><fmt:message key="aluguel"/></title>

    <div class= "header">
        <center>
            <h1><fmt:message key="aluguel"/></h1>
        </center>
    </div>
        </fmt:bundle>
</head>

<body>
    <fmt:bundle basename="i18n.sistema">
        <div class ='botoes'>
            <ul>                
                <sec:authorize access="hasAnyRole('CLIENTE')">
                    <li><a href="locacao_crud/cadastro" class="button"><fmt:message key="cadastro_locacao"/></a></li>
                </sec:authorize>
                    
                <sec:authorize access="hasAnyRole('CLIENTE', 'LOCADORA')">
                    <li><a href="locacao_crud/lista" class="button"><fmt:message key="lista_locacao"/></a></li>
                </sec:authorize>
                                  
                <sec:authorize access="hasRole('ADMIN')">
                    <li><a href="locadora_crud/cadastro" class="button"><fmt:message key="cadastro_locadora"/></a></li>
                    <li><a href="locadora_crud/lista" class="button"><fmt:message key="lista_locadora"/></a></li>
                    <li><a href="cliente_crud/cadastro" class="button"><fmt:message key="cadastro_cliente"/></a></li>
                    <li><a href="cliente_crud/lista" class="button"><fmt:message key="lista_cliente"/></a></li>
                </sec:authorize>

                <li><a href="logout" class="button">Logout</a></li>

            </ul>
        </div>
       
        <div class ='conteudo'>
            
        <form action="pesquisa" method="post">
            <label for="busca"><fmt:message key="pesquisa_cidade"/></label>
            <input type="search" id="busca" name="busca">
            <button type="submit">OK</button>
        </form>
        
        <h3><fmt:message key="lista_locadora"/><h3>
         <table style="width:80%">                       
            <tr>                
                <th><fmt:message key="nome"/></th>                
                <th>CNPJ</th>                
                <th><fmt:message key="telefone"/></th>                
                <th><fmt:message key="cidade"/></th>
                <th>E-mail</th>
            </tr>    


            <%! static LocadoraDAO locadoraDAO = new LocadoraDAO();
                static List<Locadora> listaLocadoras = locadoraDAO.getAll();
                static int i = 0;
                static int id_locacao = 0;
            %>
           

            <% for (i = 0; i < listaLocadoras.size(); i++) { %>
            <tr>
                <td> <% out.println(listaLocadoras.get(i).getId());%></td>
                <td> <% out.println(listaLocadoras.get(i).getNome());%></td>
                <td> <% out.println(listaLocadoras.get(i).getCnpj());%></td>
                <td> <% out.println(listaLocadoras.get(i).getCidade());%></td>
                <td> <% out.println(listaLocadoras.get(i).getEmail());%></td>
                <% id_locacao = listaLocadoras.get(i).getId();
                        System.out.println(id_locacao);%>
                <td><a href="edicao?id=<%=id_locacao%> "><fmt:message key="editar"/></a>                        
                    &nbsp;&nbsp;&nbsp;&nbsp;                        
                    <a href="remocao?id=<%=id_locacao%>
                       "onclick="return confirm('Tem certeza de que deseja excluir este item?');">
                        <fmt:message key="remover"/>
                    </a></td>                
            </tr>  
            </tr>
            <%}%>


<!--            <c:forEach var="locadora" items="<% listaLocadoras = locadoraDAO.getAll();%>">    
<tr>                    
<td><c:out value="${locadora.id}" /></td>                    
<td><c:out value="${locadora.nome}" /></td>                    
<td><c:out value="${locadora.cnpj}" /></td>                    
<td><c:out value="${locadora.cidade}" /></td>
<td><c:out value="${locadora.email}" /></td>
<td><a href="edicao?id=<c:out value='${locadora.id}' />">Edição</a>                        
&nbsp;&nbsp;&nbsp;&nbsp;                        
<a href="remocao?id=<c:out value='${locadora.id}' />
"onclick="return confirm('Tem certeza de que deseja excluir este item?');">
Remoção
</a></td>                
</tr>            
</c:forEach>        -->
        </table>    
    </div>
</fmt:bundle>
</body>
</html>
