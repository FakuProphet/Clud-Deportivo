<%-- 
    Document   : agregar-socio
    Created on : 10-nov-2018, 9:02:37
    Author     : Lucia
--%>


<%@page import="java.util.ArrayList"%>
<%@page import="Model.TipoCuota"%>
<%@page import="Controller.Gestor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>



<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript">
        // Solo permite ingresar numeros.
        function soloNumeros(e){
	var key = window.Event ? e.which : e.keyCode
	return (key >= 48 && key <= 57)
        }
        </script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    </head>
    <body>

        <div class="container-fluid">

            <div class="row">
                <div class="col-12">

                   <nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="#">CDT</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="/Club_Deportivo/index.jsp">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Noticias</a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Socios
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="/Club_Deportivo/AgregarSocio">Agregar Socios</a>
          <a class="dropdown-item" href="/Club_Deportivo/ModificarSocio">Modificar Socio</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#"></a>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link disabled" href="#">Disabled</a>
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
  </div>
</nav>

                </div>
            </div>


            <div class="row">

                <div class="col-12 d-flex justify-content-center">
                    <h2>Agregar Socio</h2>
                    <form action="/Club_Deportivo/AgregarSocio" method="POST" class="mt-5 col-6">
                        <div class="form-group">
                            <input name="nombre" type="text" class="form-control" placeholder="Nombre" required="true">
                        </div>

                        <div class="form-group">
                            <input name="apellido" type="text" class="form-control" placeholder="Apellido" required="true">
                        </div>

                        <div class="form-group">
                            <input name="dni" type="text" class="form-control" placeholder="DNI" required="true" maxlength="8" onKeyPress="return soloNumeros(event)">
                        </div>

                        <div class="form-group">
                            <input name="direccion" type="text" class="form-control" placeholder="Direccion" required="true">
                        </div>

                        <div class="form-group">
                            <input name="telefono" type="text" class="form-control" placeholder="Telefono" required="true">
                        </div>

                        <div class="form-group">
                            <input name="mail" type="email" class="form-control" placeholder="Email" required="true">
                        </div>

                        <div class="form-group">
                            <label for="tipoCuota">Tipo Cuota</label>
                            <select name="tipoCuota" class="form-control" id="tipoCuota" >
                                
                                <c:if test="${cuotas != null}">
                                    <c:forEach var="cuota" items="${cuotas}">
                                        <option value="${cuota.id}">
                                            ${cuota.nombre}
                                        </option>
                                    </c:forEach>
                                </c:if>
                                    
                                <c:if test="${cuotas == null}">
                                    <% 
                                        Gestor g = new Gestor();
                                        ArrayList<TipoCuota> cuotas = g.loadTipoCuotas();
                                        
                                        for (TipoCuota tc : cuotas) { %>
                                            <option name="tipoCuota" value="<%= tc.getId() %>"><%= tc.getNombre() %></option>
                                    <% } %>
                                </c:if>
                                
                            </select>
                        </div>

                        <button type="submit" class="btn btn-success w-100">Guardar Socio</button>

                    </form>

                </div>
            </div>
        </div>
               
<div class="alert alert-dark" role="alert">
<a href="/Club_Deportivo/administrador.jsp" class="alert-link">Aquí volver </a>.Haga click en Aquí para volver a página principal.
 
</div>
<button type="button" class="close" data-dismiss="alert" aria-label="Close">
  <span aria-hidden="true">&times;</span>
</button>
        









        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    </body>
</html>
