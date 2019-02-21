<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listado</title>
        <link href="CSS/style.css" rel="stylesheet" type="text/css"/>
        <script src="js/BuscadorTabla.js" type="text/javascript"></script>
        
    </head>
    <body>
        <div class="container">
            <br>
                <div align="center">
                    <h1>Listado de Socios</h1>
                </div> 
            
        <label for ="searchTerm">Buscar por algun parametro</label>
        <input id="searchTerm" type="text" onkeyup="buscar()" />
        <br>
        <br>
        <div id="page-wrap">
                
                
  <table id="datos">
   
    <thead>
      <tr>
        <th scope="col">Nombre</th>
        <th scope="col">Apellido</th>
        <th scope="col">DNI</th>
        <th scope="col">Direccion</th>
        <th scope="col">Telefono</th>
        <th scope="col">Email</th>
        <th scope="col">Tipo de cuota</th>
      </tr>
    </thead>
    <tfoot>
      <tr>
        <td colspan="7"><a href="administrador.jsp">Volver a Inicio</a></td>
      </tr>
    </tfoot>
    <tbody>
        <c:forEach items= "${listadoSocios}" var="a">
            <tr>
                <th scope="row">${a.nombre}</th>
                <td>${a.apellido}</td>
                <td>${a.dni}</td>
                <td>${a.direccion}</td>
                <td>${a.telefono}</td>
                <td>${a.mail}</td>
                <td>${a.tipoCuota}</td>
                
                <td data-title="link"><a href="delete.jsp?id=${a.id}">Eliminar</a></td>
                <td data-title="link"><a href="update.jsp?id=${a.id}">Editar</a></td>
                <td data-title="link"><a href="cargarDatos?id=${a.id}">Inscribir</a></td>
                
            </tr>  
        </c:forEach>
    </tbody>
  </table>
                </div>
</div>
    </body>
</html>
