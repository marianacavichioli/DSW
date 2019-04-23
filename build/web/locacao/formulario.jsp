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
                <li><a href="" class="button">Cadastrar Locacao</a></li>
                <li><a href="locadora_crud/cadastro" class="button">Cadastrar Locadora</a></li>
                <li><a href="cliente_crud/cadastro" class="button">Cadastrar Cliente</a></li>
                <li><a href="cliente_crud/lista" class="button">Lista de Clientes</a></li>
                <li><a href="logout" class="button">Logout</a></li>
            </ul>
        </div>
    
        <div class='conteudo'>
            
        <c:if test="${locacao != null}">            
        <form action="atualizacao" method="post">            
        </c:if>            
        <c:if test="${locacao == null}">                
            <form action="insercao" method="post">                
            </c:if>                
            <table style="width: 40%">                                             
                    <c:if test="${locacao != null}">                                
                        <b>Edição:</b>                           
                    </c:if>                            
                    <c:if test="${locacao == null}">                                
                        <b>Cadastro:</b>
                        <br>
                        <br>
                    </c:if>                                           
                <c:if test="${locacao != null}">                        
                    <input type="hidden" name="id" value="<c:out value='${locacao.id}'/>" />                    
                </c:if>
                <tr>                        
                    <th>CPF do Cliente: </th>                        
                    <td>                            
                        <input type="text" name="cpf" size="11" 
                               required value="<c:out value='${locacao.cpf}'/>"/>                        
                    </td>                    
                </tr>                    
                <tr>                        
                    <th>CNPJ Locadora: </th>                        
                    <td>                            
                        <input type="text" name="cnpj" size="15"                                   
                               required value="<c:out value='${locacao.cnpj}'/>"/>                        
                    </td>                    
                </tr>                    
                <tr>                        
                    <th>Data: </th>                        
                    <td>                            
                        <input type="date" name="dia"                                  
                               value="<c:out value='${locadora.dia}'/>"/>                        
                    </td>                    
                </tr>                    
                <tr>                        
                    <th>Horario: </th>                    
                    <td>                            
                        <input type="time" name="hora"                                   
                               value="<c:out value='${locadora.hora}' />"                                   
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