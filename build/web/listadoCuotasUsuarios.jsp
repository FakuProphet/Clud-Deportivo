


<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cuotas sociales</title>
    </head>
    <body>
        <h1>informacion de cuotas sociales</h1>
        
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
               
            </tr>  
        </c:forEach>
            
    </tbody>
    
     <tfoot>
      <tr>
        <td colspan="7">nada: <a href="index.jsp">Volver a Inicio</a></td>
      </tr>
    </tfoot>
    
    </table>
        
    </div>
        
    </body>
</html>
