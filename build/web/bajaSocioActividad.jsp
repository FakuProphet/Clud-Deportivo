<%@page import="Controller.Gestor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        
        
        <%
                
            Gestor g = new Gestor();
            int idSocio = Integer.parseInt(request.getParameter("idSocio"));
            int idActividad = Integer.parseInt(request.getParameter("idAct"));
            g.desuscribirSocio(idSocio, idActividad);
            response.sendRedirect("/Club_Deportivo/listadoSociosActividades");
            
        %>
        
       
    </body>
</html>
