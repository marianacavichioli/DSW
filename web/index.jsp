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
<!DOCTYPE html>
<html>

    <style>
        <%@include file="estilo.css"%>
    </style>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Aluguel de Bicicletas</title>

    <div class= "header">
        <center>
            <h1>Aluguel de Bicicletas</h1>
        </center>
    </div>
</head>

<body>
        <div class ='botoes'>
            <ul>
                <li><a href="" class="button"> Pagina Inicial</a></li>
                
                <sec:authorize access="hasAnyRole('CLIENTE')">
                    <li><a href="locacao_crud/cadastro" class="button">Cadastrar Locação</a></li>
                </sec:authorize>
                    
                <sec:authorize access="hasAnyRole('CLIENTE', 'LOCADORA')">
                    <li><a href="locacao_crud/lista" class="button">Lista de Locações</a></li>
                </sec:authorize>
                                  
                <sec:authorize access="hasRole('ADMIN')">
                    
                    <li><a href="locadora_crud/cadastro" class="button">Cadastrar Locadora</a></li>
                    <li><a href="locadora_crud/lista" class="button">Lista de Locadoras</a></li>
                    <li><a href="cliente_crud/cadastro" class="button">Cadastrar Cliente</a></li>
                    <li><a href="cliente_crud/lista" class="button">Lista de Clientes</a></li>
                </sec:authorize>

            <li><a href="logout" class="button">Logout</a></li>


        </ul>
    </div>

    <div class='conteudo'>  
        <table style="width:80%">            
            <caption><h2>Lista de Locadoras</h2></caption>            
            <tr>                
                <th>Nome</th>                
                <th>CNPJ</th>                
                <th>Telefone</th>                
                <th>Cidade</th>
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
                <td><a href="edicao?id=<%=id_locacao%> ">Edição</a>                        
                    &nbsp;&nbsp;&nbsp;&nbsp;                        
                    <a href="remocao?id=<%=id_locacao%>
                       "onclick="return confirm('Tem certeza de que deseja excluir este item?');">
                        Remoção
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
</body>
</html>
