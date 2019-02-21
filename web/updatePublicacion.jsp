<%@page import="Controller.Gestor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar publicacion</title>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        
        
        <%
                
            Gestor g = new Gestor();
            int id = Integer.parseInt( request.getParameter("id"));
            g.actualizarEstadoPublicacion(id);
            response.sendRedirect("/Club_Deportivo/administradorPublicaciones");
            
        %>
        
       
    </body>
</html>
