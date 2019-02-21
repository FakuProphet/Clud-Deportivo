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
            <th colspan="3">Seleccionar un socio y ver un listado de sus cuotas pagas</th>
            </tr>
            <tr>
            <th>Apellido</th>
            <th>Nombre</th>
            <th>Mes</th>
            <th>Anio</th>
            </tr>
            </thead>
            
            
            <tbody>
                     
                <c:forEach items= "${listado}" var="l">
                <tr>
                <th scope="row">${l.apellido}</th>
                <th scope="row">${l.nombre}</th>
                <th scope="row">${l.mes}</th>
                <th scope="row">${l.anio}</th>
                </tr>  
                </c:forEach>
                    
            </tbody>
            
            <tfoot>
                <tr>
                    <td colspan="7">Salir: <a href="/Club_Deportivo/listadoSociosActividades">Volver a listado</a></td>
                </tr>
            </tfoot>
            
            </table>
            
    </body>
</html>