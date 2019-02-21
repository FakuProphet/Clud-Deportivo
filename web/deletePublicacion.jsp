
<%@page import="Controller.Gestor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <h1>Borrando publicación!</h1>
          <% 
            Gestor g = new Gestor();
            int id=Integer.parseInt(request.getParameter("id"));
            g.deletePublcacion(id);
            response.sendRedirect("/Club_Deportivo/administradorPublicaciones");
          %>
    </body>
</html>
