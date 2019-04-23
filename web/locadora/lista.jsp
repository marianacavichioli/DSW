<%@ page language="java" contentType="text/html; charset=UTF-8" 
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>    
    <head>        
        <title>Aluguel de Bicicletas</title>    
    </head>    
    <body>    
    <center>        
        <h1>Aluguel de Bicicletas</h1>        
        
    </center>  
    <div align="center">        
        <table border="1" cellpadding="5">            
            <caption><h2>Lista de Locadoras</h2></caption>            
            <tr>                
                <th>Nome</th>                
                <th>CNPJ</th>                
                <th>Telefone</th>                
                <th>Cidade</th>              
            </tr>            
            <c:forEach var="cliente" items="${listaClientes}">                
                <tr>                    
                    <td><c:out value="${locadora.id}" /></td>                    
                    <td><c:out value="${locadora.nome}" /></td>                    
                    <td><c:out value="${locadora.cnpj}" /></td>                    
                    <td><c:out value="${locadora.telefone}" /></td>                    
                    <td><c:out value="${locadora.cidade}" /></td>
                    <td><c:out value="${cliente.sexo}" /></td>
                    <td><c:out value="${cliente.email}" /></td>
                    <td><c:out value="${cliente.ativo}" /></td>                    
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