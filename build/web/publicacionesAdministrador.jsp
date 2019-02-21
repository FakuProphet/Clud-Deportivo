
<%@page import="java.util.ArrayList"%>
<%@page import="Controller.Gestor"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>    
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listado</title>     
        <link href="CSS/style.css" rel="stylesheet" type="text/css"/>
        
    </head>
    
    <body>
            <table>
            <thead>
            <tr>
            <th colspan="3">Edicion noticias del club</th>
            </tr>
            <tr>
            <th>ID</th>
            <th>Area</th>
            <th>Novedades</th>
            <th>Habilitada</th>
            </tr>
            </thead>
            
            
            <tbody>
                     
            <c:forEach items= "${listaPublicaciones}" var="p">
            <tr>
                <th scope="row">${p.idPublicacion}</th>
                <td>${p.descipcion}</td>
                <td>${p.texto}</td>
                <td>${p.idHabilitada}</td>
                <td><a href="deletePublicacion.jsp?id=${p.idPublicacion}">Eliminar</a></td>
                <td><a href="updatePublicacion.jsp?id=${p.idPublicacion}">Cambiar Estado</a></td>
            </tr>  
            </c:forEach>
            
            </tbody>
            <td colspan="7"><a href="administrador.jsp">Volver a Inicio</a></td>
            </table>
            
    </body>
</html>
