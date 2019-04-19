<%@ page language="java" contentType="text/html; charset=UTF-8" 
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>    
    <head>        
        <title>Locação Bicicletas</title>    
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
        <c:if test="${cliente != null}">            
            <form action="atualizacao" method="post">            
            </c:if>            
            <c:if test="${cliente == null}">                
                <form action="insercao" method="post">                
                </c:if>                
                <table border="1" cellpadding="5">                   
                    <caption>                        
                        <h2>                            
                            <c:if test="${cliente != null}">                                
                                Edição                           
                            </c:if>                            
                            <c:if test="${cliente == null}">                                
                                Cadastro
                            </c:if>                        
                        </h2>                    
                    </caption>                    
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
                            <input type="text" name="ativo"                                   
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