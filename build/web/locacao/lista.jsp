<%@ page language="java" contentType="text/html; charset=UTF-8" 
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page errorPage = "error.jsp" %>

<html>
    
<style>
    <%@include file="/estilo.css"%>
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
                <li><a href="cadastro" class="button">Cadastrar Locação</a></li>
                <li><a href="lista" class="button">Lista de Locações</a></li>
                <li><a href="../logout" class="button">Logout</a></li>
            </ul>
        </div>
    
        <div class='conteudo'>
                   
        <table style="width: 80%">            
            <caption><h2>Lista de Locações</h2></caption>            
            <tr>                
                <th>ID</th>                
                <th>CNPJ Locadora</th>                
                <th>Dia</th>                
                <th>Hora</th>                
            </tr>            
            <c:forEach var="locacao" items="${listaLocacoes}">                
                <tr>                    
                    <td><c:out value="${locacao.id}" /></td>                    
                    <td><c:out value="${locacao.cnpj_locadora}" /></td>                    
                    <td><c:out value="${locacao.dia}" /></td>                    
                    <td><c:out value="${locacao.hora}" /></td>
                </tr>            
            </c:forEach>        
        </table>    
    </div>
</body>
</html>