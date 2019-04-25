<%@ page language="java" contentType="text/html; charset=UTF-8" 
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
            <li><a href="../index.jsp" class="button"> Pagina Inicial</a></li>
            <li><a href="cadastro" class="button">Cadastrar Locadora</a></li>
            <li><a href="" class="button">Lista de Locadoras</a></li>
            <li><a href="../cliente_crud/cadastro" class="button">Cadastrar Cliente</a></li>
            <li><a href="../cliente_crud/lista" class="button">Lista de Clientes</a></li>
            <li><a href="../logout" class="button">Logout</a></li>
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
            <c:forEach var="locadora" items="${listaLocadoras}">                
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
            </c:forEach>        
        </table>    
    </div>
</body>
</html>