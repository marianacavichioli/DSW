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
                <li><a href="../locadora_crud/cadastro" class="button"><fmt:message key="cadastro_locadora"/></a></li>
                <li><a href="../locadora_crud/lista" class="button"><fmt:message key="lista_locadora"/></a></li>
                <li><a href="cadastro" class="button"><fmt:message key="cadastro_cliente"/></a></li>
                <li><a href="" class="button"><fmt:message key="lista_cliente"/></a></li>
                <li><a href="../logout" class="button">Logout</a></li>
            </ul>
        </div>
    
        <div class='conteudo'>
                   
        <table style="width: 80%">            
            <caption><h2><fmt:message key="lista_cliente"/></h2></caption>            
            <tr>                
                <th>ID</th>                
                <th><fmt:message key="nome"/></th>                
                <th>CPF</th>                
                <th><fmt:message key="telefone"/></th>                
                <th><fmt:message key="data_nascimento"/></th>              
                <th><fmt:message key="sexo"/></th>
                <th>Email</th>
                <th><fmt:message key="ativo"/></th> 
            </tr>            
            <c:forEach var="cliente" items="${listaClientes}">                
                <tr>                    
                    <td><c:out value="${cliente.id}" /></td>                    
                    <td><c:out value="${cliente.nome}" /></td>                    
                    <td><c:out value="${cliente.cpf}" /></td>                    
                    <td><c:out value="${cliente.telefone}" /></td>                    
                    <td><c:out value="${cliente.data_nascimento}" /></td>
                    <td><c:out value="${cliente.sexo}" /></td>
                    <td><c:out value="${cliente.email}" /></td>
                    <td><c:out value="${cliente.ativo}" /></td>                    
                    <td><a href="edicao?id=<c:out value='${cliente.id}' />"><fmt:message key="editar"/></a>                        
                        &nbsp;&nbsp;&nbsp;&nbsp;                        
                        <a href="remocao?id=<c:out value='${cliente.id}' />
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