<%@page import="java.util.ArrayList"%>
<%@page import="Model.TipoCuota"%>
<%@page import="Controller.Gestor"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
      
    <head> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <title>Actualizar datos socio</title>
        
         <script type="text/javascript">
        // Solo permite ingresar numeros.
        function soloNumeros(e){
	var key = window.Event ? e.which : e.keyCode
	return (key >= 48 && key <= 57)
        }
        </script>
        
        
    </head>
    
    
    
    
    <body>
        <%
       
       Connection con;       
       String url="jdbc:sqlserver://DESKTOP-A5KQF7B:1433;databaseName=Club_Deportivo";
       String Driver="com.microsoft.sqlserver.jdbc.SQLServerDriver";
       String user="sa";
       String clave="123";
       Class.forName(Driver);
       con=DriverManager.getConnection(url,user,clave);
       PreparedStatement ps;
       ResultSet rs;
       int id=Integer.parseInt(request.getParameter("id"));
       ps=con.prepareStatement("select * from Socio where id="+id);
       rs=ps.executeQuery();
       while(rs.next()){
           
        %>
        <div class="container">
            <h1>Modificar Registro</h1>
            <hr>
            <form action="" method="POST" class="form-control" style="width: 500px; height: 400px">
               
                
                    <div class="Cell">
                        <label> Codigo: </label>
                    </div>
                     <div class="Cell">
                        <input type="text" name="id" readonly="true" class="form-control" value="<%= rs.getInt("id")%>"/>
                    </div>   
                    
                    <div class="Cell">
                        <label>Nombre:</label>
                    </div>
                    <div class="Cell">
                        <input type="text" name="nombre"  class="form-control" value="<%= rs.getString("nombre")%>"/>
                    </div>    
                     
                    <div class="Cell">
                        <label>Apellido:</label>
                    </div>
                    <div class="Cell">
                        <input type="text" name="apellido"  class="form-control" value="<%= rs.getString("apellido")%>"/>
                    </div>    
                    
                    <div class="Cell">
                        <label>Dni:</label>
                    </div>
                    <div class="Cell">
                        <input type="text" name="dni" class="form-control" maxlength="8" onKeyPress="return soloNumeros(event)" value="<%= rs.getString("dni")%>"/>
                    </div>
                    
                    <div class="Cell">
                        <label>Direccion:</label>
                    </div>
                    <div class="Cell">
                        <input type="text" name="direccion" class="form-control" value="<%= rs.getString("direccion")%>"/>
                    </div>    
                    
                    <div class="Cell">
                        <label>Telefono:</label>
                    </div>
                    <div class="Cell">
                        <input type="text" name="telefono" class="form-control" value="<%= rs.getString("telefono")%>"/>
                    </div>    
                    
                    <div class="Cell">
                        <label>Email:</label>
                    </div>
                    <div class="Cell">
                        <input type="text" name="mail" class="form-control" value="<%= rs.getString("mail")%>"/>
                    </div>    
                    
                    
                                            
            </div>
                    
                    <input type="submit" value="Guardar" class="btn btn-primary btn-lg"/>
                    <br><br><br><br><br>
                    <a href="/Club_Deportivo/listadoSocios">Regresar al listado</a>
                    
            </form>
                
            <%}%>
        </div>
    </body>
</html>
<%
    
    String ape, nom,doc,mail,dir,tel;
    ape=request.getParameter("apellido");
    nom=request.getParameter("nombre");
    doc=request.getParameter("dni");
    mail=request.getParameter("mail");
    dir=request.getParameter("direccion");
    tel=request.getParameter("telefono");
    if(nom!=null)
    {
        ps=con.prepareStatement("update socio set nombre='"+nom+"', dni='"+doc+"',mail='"+mail+"',apellido='"+ape+"',telefono='"+tel+"',direccion='"+dir+"' where id="+id);
        ps.executeUpdate();
        response.sendRedirect("/Club_Deportivo/listadoSocios");   
    }  
           
%>

