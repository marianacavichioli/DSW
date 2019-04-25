<%-- 
    Document   : error
    Created on : Apr 25, 2019, 2:58:01 PM
    Author     : rafaelsaito
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page isErrorPage = "true" %>
<!DOCTYPE html>
<html>
   <head>
      <title>Show Error Page</title>
   </head>
   
   <body>
      <h1>Opps...</h1>
      <p>Sorry, an error occurred.</p>
      <p>Here is the exception stack trace: <%=response.getStatus() %></p>
      
   </body>
</html>
