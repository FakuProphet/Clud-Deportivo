<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="CSS/estilo19.css" rel="stylesheet" type="text/css"/>
        <title>Inscripcion</title>
        <style type="text/css">
                a:link {text-decoration:none; color: #99CC00;} /* Link no visitado*/
                a:visited {text-decoration:none; color:#99CC66} /*Link visitado*/
                a:active {text-decoration:none; color:#99FF00; background:#EEEEEE} /*Link activo*/
                a:hover {text-decoration:underline; color:#99FF00; background: #EEEEEE} /*Mause sobre el link*/
        </style>   
    </head>
    <body>
        
        <div class="main-content">
        <form class="form-register" action="cargarDatos" method="post">

            <div class="form-register-with-email">

                <div class="form-white-background">

                    <div class="form-title-row">
                        <h1>Inscribir Socio en actividad</h1>
                    </div>

                     <div class="form-row">
                        <label>
                            <span>Codigo socio</span>
                            <input type="text" name="codSocio" value="${idSocio}" readonly>
                        </label>
                    </div>
                    
                    <div class="form-row">
                        <label>
                            <span>Nombre cliente:</span>
                            <input type="text" name="nombre" value="${miSocio.nombre}" readonly>
                        </label>
                    </div>
                        
                   <div class="form-row">
                        <label>
                            <span>Apellido cliente:</span>
                            <input type="text" name="apellido" value="${miSocio.apellido}" readonly>
                        </label>
                    </div>
                        
                        
                     <div class="form-row">
                       <label>
                            <span>Actividades disponibles para inscripcion</span>
                            <select name="cboActividad" id="cboAct" required>
                               
                                <c:forEach items= "${listaActividades}" var="c">
                                <option value="${c.id}">${c.descripcion}</option>
                                </c:forEach>
                                      
                            </select>
                        </label>
                    </div>   
                        
                    

                    <div class="form-row">
                        <button type="submit">Confirmar</button>
                        
                    </div>
                        
                        
                </div>

                <a href="/Club_Deportivo/listadoSocios" class="form-log-in-with-existing">Volver</a>

            </div>

            <div class="form-sign-in-with-social">

                <div class="form-row form-title-row">
                    
                </div>

            </div>

        </form>

    </div>

    </body>
</html>
