<%-- 
    Document   : listaTipoCuota
    Created on : 12-nov-2018, 23:10:53
    Author     : Lucia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
   
     
        <h2>${mensaje}</h2> <% request.setAttribute("mensaje", ""); %>
        <h1>Lista de Tipo Cuotas</h1>
        
    <div class="container">
    
        
    <table class="responsive-table">
    <thead>
      <tr>
        <th scope="col">Nombre</th>
        <th scope="col">Monto</th>
      </tr>
    </thead>
   
    <tbody>
        
        <c:forEach items= "${listaTipoCuota}" var="a">
            <tr>
                <td scope="row">${a.nombre}</d>
                <td data-title="Cat">${a.monto}</td>
                <td data-title="link"><a href="gestionArticulo?id=${a.id}">editar</a></td>
            </tr>  
        </c:forEach>
            
    </tbody>
    
     <tfoot>
      <tr>
        <td colspan="7">Volver: <a href="administrador.jsp">Volver a Inicio</a></td>
         <td colspan="7">Agregar nuevo tipo de cuota: <a href="altaTipoCuota.jsp">Agregar</a></td>
      </tr>
    </tfoot>
    
    </table>
        
    </div>
   
    </body>
      
        
        
        
</html>
