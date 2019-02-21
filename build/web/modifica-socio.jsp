<%-- 
    Document   : modifica-socio
    Created on : 10-nov-2018, 16:39:06
    Author     : Lucia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Socio</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    </head>
    <body>

        <div class="container-fluid">

            <div class="row">
                <div class="col-12">

                    <nav class="navbar navbar-expand-lg navbar-light bg-light">
                        <a class="navbar-brand" href="#">Navbar</a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarNav">
                            <ul class="navbar-nav">
                                <li class="nav-item active">
                                    <a class="nav-link" href="/Club_Deportivo/index.jsp">Home <span class="sr-only">(current)</span></a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#">Features</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#">Pricing</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link disabled" href="#">Disabled</a>
                                </li>
                            </ul>
                        </div>
                    </nav>

                </div>
            </div>


            <div class="row">

                <div class="col-12 d-flex justify-content-center">

                    <form action="/Club_Deportivo/AgregarSocio" method="POST" class="mt-5 col-6">
                        <div class="form-group">
                            <input value="${socio.nombre}" name="nombre" type="text" class="form-control" placeholder="Nombre" required>
                        </div>

                        <div class="form-group">
                            <input value="${socio.apellido}"name="apellido" type="text" class="form-control" placeholder="Apellido" required>
                        </div>

                        <div class="form-group">
                            <input value="${socio.dni}"name="dni" type="text" class="form-control" placeholder="DNI" required>
                        </div>

                        <div class="form-group">
                            <input value="${socio.direccion}"name="direccion" type="text" class="form-control" placeholder="Direccion" required>
                        </div>

                        <div class="form-group">
                            <input value="${socio.telefono}"name="telefono" type="text" class="form-control" placeholder="Telefono" required>
                        </div>

                        <div class="form-group">
                            <input value="${socio.mail}"name="mail" type="email" class="form-control" placeholder="Email" required>
                        </div>

                        <div class="form-group">
                            <label for="tipoCuota">Elija el Tipo Cuota</label>
                            <select name="tipoCuota" class="form-control" id="tipoCuota" required>
                                
                                <c:forEach var="cuota" items="${cuotas}">
                                    
                                    <c:choose>
                                        <c:when test="${cuota.id == cuotaSocio}">
                                           <option value="${cuota.id}" selected>
                                                ${cuota.nombre}
                                           </option>
                                        </c:when>
                                           
                                        <c:otherwise>
                                            <option value="${cuota.id}">
                                                ${cuota.nombre}
                                           </option>
                                        </c:otherwise>
                                    </c:choose>
                                    
                                </c:forEach>
                                
                            </select>
                        </div>

                        <button type="submit" class="btn btn-success w-100">Guardar Socio</button>

                    </form>

                </div>
            </div>
        </div>








        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    </body>
</html>

