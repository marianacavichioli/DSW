<%@ page language="java" contentType="text/html; charset=UTF-8" 
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>    
    <head>        
        <title>Locação Bicicletas teste</title>    
    </head>    
    <body>    
    <center>        
        <h1>Locação Bicicletas Online</h1>        
        <h2>            
            <a href="cadastro">Adicione Novo Cliente</a>            
            &nbsp;&nbsp;&nbsp;            
            <a href="lista">Lista de Clientes</a>        
        </h2>    
    </center>  
    <div align="center">        
        <table border="1" cellpadding="5">            
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