<%-- 
    Document   : login
    Created on : 11-nov-2018, 15:52:17
    Author     : Lucia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="CSS/estiloBoton.css" rel="stylesheet" type="text/css"/>
        <title>Login</title>    
    </head>
    <body>
        <h1>Inicio de Sesión</h1>
        <form action="Login" method="POST">
            
           
                    <div class="Cell">
                        <label> Usuario: </label>
                    </div>
                     <div class="Cell">
                        <input type="text" name="nombreUsuario" required="required"/>
                    </div>   
                    <div class="Cell">
                        <label>Contraseña:</label>
                    </div>
                    <div class="Cell">
                        <input type="password" name="contrasenia" required="required"/>
                    </div>    
                     
                    
                    <br><br>
                    <div class="Cell">
                        <input type="submit" name="btnAceptar" value="Aceptar"/>
                    </div>   
                    <p> <a href="/Club_Deportivo/index.jsp">Volver a inicio</a></p>
        </form>
    </body>
</html>
