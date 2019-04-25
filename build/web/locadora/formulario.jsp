<%@ page language="java" contentType="text/html; charset=UTF-8" 
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page errorPage = "error.jsp" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>

    <style>
        <%@include file="/estilo.css"%>
    </style>

    <script>
        function formatar(mascara, documento) {
            var i = documento.value.length;
            var saida = mascara.substring(0, 1);
            var texto = mascara.substring(i)

            if (texto.substring(0, 1) != saida) {
                documento.value += texto.substring(0, 1);
            }

            onlynumber();

        }

        function onlynumber(evt) {
            var theEvent = evt || window.event;
            var key = theEvent.keyCode || theEvent.which;
            key = String.fromCharCode(key);
            var regex = /^[0-9.]+$/;
            if (!regex.test(key)) {
                theEvent.returnValue = false;
                if (theEvent.preventDefault)
                    theEvent.preventDefault();
            }
        }
    </script>

    <head>
        <fmt:bundle basename="i18n.sistema">
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title><fmt:message key="aluguel"/></title>

        <div class= "header">
            <center>
                <h1><fmt:message key="aluguel"/></h1>
            </center>
        </div>
    </fmt:bundle>
</head>

<body>    
    <fmt:bundle basename="i18n.sistema">
        <div class ='botoes'>
            <ul>
                <li><a href="" class="button"><fmt:message key="cadastro_locadora"/></a></li>
                <li><a href="lista" class="button"><fmt:message key="lista_locadora"/></a></li>
                <li><a href="../cliente_crud/cadastro" class="button"><fmt:message key="cadastro_cliente"/></a></li>
                <li><a href="../cliente_crud/lista" class="button"><fmt:message key="lista_cliente"/></a></li>
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
                            <b><fmt:message key="editar"/></b>                           
                        </c:if>                            
                        <c:if test="${locadora == null}">                                
                            <b><fmt:message key="cadastrar"/></b>
                            <br>
                            <br>
                        </c:if>                                           
                        <c:if test="${locadora != null}">                        
                            <input type="hidden" name="id" value="<c:out value='${locadora.id}'/>" />                    
                        </c:if>
                        <tr>                        
                            <th><fmt:message key="nome"/></th>                        
                            <td>                            
                                <input type="text" name="nome" size="50" 
                                       required value="<c:out value='${locadora.nome}'/>"/>                        
                            </td>                    
                        </tr>                    
                        <tr>                        
                            <th>CNPJ </th>                        
                            <td>                            
                                <input type="text" name="cnpj" maxlength="18" OnKeyPress="formatar('##.###.###/####-## ', this)"                                   
                                       required value="<c:out value='${locadora.cnpj}'/>"/>                        
                            </td>                    
                        </tr>                                     
                        <tr>                        
                            <th><fmt:message key="cidade"/></th>                    
                            <td>                            
                                <input type="text" name="cidade" size="70"                                 
                                       value="<c:out value='${locadora.cidade}' />"                                   
                                       />                        
                            </td>                    
                        </tr>
                        <tr>                        
                            <th>Email </th>                    
                            <td>                            
                                <input type="email" name="email"                                   
                                       value="<c:out value='${locadora.email}' />"                                   
                                       />                        
                            </td>                    
                        </tr>
                        <tr>                        
                            <th><fmt:message key="senha"/></th>                    
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
    </fmt:bundle>
</body>
</html>