<%-- 
    Document   : altaModificacionTipoCuota
    Created on : 12-nov-2018, 23:23:42
    Author     : Lucia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Agregar o Modificar Tipos de Cuotas</h1>
        
        <form action="AltaTipoCuota" method="POST">
            
            <input type="hidden" name="id" value="${id}">
            <label>Nuevo Tipo Cuota:</label>
            <input type="text" name="nombre" value="${nombre}" required><br><br>
            <label>Monto:</label>
            <input type="number" name="monto" value="${monto}" required><br><br>
            <br><br>
            <input type="submit" value="Guardar">
            
        </form>
            <br>
        <td colspan="7">Volver: <a href="administrador.jsp">Volver a principal</a></td>
    </body>
</html>
