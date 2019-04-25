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
                <li><a href="cadastro" class="button"><fmt:message key="cadastro_locacao"/></a></li>
                <li><a href="lista" class="button"><fmt:message key="lista_locacao"/></a></li>
                <li><a href="../logout" class="button">Logout</a></li>
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
                            <b><fmt:message key="editar"/></b>                           
                        </c:if>                            
                        <c:if test="${locacao == null}">                                
                            <b><fmt:message key="cadastrar"/></b>
                            <br>
                            <br>
                        </c:if>                                           
                        <c:if test="${locacao != null}">                        
                            <input type="hidden" name="id" value="<c:out value='${locacao.id}'/>" />                    
                        </c:if>

                        <input type="hidden" name="email" value="<c:out value='<%=request.getUserPrincipal().getName().toString()%>'/>" />                   

                        <tr>                        
                            <th><fmt:message key="cnpj_locadora"/></th>                        
                            <td>                            
                                <input type="text" name="cnpj_locadora" maxlength="18" OnKeyPress="formatar('##.###.###/####-## ', this)"                                   
                                       required value="<c:out value='${locacao.cnpj}'/>"/>                        
                            </td>                    
                        </tr>                    
                        <tr>                        
                            <th><fmt:message key="data"/></th>                        
                            <td>                            
                                <input type="date" name="dia"                                  
                                       value="<c:out value='${locadora.dia}'/>"/>                        
                            </td>                    
                        </tr>                    
                        <tr>                        
                            <th><fmt:message key="horario"/></th>                    
                            <td>                            
                                <input type="text" name="hora" maxlength="5" OnKeyPress="formatar('##:##', this)"                                    
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
    </fmt:bundle>
</body>
</html>