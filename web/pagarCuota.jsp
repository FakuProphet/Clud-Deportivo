<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="CSS/estilo19.css" rel="stylesheet" type="text/css"/>
        <title>Pago Cuota Socio</title>
        <style type="text/css">
                a:link {text-decoration:none; color: #99CC00;} /* Link no visitado*/
                a:visited {text-decoration:none; color:#99CC66} /*Link visitado*/
                a:active {text-decoration:none; color:#99FF00; background:#EEEEEE} /*Link activo*/
                a:hover {text-decoration:underline; color:#99FF00; background: #EEEEEE} /*Mause sobre el link*/
        </style>   
    </head>
    <body>
        
        <div class="main-content">
        <form class="form-register" action="GenerarPago" method="post">

            <div class="form-register-with-email">

                <div class="form-white-background">

                    <div class="form-title-row">
                        <h1>Transaccion Pago de cuota Socio</h1>
                    </div>

                     <div class="form-row">
                        <label>
                            <span>Codigo cliente</span>
                            <input type="text" name="codCliente" value="${item.id}" readonly>
                        </label>
                    </div>
                    
                    <div class="form-row">
                        <label>
                            <span>Nombre cliente:</span>
                            <input type="text" name="nombre" value="${item.nombre}" readonly>
                        </label>
                    </div>
                        
                   <div class="form-row">
                        <label>
                            <span>Apellido cliente:</span>
                            <input type="text" name="apellido" value="${item.apellido}" readonly>
                        </label>
                    </div>
                        
                        
                    <div class="form-row">
                       <label>
                            <span>Mes</span>
                            <select name="cboMes" id="cboMeses" required>
                                <option value="" >Seleccione...</option>
                                <option value="1">Enero</option>
                                <option value="2">Febrero</option>
                                <option value="3">Marzo</option>
                                <option value="4">Abril</option>
                                <option value="5">Mayo</option>
                                <option value="6">Junio</option>
                                <option value="7">Julio</option>
                                <option value="8">Agosto</option>
                                <option value="9">Septiembre</option>
                                 <option value="10">Octubre</option>
                                <option value="11">Noviembre</option>
                                <option value="12">Diciembre</option>
                            </select>
                        </label>
                    </div>   
                        
                     <div class="form-row">
                       <label>
                            <span>Anio</span>
                            <select name="cboAnio" id="cboAnios" required>
                                <option value="" >Seleccione...</option>
                                <option value="2018">2018</option>
                                <option value="2017">2017</option>
                                <option value="2016">2016</option>
                            </select>
                        </label>
                    </div>   

                    <div class="form-row">
                        <button type="submit">Efectuar Pago</button>
                        
                    </div>
                        
                        
                </div>

                <a href="/Club_Deportivo/listadoSociosActividades" class="form-log-in-with-existing">Volver</a>

            </div>

            <div class="form-sign-in-with-social">

                <div class="form-row form-title-row">
                    
                </div>

            </div>

        </form>

    </div>

    </body>
</html>
