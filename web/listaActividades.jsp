<%@page import="Model.PublicacionDTO"%>
<%@page import="Model.Actividad"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Controller.Gestor"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>    
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listado</title>     
        <link href="CSS/estilo12.css" rel="stylesheet" type="text/css"/>
    </head>
    
    <body>
            
            <div class="container">
            <br>
                <div align="center">
                <h1></h1>
                </div> 
               
                <br>
                <br>
            <div id="page-wrap">
            
            
                <table id="datos">
            <thead
            
            <tr>
            <th colspan="3">Listado de actividades del club</th>
            </tr>
            <tr>
                
                <th>Descripcion</th>
            </tr>
            </thead>
            
            
            <tbody>
                     
                <c:forEach items= "${lista}" var="l">
                <tr> 
                <th scope="row">${l.descripcion}</th>
                <td data-title="link"><a href="listaSociosPorActividad?id=${l.id}">Listado socios adheridos</a></td>
                </tr>  
                </c:forEach>
                    
            </tbody>
            
            <tfoot>
                <tr>
                    <td colspan="7">Salir: <a href="administrador.jsp">Volver a Principal</a></td>
                </tr>
            </tfoot>
            
            </table>
            
    </body>
</html>
