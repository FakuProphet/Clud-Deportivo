<%-- 
    Document   : indexx
    Created on : 07-nov-2018, 11:07:43
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
        <title>Home Administrador</title>
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
        <a class="nav-link" href="/Club_Deportivo/administrador.jsp">Home<span class="sr-only">(current)</span></a>
      </li>
     
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Socios
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="/Club_Deportivo/AgregarSocio">Nuevo Socio</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="/Club_Deportivo/listadoSocios">Listado Socios</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#"></a>
        </div>     
      </li>
      
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Socios Inscriptos
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="/Club_Deportivo/listadoSociosActividades">Listado de inscriptos</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#"></a>
        </div>     
      </li>
      
      
       <li class="nav-item dropdown">
           
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Publicaciones
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="/Club_Deportivo/generarPublicacion">Nueva</a>
          <a class="dropdown-item" href="/Club_Deportivo/administradorPublicaciones">Listado</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#"></a>
        </div>
          
      </li>

       <li class="nav-item dropdown">
           
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Reportes
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="obtenerMontosDeGananciaCuotasAnual">Monto total anual de ganancias en cuotas</a>
          <a class="dropdown-item" href="/Club_Deportivo/listadoSociosActividades">Seleccionar un socio y ver un listado de sus cuotas pagas</a>
          <a class="dropdown-item" href="generarListadoActividades">Listado de socios inscriptos a actividad seleccionada</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#"></a>
        </div>
          
      </li>
      
      <li class="nav-item">
        <a class="nav-link " href="/Club_Deportivo/ListaTipoCuotaServlet">CRUD tipo de Cuotas</a>
      </li>
     
      <li class="nav-item">
        <a class="nav-link" href="Logout">Cerrar Sesion</a>
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
                <h2>CLUB DEPORTIVO TENERIFE</h2>


                </div>
            </div>
        </div>
        <ul>
 <label>Usuario:${sessionScope['name']}</label>
 </ul>
        


        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    </body>
</html>

