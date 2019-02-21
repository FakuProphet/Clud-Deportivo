
<%@page import="Controller.Gestor"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Eliminar Socio</title>
    </head>
    <body>
       <%
            Gestor g = new Gestor();
            int id=Integer.parseInt(request.getParameter("id"));
            g.deleteSocio(id);
            response.sendRedirect("deleteOk.jsp");      
       %>
    </body>
</html>
