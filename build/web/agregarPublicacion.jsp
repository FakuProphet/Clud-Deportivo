<%@page import="Model.Actividad"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.TipoCuota"%>
<%@page import="Controller.Gestor"%>
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
        <form class="form-register" action="generarPublicacion" method="post">

            <div class="form-register-with-email">

                <div class="form-white-background">

                    <div class="form-title-row">
                        <h1>Publicar Noticias del club</h1>
                    </div>
                
                        
                    <div class="form-row">
                       <label>
                            <span>Anio</span>
                            <select name="cboActividad" id="cboAct" required>
                               
                                <c:forEach items= "${listaActividades}" var="c">
                                <option value="${c.id}">${c.descripcion}</option>
                                </c:forEach>
                                      
                            </select>
                        </label>
                    </div>   

                    
                   
                    
                    
                    <div class="form-row">
                        <label>
                           <textarea name="txtDescripcion" style="width:437px;height:300px;" required></textarea>
                        </label>
                    </div>
                    
                                      
                    <div class="form-row">
                        <button type="submit">Publicar</button>
                        
                    </div>
                        
                        
                </div>

                <a href="" class="form-log-in-with-existing">Volver</a>

            </div>

            <div class="form-sign-in-with-social">

                <div class="form-row form-title-row">
                    
                </div>

            </div>

        </form>

    </div>

    </body>
</html>

