<%@ page language="java" contentType="text/html; charset=UTF-8" 
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page errorPage = "error.jsp" %>

<html>

    <style>
        <%@include file="/estilo.css"%>
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
                <li><a href="cadastro" class="button"><fmt:message key="cadastro_locadora"/></a></li>
                <li><a href="" class="button"><fmt:message key="lista_locadora"/></a></li>
                <li><a href="../cliente_crud/cadastro" class="button"><fmt:message key="cadastro_cliente"/></a></li>
                <li><a href="../cliente_crud/lista" class="button"><fmt:message key="lista_cliente"/></a></li>
                <li><a href="../logout" class="button">Logout</a></li>
            </ul>
        </div>

        <div class='conteudo'> 

            <form action="pesquisa" method="post">
                <label for="busca"><fmt:message key="pesquisa_cidade"/></label>
                <input type="search" id="busca" name="busca">
                <button type="submit">OK</button>
            </form>

            <table style="width:80%">            
                <caption><h2><fmt:message key="lista_locadora"/></h2></caption>            
                <tr>                
                    <th><fmt:message key="nome"/></th>                
                    <th>CNPJ</th>                
                    <th><fmt:message key="telefone"/></th>                
                    <th><fmt:message key="cidade"/></th>
                    <th>E-mail</th>
                </tr>            
                <c:forEach var="locadora" items="${listaLocadoras}">                
                    <tr>                    
                        <td><c:out value="${locadora.id}" /></td>                    
                        <td><c:out value="${locadora.nome}" /></td>                    
                        <td><c:out value="${locadora.cnpj}" /></td>                    
                        <td><c:out value="${locadora.cidade}" /></td>
                        <td><c:out value="${locadora.email}" /></td>
                        <td><a href="edicao?id=<c:out value='${locadora.id}' />"><fmt:message key="editar"/></a>                        
                            &nbsp;&nbsp;&nbsp;&nbsp;                        
                            <a href="remocao?id=<c:out value='${locadora.id}' />
                               "onclick="return confirm('Tem certeza de que deseja excluir este item?');">
                                <fmt:message key="remover"/>
                            </a></td>                
                    </tr>            
                </c:forEach>        
            </table>    
        </div>
    </fmt:bundle>
</body>
</html>