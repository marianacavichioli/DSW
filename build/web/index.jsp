<%-- 
    Document   : index
    Created on : Apr 20, 2019, 3:31:35 PM
    Author     : julia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
<style>
    <%@include file="estilo.css"%>
</style>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Alguel de Bicicletas</title>

<div class= "header">
    <center>
    <h1>Aluguel de Bicicletas</h1>
    </center>
</div>
</head>

<body>
        <div class ='botoes'>
            <ul>
                <li><a href="#" class="button"> Pagina Inicial</a></li>
                <li><a href="#" class="button">Cadastrar Locacao</a></li>
                <li><a href="#" class="button">Cadastrar Locadora</a></li>
                <li><a href="cliente/formulario.jsp" class="button">Cadastrar Cliente</a></li>
            </ul>
        </div>
    
        <div class ='conteudo'>
        <p> Escolha sua cidade: </p>
        
        <h3> Lista de Locadoras <h3>
        <table style="width:40%">            
            <tr>
                <th>Nome</th>
                <th>E-mail</th>    
            </tr>
        </table>
        </div>
</body>
</html>
