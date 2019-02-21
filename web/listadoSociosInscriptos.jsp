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
                    <h1>Listado de Socios inscriptos</h1>
                </div> 
            
        <label for ="searchTerm">Buscar por algun parametro</label>
        <input id="searchTerm" type="text" onkeyup="buscar()" />
        <br>
        <br>
        <div id="page-wrap">
                
                
  <table id="datos">
   
    <thead>
      <tr>
        <th scope="col">Apellido</th>
        <th scope="col">Nombre</th>
        <th scope="col">DNI</th>
        <th scope="col">Actividad</th>
      </tr>
    </thead>
    <tfoot>
      <tr>
        <td colspan="7"><a href="administrador.jsp">Volver a Inicio</a></td>
      </tr>
    </tfoot>
    <tbody>
        <c:forEach items= "${listaInscriptos}" var="s">
            <tr>
                <th scope="row">${s.apellido}</th>
                <td>${s.nombre}</td>
                <td>${s.dni}</td>
                <td>${s.actividadDesc}</td>
                
                
                <td data-title="link"><a href="bajaSocioActividad.jsp?idSocio=${s.codigoSocio}&idAct=${s.actividadId}">Dar de baja</a></td>
                <td data-title="link"><a href="ObtenerDetallePago?id=${s.codigoSocio}">Pagar Cuota Socio</a></td>
                <td data-title="link"><a href="listadoSociosCuotasPagas?id=${s.codigoSocio}">Ver cuotas Socio</a></td>
            </tr>  
        </c:forEach>
    </tbody>
  </table>
                </div>
</div>
    </body>
</html>
