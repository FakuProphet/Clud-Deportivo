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
        <script src="js/BuscadorTabla.js" type="text/javascript"></script>
    </head>
    
    <body>
            
            <div class="container">
            <br>
                <div align="center">
                <h1></h1>
                </div> 
                <label for ="searchTerm">Buscar por algun parametro</label>
                <input id="searchTerm" type="text" onkeyup="buscar()" />
                <br>
                <br>
            <div id="page-wrap">
            
            
                <table id="datos">
            <thead
            
            <tr>
            <th colspan="3">Noticias del clud</th>
            </tr>
            <tr>
            <th>Sector</th>
            <th colspan="2">Novedades</th>
            </tr>
            </thead>
            
            
            <tbody>
                     
            
            
            <% 
                                        
            Gestor g = new Gestor();
            ArrayList<PublicacionDTO> lista = g.loadPublicaciones(); 
            for (PublicacionDTO p : lista) { %>
                                        
            <tr>
                <td><%= p.getDescipcion() %></td>
                <td><%= p.getTexto() %> </td>
                <td>
                <i class=""></i>
                </td>
            </tr>
                                            
            <% } %>
            
           
            </tbody>
            
            <tfoot>
                <tr>
                    <td colspan="7">Salir: <a href="index.jsp">Volver a Inicio</a></td>
                </tr>
            </tfoot>
            
            </table>
            
    </body>
</html>
