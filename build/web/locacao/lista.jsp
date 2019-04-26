<%@ page language="java" contentType="text/html; charset=UTF-8" 
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page errorPage = "error.jsp" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>

    <style>
        <%@include file="/estilo.css"%>
    </style>

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
                <sec:authorize access="hasRole('CLIENTE')">
                    <li><a href="cadastro" class="button"><fmt:message key="cadastro_locacao"/></a></li>
                </sec:authorize>
                
                <li><a href="lista" class="button"><fmt:message key="lista_locacao"/></a></li>
                <li><a href="../logout" class="button">Logout</a></li>
            </ul>
        </div>

        <div class='conteudo'>

            <table style="width: 80%">            
                <caption><h2><fmt:message key="lista_locacao"/></h2></caption>            
                <tr>                
                    <th>ID</th>                
                    <th><fmt:message key="cnpj_locadora"/></th>                
                    <th><fmt:message key="data"/></th>                
                    <th><fmt:message key="horario"/></th>                
                </tr>            
                <c:forEach var="locacao" items="${listaLocacoes}">                
                    <tr>                    
                        <td><c:out value="${locacao.id}" /></td>                    
                        <td><c:out value="${locacao.cnpj_locadora}" /></td>                    
                        <td><c:out value="${locacao.dia}" /></td>                    
                        <td><c:out value="${locacao.hora}" /></td>
                    </tr>            
                </c:forEach>        
            </table>    
        </div>
    </fmt:bundle>
</body>
</html>