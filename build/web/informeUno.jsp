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
            <th colspan="3">Monto total anual de ganancias en cuotas</th>
            </tr>
            <tr>
            <th>Monto Total</th>
            <th colspan="2">Anio</th>
            </tr>
            </thead>
            
            
            <tbody>
                     
                <c:forEach items= "${listado}" var="l">
                <tr>
                <th scope="row">${l.montoTotal}</th>
                <th scope="row">${l.anio}</th>
                </tr>  
                </c:forEach>
                    
            </tbody>
            
            <tfoot>
                <tr>
                    <td colspan="7">Salir: <a href="administrador.jsp">Volver a Inicio</a></td>
                </tr>
            </tfoot>
            
            </table>
            
    </body>
</html>
