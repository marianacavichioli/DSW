<%@ page language="java" contentType="text/html; charset=UTF-8" 
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page errorPage = "error.jsp" %>
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
          
          onlynumber();

        }
        
        function onlynumber(evt) {
            var theEvent = evt || window.event;
            var key = theEvent.keyCode || theEvent.which;
            key = String.fromCharCode( key );
            var regex = /^[0-9.]+$/;
            if( !regex.test(key) ) {
               theEvent.returnValue = false;
               if(theEvent.preventDefault) theEvent.preventDefault();
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
                <li><a href="" class="button">Cadastrar Locadora</a></li>
                <li><a href="lista" class="button">Lista de Locadoras</a></li>
                <li><a href="../cliente_crud/cadastro" class="button">Cadastrar Cliente</a></li>
                <li><a href="../cliente_crud/lista" class="button">Lista de Clientes</a></li>
                <li><a href="../logout" class="button">Logout</a></li>
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
                        <input type="text" name="cnpj" maxlength="18" OnKeyPress="formatar('##.###.###/####-## ', this)"                                   
                               required value="<c:out value='${locadora.cnpj}'/>"/>                        
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
                    <th>Email: </th>                    
                    <td>                            
                        <input type="email" name="email"                                   
                               value="<c:out value='${locadora.email}' />"                                   
                               />                        
                    </td>                    
                </tr>
                <tr>                        
                    <th>Senha: </th>                    
                    <td>                            
                        <input type="password" name="senha"                                   
                               value="<c:out value='${locadora.senha}' />"                                   
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