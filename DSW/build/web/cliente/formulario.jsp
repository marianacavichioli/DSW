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
                <li><a href="locadora/formulario" class="button">Cadastrar Locadora</a></li>
                <li><a href="#" class="button">Lista de Clientes</a></li>
                <li><a href="cadastro" class="button">Cadastrar Cliente</a></li>
                <li><a href="login" class="button">Login</a></li>
            </ul>
        </div>
    
        <div class='conteudo'>
            
        <c:if test="${cliente != null}">            
        <form action="atualizacao" method="post">            
        </c:if>            
        <c:if test="${cliente == null}">                
            <form action="insercao" method="post">                
            </c:if>                
            <table style="width: 40%">                                             
                    <c:if test="${cliente != null}">                                
                        <b>Edição:</b>                           
                    </c:if>                            
                    <c:if test="${cliente == null}">                                
                        <b>Cadastro:</b>
                        <br>
                        <br>
                    </c:if>                                           
                <c:if test="${cliente != null}">                        
                    <input type="hidden" name="id" value="<c:out value='${cliente.id}'/>" />                    
                </c:if>
                <tr>                        
                    <th>Nome: </th>                        
                    <td>                            
                        <input type="text" name="nome" size="45" 
                               required value="<c:out value='${cliente.nome}'/>"/>                        
                    </td>                    
                </tr>                    
                <tr>                        
                    <th>CPF: </th>                        
                    <td>                            
                        <input type="text" name="cpf" size="11"                                   
                               required value="<c:out value='${cliente.cpf}'/>"/>                        
                    </td>                    
                </tr>                    
                <tr>                        
                    <th>Telefone: </th>                        
                    <td>                            
                        <input type="text" name="telefone" size="11"                                   
                               value="<c:out value='${cliente.telefone}'/>"/>                        
                    </td>                    
                </tr>                    
                <tr>                        
                    <th>Data Nascimento: </th>                    
                    <td>                            
                        <input type="date" name="data_nascimento"                                   
                               value="<c:out value='${cliente.data_nascimento}' />"                                   
                               />                        
                    </td>                    
                </tr>
                <tr>                        
                    <th>Sexo: </th>                    
                    <td>                            
                        <input type="text" name="sexo"                                   
                               value="<c:out value='${cliente.sexo}' />"                                   
                               />                        
                    </td>                    
                </tr> 
                <tr>                        
                    <th>Email: </th>                    
                    <td>                            
                        <input type="email" name="email"                                   
                               value="<c:out value='${cliente.email}' />"                                   
                               />                        
                    </td>                    
                </tr>
                <tr>                        
                    <th>Senha: </th>                    
                    <td>                            
                        <input type="password" name="senha"                                   
                               value="<c:out value='${cliente.senha}' />"                                   
                               />                        
                    </td>                    
                </tr> 
                <tr>                        
                    <th>Ativo: </th>                    
                    <td>                            
                        <input type="number" name="ativo"                                   
                               value="<c:out value='${cliente.ativo}' />"                                   
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