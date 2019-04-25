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
                <li><a href="../locadora_crud/cadastro" class="button">Cadastrar Locadora</a></li>
                <li><a href="../locadora_crud/lista" class="button">Lista de Locadoras</a></li>
                <li><a href="cadastro" class="button">Cadastrar Cliente</a></li>
                <li><a href="" class="button">Lista de Clientes</a></li>
                <li><a href="../logout" class="button">Logout</a></li>
            </ul>
        </div>
    
        <div class='conteudo'>
                   
        <table style="width: 80%">            
            <caption><h2>Lista de Clientes</h2></caption>            
            <tr>                
                <th>ID</th>                
                <th>Nome</th>                
                <th>CPF</th>                
                <th>Telefone</th>                
                <th>Data Nascimento</th>              
                <th>Sexo</th>
                <th>Email</th>
                <th>Ativo</th> 
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
                    <td><a href="edicao?id=<c:out value='${cliente.id}' />">Edição</a>                        
                        &nbsp;&nbsp;&nbsp;&nbsp;                        
                        <a href="remocao?id=<c:out value='${cliente.id}' />
                           "onclick="return confirm('Tem certeza de que deseja excluir este item?');">
                            Remoção
                        </a></td>                
                </tr>            
            </c:forEach>        
        </table>    
    </div>
</body>
</html>