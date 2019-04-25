<%-- 
    Document   : error
    Created on : Apr 25, 2019, 2:58:01 PM
    Author     : rafaelsaito
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ page isErrorPage = "true" %>
<!DOCTYPE html>
<html>
    
    <style>
        <%@include file="estilo.css"%>
    </style>
    
    
   <head>
      <fmt:bundle basename="i18n.sistema">
      <title><fmt:message key="pagina_erro"/></title>
      </fmt:bundle>
   </head>
   
   <body>
      <fmt:bundle basename="i18n.sistema">
      <center>
          <div class="erro">
              
            <h1>Ops!</h1>
            <p><fmt:message key="erro1"/></p>
            <p><fmt:message key="erro2"/> <%=response.getStatus() %>. </p>
            <p><fmt:message key="erro3"/></p>
            
          </div>
      </center>
      </fmt:bundle>
   </body>
</html>
