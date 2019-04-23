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
                <li><a href="index.jsp" class="button"> Pagina Inicial</a></li>
                <li><a href="#" class="button">Cadastrar Locacao</a></li>
                <li><a href="#" class="button">Cadastrar Locadora</a></li>
                <li><a href="cadastro" class="button">Cadastrar Cliente</a></li>
                <li><a href="#" class="button">Lista de Clientes</a></li>
                <li><a href="login" class="button">Login</a></li>
            </ul>
        </div>
    
        <div class='conteudo'>
            
        <c:if test="${locadora != null}">            
        <form action="atualizacao" method="post">            
        </c:if>            
        <c:if test="${locadora == null}">                
            <form action="insercao" method="post">                
            </c:if>                
            <table style="width: 40%">                                             
                    <c:if test="${locadora != null}">                                
                        <b>Edição:</b>                           
                    </c:if>                            
                    <c:if test="${locadora == null}">                                
                        <b>Cadastro:</b>
                        <br>
                        <br>
                    </c:if>                                           
                <c:if test="${locadora != null}">                        
                    <input type="hidden" name="id" value="<c:out value='${locadora.id}'/>" />                    
                </c:if>
                <tr>                        
                    <th>Nome: </th>                        
                    <td>                            
                        <input type="text" name="nome" size="50" 
                               required value="<c:out value='${locadora.nome}'/>"/>                        
                    </td>                    
                </tr>                    
                <tr>                        
                    <th>CNPJ: </th>                        
                    <td>                            
                        <input type="text" name="cnpj" size="15"                                   
                               required value="<c:out value='${locadora.cnpj}'/>"/>                        
                    </td>                    
                </tr>                    
                <tr>                        
                    <th>Telefone: </th>                        
                    <td>                            
                        <input type="text" name="telefone" size="11"                                   
                               value="<c:out value='${locadora.telefone}'/>"/>                        
                    </td>                    
                </tr>                    
                <tr>                        
                    <th>Cidade: </th>                    
                    <td>                            
                        <input type="text" name="cidade" size="70"                                 
                               value="<c:out value='${locadora.cidade}' />"                                   
                               />                        
                    </td>                    
                </tr>
                <tr>                        
                    <td colspan="2" align="center">                            
                        <input type="submit" value="Salvar" />                        
                    </td>                    
                </tr>                
            </table>            
        </form>    
</div>
</body>
</html>