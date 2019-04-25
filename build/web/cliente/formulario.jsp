<%@ page language="java" contentType="text/html; charset=UTF-8" 
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>

    <style>
        <%@include file="/estilo.css"%>
    </style>

    <script>
        function formatar(mascara, documento){
          var i = documento.value.length;
          var saida = mascara.substring(0,1);
          var texto = mascara.substring(i)

          if (texto.substring(0,1) != saida){
                    documento.value += texto.substring(0,1);
          }

        }
    </script>
    
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
                <li><a href="" class="button">Cadastrar Cliente</a></li>
                <li><a href="lista" class="button">Lista de Clientes</a></li>
                <li><a href="../logout" class="button">Logout</a></li>
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
                        <input type="text" name="cpf" maxlength="14" OnKeyPress="formatar('###.###.###-##', this)"   
                               required value="<c:out value='${cliente.cpf}'/>"/>                        
                    </td>                    
                </tr>                    
                <tr>                        
                    <th>Telefone: </th>                        
                    <td>                            
                        <input type="text" name="telefone" maxlength="13" OnKeyPress="formatar('##-#####-####', this)"                                   
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
                    <td colspan="2" align="center">                            
                        <input type="submit" value="Salvar" />                        
                    </td>                    
                </tr>                
            </table>            
        </form>    
</div>
</body>
</html>