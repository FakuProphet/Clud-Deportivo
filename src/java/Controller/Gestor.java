/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;
//java clase comun

import Model.Actividad;
import Model.ModelosReporte.InformeDos;
import Model.ModelosReporte.InformeUno;
import Model.PagoCuota;
import Model.Publicacion;
import Model.PublicacionDTO;
import Model.Socio;
import Model.SocioDTO;
import Model.SocioXActividad;
import Model.SocioXActividadDTO;
import Model.TipoCuota;
import Model.Usuario;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Lucia
 */
public class Gestor {

  

 private Connection con;
 private Statement st;
 private ResultSet rs;

 public void AbrirConexion()
    { 
        try
        {   
            String url = "jdbc:sqlserver://localhost;databaseName=Club_Deportivo";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
            con = DriverManager.getConnection(url,"facuCba", "1234");
            System.out.println("Conexión a la BD");
	} 
        catch (ClassNotFoundException | IllegalAccessException | InstantiationException | SQLException e) {
            System.out.println("Error en conexión ");
	}

    }

    public void CerrarConexion()
    { 
        try
        {	
            con.close();
            System.out.println("Conexión cerrada");
        } 
        catch (SQLException e) {
            System.out.println("Error al cerrar conexión");
	}
    }
    
    
      public  boolean checkUser(String nombre,String pass) 
     {
      boolean salida =false;
      try
      {

	 this.AbrirConexion();
         st=con.createStatement();
         String sql="select nombreUsuario,contrasenia from Usuario where  nombreUsuario like '"+nombre+"'and contrasenia="+pass+"";
         rs=st.executeQuery(sql);
         
         if(rs.next())
         {
             salida = true;
         }
         
         this.CerrarConexion();
      }
      catch(SQLException e)
      {
          System.out.println("Error:" + e.getMessage());
      }
         return salida;                 
  }   
    
     
      
    public  boolean actualizarSocio(int id, String nombre)  
    {  
       
        boolean bandera =false; 
       
        try
        { 
            AbrirConexion();
            String sql="update Socio set nombre =" +nombre+ " where id="+id+"";           
            PreparedStatement pstm;
            pstm=con.prepareStatement(sql);       
            pstm.executeUpdate();
            bandera=true;  
        }
        catch(SQLException e)
        { 
            System.out.println("Error en la consulta:" + e.getMessage());
            bandera =false;
        }
        finally
        { 
            try
            { 
                CerrarConexion();
            }
            catch(Exception e)
            { 
                System.out.println("Error en el cierre de la conexion:" + e.getMessage());
                bandera =false;
            }
        }
        
        return bandera;
    }
    
    
    public void desuscribirSocio(int idSocio, int idAct)  
    {  
       
        
       
        try
        { 
            /* Usamos el operador lógico de negación para invertir el valor:*/
            AbrirConexion();
            String sql="delete SocioXActividad where idSocio = '"+idSocio+"' and idActividad =" +idAct;
            PreparedStatement pstm;
            pstm=con.prepareStatement(sql);       
            pstm.executeUpdate();
           
        }
        catch(SQLException e)
        { 
            System.out.println("Error en la consulta:" + e.getMessage());
           
        }
        finally
        { 
            try
            { 
                CerrarConexion();
            }
            catch(Exception e)
            { 
                System.out.println("Error en el cierre de la conexion:" + e.getMessage());
                
            }
        }
        
       
    }
    
    
    public  boolean actualizarEstadoPublicacion(int id)  
    {  
       
        boolean bandera =false; 
       
        try
        { 
            /* Usamos el operador lógico de negación para invertir el valor:*/
            AbrirConexion();
            String sql="Update Publicacion SET habilitada = Convert(Bit,~ habilitada) where id="+id;
            PreparedStatement pstm;
            pstm=con.prepareStatement(sql);       
            pstm.executeUpdate();
            bandera=true;  
        }
        catch(SQLException e)
        { 
            System.out.println("Error en la consulta:" + e.getMessage());
            bandera =false;
        }
        finally
        { 
            try
            { 
                CerrarConexion();
            }
            catch(Exception e)
            { 
                System.out.println("Error en el cierre de la conexion:" + e.getMessage());
                bandera =false;
            }
        }
        
        return bandera;
    }
      
    public ArrayList getSociosClub()  
    {  
        ArrayList lista=new ArrayList();
        int cod;
        String nom;
        String ape;
        String dni;
        String dir;
        String tel;
        String mail;
        String tCuota;
                
        SocioDTO s=null;
        try
        { 
          AbrirConexion();
          st=con.createStatement();
          String sql="Select s.id, s.nombre,s.apellido,s.dni,s.telefono,s.direccion,s.mail, t.nombre as tipo \n" +
                    "from Socio s inner join TipoCuota t on s.idTipoCuota = t.id  ";
          rs=st.executeQuery(sql);
          while(rs.next())
          { 
            cod=rs.getInt("id");
            nom=rs.getString("nombre");
            ape=rs.getString("apellido");
            dni=rs.getString("dni");
            dir=rs.getString("direccion");
            tel=rs.getString("telefono");
            mail=rs.getString("mail");
            tCuota=rs.getString("tipo");
          
            s=new SocioDTO(cod,nom,ape,dni,dir,tel,mail,tCuota);
            //Lo agrego a la coleccion
            lista.add(s);
          }
        }
        catch(SQLException e)
        { 
            System.out.println("Error en la consulta:" + e.getMessage());
        }
        finally
        { 
            try{ 
                CerrarConexion();
            }
            catch(Exception e)
            { 
                System.out.println("Error en el cierre de la conexion:" + e.getMessage());
            }
        }
        return lista; 
    }
      
    
     public Socio getSocio(int id)  
    {  
        Socio nuevo = null;
        int cod;
        String nom;
        String ape;
        String dni;
        String dir;
        String tel;
        String mail;
        int tCuota;
                
        
        try
        { 
          AbrirConexion();
          st=con.createStatement();
          String sql="Select * from Socio where id=" +id;
          rs=st.executeQuery(sql);
          if(rs.next())
          { 
            cod=rs.getInt("id");
            nom=rs.getString("nombre");
            ape=rs.getString("apellido");
            dni=rs.getString("dni");
            dir=rs.getString("direccion");
            tel=rs.getString("telefono");
            mail=rs.getString("mail");
            tCuota=rs.getInt("idTipoCuota");
          
            nuevo =new Socio(cod,nom,ape,dni,dir,tel,mail,tCuota);
            
            
          }
        }
        catch(SQLException e)
        { 
            System.out.println("Error en la consulta:" + e.getMessage());
        }
        finally
        { 
            try{ 
                CerrarConexion();
            }
            catch(Exception e)
            { 
                System.out.println("Error en el cierre de la conexion:" + e.getMessage());
            }
        }
        return nuevo; 
    }
    
    
     public boolean addSocio(Socio s) {
        boolean inserted;
        try {
            AbrirConexion();
            String query = "INSERT INTO SOCIO VALUES (?,?,?,?,?,?,?)";
            PreparedStatement pstm = con.prepareStatement(query);
            pstm.setString(1, s.getNombre());
            pstm.setString(2, s.getApellido());
            pstm.setString(3, s.getDni());
            pstm.setString(4, s.getDireccion());
            pstm.setString(5, s.getTelefono());
            pstm.setString(6, s.getMail());
            pstm.setInt(7, s.getIdTipoCuota());
            pstm.executeUpdate();

            inserted = true;
            CerrarConexion();

        } catch (SQLException e) {
            e.printStackTrace(System.out);
            inserted = false;
        
        }
        return inserted;
    }
    
     
      public boolean inscribirSocio(SocioXActividad item) {
        boolean inserted;
        try {
            AbrirConexion();
            String query = "INSERT INTO SOCIOXACTIVIDAD (idActividad,idSocio) VALUES (?,?)";
            PreparedStatement pstm = con.prepareStatement(query);
            pstm.setInt(1, item.getIdActividad() );
            pstm.setInt(2, item.getIdSocio());
            pstm.executeUpdate();

            inserted = true;
            CerrarConexion();

        } catch (SQLException e) {
            e.printStackTrace(System.out);
            inserted = false;
        
        }
        return inserted;
    }
     
     
     
     
      public boolean addPublicacion(Publicacion p) {
        boolean inserted;
        try {
            AbrirConexion();
            String query = "INSERT INTO PUBLICACION (texto,idActividad) VALUES (?,?)";
            PreparedStatement pstm = con.prepareStatement(query);
            pstm.setString(1, p.getTexto() );
            pstm.setInt(2, p.getIdActividad());
            pstm.executeUpdate();

            inserted = true;
            CerrarConexion();

        } catch (SQLException e) {
            e.printStackTrace(System.out);
            inserted = false;
        
        }
        return inserted;
    }
      
    public boolean addPago(PagoCuota c) {
        boolean inserted;
        try {
            AbrirConexion();
            String query = "INSERT INTO PAGOCUOTA VALUES (?,?,?)";
            PreparedStatement pstm = con.prepareStatement(query);
            pstm.setInt(1, c.getMes());
            pstm.setInt(2, c.getAnio());
            pstm.setInt(3, c.getIdSocio());
            pstm.executeUpdate();

            inserted = true;
            CerrarConexion();

        } catch (SQLException e) {
            e.printStackTrace(System.out);
            inserted = false;
        
        }
        return inserted;
    }
    
    
    public boolean deletePublcacion(int id)
    {
        boolean bandera=false;
        int valor = 0;
        try
        { 
            AbrirConexion();
            PreparedStatement ps;       
            ps=con.prepareStatement("delete from publicacion where Id="+id);
            valor = ps.executeUpdate();
            if(valor>0)
            {
                bandera = true;
            }
            else
            {
                bandera = false;
            }
        }
        catch(SQLException e)
        { 
            System.out.println("Error en la consulta:" + e.getMessage());
        }
        finally
        { 
            try
            { 
                CerrarConexion();
            }
            catch(Exception e)
            { 
                System.out.println("Error en el cierre de la conexion:" + e.getMessage());
            }
        }
        
        return bandera;
    }
    
    
    
    
    
    
    
    
    public boolean deleteSocio(int id)
    {
        boolean bandera=false;
        int valor = 0;
        try
        { 
            AbrirConexion();
            PreparedStatement ps;       
            ps=con.prepareStatement("delete from Socio where Id="+id);
            valor = ps.executeUpdate();
            if(valor>0)
            {
                bandera = true;
            }
            else
            {
                bandera = false;
            }
        }
        catch(SQLException e)
        { 
            System.out.println("Error en la consulta:" + e.getMessage());
        }
        finally
        { 
            try
            { 
                CerrarConexion();
            }
            catch(Exception e)
            { 
                System.out.println("Error en el cierre de la conexion:" + e.getMessage());
            }
        }
        
        return bandera;
    }
    

    public ArrayList<TipoCuota> loadTipoCuotas() {
        ArrayList<TipoCuota> tipos = new ArrayList<>();
        try {
            AbrirConexion();
            String query = "SELECT * FROM TipoCuota";
             st = con.createStatement();
             rs = st.executeQuery(query);

            while (rs.next()) {
                int id = rs.getInt("id");
                String nombre = rs.getString("nombre");
                int monto = rs.getInt("monto");

                TipoCuota tc = new TipoCuota(id, nombre, monto);
                tipos.add(tc);

            }
            CerrarConexion();
        } catch (SQLException e) {
            System.out.println("Error al conectar" + e);
        
        }
        return tipos;

    }

    public ArrayList<InformeUno> loadInformeUno() {
        
        ArrayList<InformeUno> listado = new ArrayList<>();
        try 
        {
            AbrirConexion();
            
            String query = "select * from informeUnoVista";
            
            st = con.createStatement();
            rs = st.executeQuery(query);

            while (rs.next()) 
            {
                double montoTotal = rs.getDouble(1);
                int anio = rs.getInt(2);
                InformeUno i = new InformeUno (montoTotal,anio);
                listado.add(i);
            }
            
            CerrarConexion();
        }   
        catch (SQLException e) 
        {
            System.out.println("Error al conectar" + e);  
        }
        
        return listado;

    }
    
    public ArrayList<InformeDos> loadInformeDos(int id) {
        
        ArrayList<InformeDos> listado = new ArrayList<>();
        try 
        {
            AbrirConexion();
            
            String query = "select * from informeDosVista i where i.Codigo ="+id;
            
            st = con.createStatement();
            rs = st.executeQuery(query);

            while (rs.next()) 
            {
                int cod = rs.getInt(1);
                String ape = rs.getString(2);
                String nom = rs.getString(3);
                int mes = rs.getInt(4);
                int anio = rs.getInt(5);
                InformeDos i = new InformeDos (cod,ape,nom,mes,anio);
                listado.add(i);
            }
            
            CerrarConexion();
        }   
        catch (SQLException e) 
        {
            System.out.println("Error al conectar" + e);  
        }
        
        return listado;

    }
    
    
    
     public ArrayList<PublicacionDTO> loadPublicaciones() {
        
        ArrayList<PublicacionDTO> listado = new ArrayList<>();
        try 
        {
            AbrirConexion();
            
            String query = "select * from publicacionesVista";
            
            st = con.createStatement();
            rs = st.executeQuery(query);

            while (rs.next()) 
            {
                String texto = rs.getString("texto");
                String actividad = rs.getString("descripcion");
               
                PublicacionDTO p = new PublicacionDTO (texto,actividad);
                listado.add(p);
            }
            
            CerrarConexion();
        }   
        catch (SQLException e) 
        {
            System.out.println("Error al conectar" + e);  
        }
        
        return listado;

    }
    
     
    
     
     
      public ArrayList<PublicacionDTO> loadPublicacionesAdministrador() {
        
        ArrayList<PublicacionDTO> listado = new ArrayList<>();
        try 
        {
            AbrirConexion();
            
            String query = "select * from publicacionesAdm";
            
            st = con.createStatement();
            rs = st.executeQuery(query);

            while (rs.next()) 
            {
                int idPublicacion = rs.getInt("id");
                String texto = rs.getString("texto");
                String descripcion = rs.getString("descripcion");
                int idHabilitada = rs.getInt("habilitada"); 
                PublicacionDTO p = new PublicacionDTO (texto,descripcion,idHabilitada,idPublicacion);
                listado.add(p);
            }
            
            CerrarConexion();
        }   
        catch (SQLException e) 
        {
            System.out.println("Error al conectar" + e);  
        }
        
        return listado;

    }
    
    
    
     public ArrayList<Actividad> loadActividades() {
        
        ArrayList<Actividad> listado = new ArrayList<>();
        try 
        {
            AbrirConexion();
            
            String query = "select * from actividad";
            
            st = con.createStatement();
            rs = st.executeQuery(query);

            while (rs.next()) 
            {
                int id = rs.getInt("id");
                String descripcion = rs.getString("descripcion");
               
                Actividad p = new Actividad (id,descripcion);
                listado.add(p);
            }
            
            CerrarConexion();
        }   
        catch (SQLException e) 
        {
            System.out.println("Error al conectar" + e);  
        }
        
        return listado;

    }
    
    public ArrayList<Actividad> loadActividadesDisponibles() {
        
        ArrayList<Actividad> listado = new ArrayList<>();
        try 
        {
            AbrirConexion();
            
            String query = "select * from ACTIVIDADES_HABILITADAS_FILTRADA";
            
            st = con.createStatement();
            rs = st.executeQuery(query);

            while (rs.next()) 
            {
                int id = rs.getInt("id");
                String descripcion = rs.getString("descripcion");
               
                Actividad p = new Actividad (id,descripcion);
                listado.add(p);
            }
            
            CerrarConexion();
        }   
        catch (SQLException e) 
        {
            System.out.println("Error al conectar" + e);  
        }
        
        return listado;

    }
    
    public boolean existePago(int id,int mes,int anio)
{
    ArrayList<PagoCuota> miLista= new ArrayList<>();
    ResultSet rst=null;
    boolean bandera=false;
    
      try {
            AbrirConexion();
            Statement cons=con.createStatement();
            String sql= " SELECT mes,anio FROM PagoCuota where idSocio = "+id+"";
            rst = cons.executeQuery(sql);
            
             while(rst.next()){
               
                
                int mesPago =rst.getInt(1);
                int anioPago =rst.getInt(2);
                      
                PagoCuota c=new PagoCuota(mesPago,anioPago);
                miLista.add(c);
              
            }   
            
        
            
          for (PagoCuota p : miLista) 
          {
              if(p.getMes()==mes && p.getAnio()==anio)
              {
                 bandera=true;
              }
          }
         
          
          
          
        rst.close();
        CerrarConexion();
            
        } catch (SQLException e) {
            System.out.println("error al abrir coneccion" + e);
        }
      
      return bandera;
      
      
}   
    
    
    
    
    public Socio buscarSocio(int idSocio) {

        Socio s = null;

        try {
            AbrirConexion();
            String query = "SELECT * FROM Socio where id = ?" ;
            PreparedStatement pstm = con.prepareStatement(query);
            pstm.setInt(1, idSocio);
            rs = pstm.executeQuery();
            
            if (rs.next()) {
                int id = rs.getInt("id");
                String nombre = rs.getString("nombre");
                String apellido = rs.getString("apellido");
                String dni = rs.getString("dni");
                String direccion = rs.getString("direccion");
                String telefono = rs.getString("telefono");
                String mail = rs.getString("mail");
                int idTipoCuota = rs.getInt("idTipoCuota");

                s = new Socio(id, nombre, apellido, dni, direccion, telefono, mail, idTipoCuota);
               
            }
            
            CerrarConexion();
            
        } catch (SQLException e) {
            System.out.println("Error al conectar" + e);
        

        }
        return s;
    }

    
    public ArrayList getSociosInscriptosFiltroXActividad(int id) {
        
        ArrayList lista=new ArrayList();
        int idActividad;
        int idSocio;
        String apellido;
        String nombre;
        String dni;
        String descripcion;
        String actDes;
        
        
        SocioXActividadDTO s=null;
        try
        { 
          AbrirConexion();
          st=con.createStatement();
          String sql="SELECT TOP (1000) [idActividad],[idSocio],[nombre],[apellido],[dni],[descripcion]\n" +
                        " FROM [Club_Deportivo].[dbo].[SocioXActividad] sa join [Club_Deportivo].[dbo].[Socio] s on sa.idSocio=s.id \n" +
                        " join [Club_Deportivo].[dbo].[Actividad] a on sa.idActividad=a.id\n" +
                        " where [idActividad] =" + id;
          String sql2="select * from socioXActividadVista v where v.idActividad ="+id;
          rs=st.executeQuery(sql);
          while(rs.next())
          { 
                idActividad = rs.getInt("idActividad");
                idSocio = rs.getInt("idSocio");
                nombre = rs.getString("nombre");
                apellido = rs.getString("apellido");
                dni = rs.getString("dni");
                descripcion = rs.getString("descripcion");
                s = new SocioXActividadDTO(idSocio,nombre,apellido,dni,descripcion,idActividad);
                lista.add(s);
          }
        }
        catch(SQLException e)
        { 
            System.out.println("Error en la consulta:" + e.getMessage());
        }
        finally
        { 
            try{ 
                CerrarConexion();
            }
            catch(Exception e)
            { 
                System.out.println("Error en el cierre de la conexion:" + e.getMessage());
            }
        }
        return lista; 
       
    }
    
    
    
    
    
    public ArrayList getSociosInscriptos() {
        
        ArrayList lista=new ArrayList();
        int idActividad;
        int idSocio;
        String apellido;
        String nombre;
        String dni;
        String descripcion;
                
        SocioXActividadDTO s=null;
        try
        { 
          AbrirConexion();
          st=con.createStatement();
          String sql="SELECT TOP (1000) [idActividad],[idSocio],[nombre],[apellido],[dni],[descripcion]\n" +
                        "FROM [Club_Deportivo].[dbo].[SocioXActividad] sa join [Club_Deportivo].[dbo].[Socio] s on sa.idSocio=s.id \n" +
                        "join [Club_Deportivo].[dbo].[Actividad] a on sa.idActividad=a.id";
          rs=st.executeQuery(sql);
          while(rs.next())
          { 
                idActividad = rs.getInt("idActividad");
                idSocio = rs.getInt("idSocio");
                nombre = rs.getString("nombre");
                apellido = rs.getString("apellido");
                dni = rs.getString("dni");
                descripcion = rs.getString("descripcion");
                s = new SocioXActividadDTO(idSocio,nombre,apellido,dni,descripcion,idActividad);
                lista.add(s);
          }
        }
        catch(SQLException e)
        { 
            System.out.println("Error en la consulta:" + e.getMessage());
        }
        finally
        { 
            try{ 
                CerrarConexion();
            }
            catch(Exception e)
            { 
                System.out.println("Error en el cierre de la conexion:" + e.getMessage());
            }
        }
        return lista; 
       
    }
   
    public ArrayList<SocioDTO> getSociosDTO() {
        
        ArrayList<SocioDTO> listado = new ArrayList<>();
        
        try {
            
            SocioDTO s;
            AbrirConexion();
            String query = "SELECT * FROM SociosVistaUno" ;
            PreparedStatement pstm = con.prepareStatement(query);
            rs = pstm.executeQuery();
            
            if (rs.next()) {
                int id = rs.getInt("id");
                String nombre = rs.getString("nombre");
                String apellido = rs.getString("apellido");
                String dni = rs.getString("dni");
                String direccion = rs.getString("direccion");
                String telefono = rs.getString("telefono");
                String mail = rs.getString("mail");
                String tipoCuota = rs.getString("tipoCuota");

                s = new SocioDTO(id, nombre, apellido, dni, direccion, telefono, mail, tipoCuota);
                listado.add(s);
            }
            
            CerrarConexion();
            
        } catch (SQLException e) {
            System.out.println("Error al conectar" + e);
        

        }
       
       return listado;
    }

    public boolean VerificarLogin(Usuario u){
        
        boolean autenticado = false;//incializar vble boolean
        try {
            
            AbrirConexion();
            String query = "SELECT nombreUsuario,contrasenia FROM Usuario WHERE id=?";
            PreparedStatement pstm = con.prepareStatement(query);
            pstm.setString(1,u.getNombreUsuario());
            pstm.setString(2,u.getContrasenia());
            rs = pstm.executeQuery();
            if (rs.next()) {
                
                String nombreUs = rs.getString("nombreUsuario");
                String contras = rs.getString("contrasenia");
                autenticado = true;    
                //faltaria la instancia de Usuario u???
                //Usuario u = new Usuario(nombreUs,contras);
            }
            
           CerrarConexion();

 
        } catch (SQLException e) {
            System.out.println("Error al conectar" + e);
            //autenticado =false;
        } 
        return autenticado;
    } 
    //tipo de cuotas arriba esta el loadTipoCuotas() me trae todas las cuotas
    //metodos
    
    

    public TipoCuota getTipoCuotaPorId(int idC) {
        TipoCuota res = new TipoCuota(-1,"",0);
        try {
           
            String query = "SELECT * FROM TipoCuota WHERE id=?";
            PreparedStatement pstm = con.prepareStatement(query);
            pstm.setInt(1, idC);
            rs = pstm.executeQuery();
            if (rs.next()) {
                int id = rs.getInt("id");
                String nombre = rs.getString("nombre");
                int monto = rs.getInt("monto");
                TipoCuota t = new TipoCuota(id,nombre,monto);
                res = t;
            }
            rs.close();
            pstm.close();
            //con.close();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
            
        } 
        return res;
    }
    
    
    public boolean addTipoCuota(TipoCuota t)
    {
   
        boolean salida=false;
        PreparedStatement pstm=null;
     
        try {
            
            AbrirConexion();
            String sql="";
            sql= "INSERT INTO tipoCuota VALUES (?,?)"; 
            pstm=con.prepareStatement(sql);
            pstm.setString(1, t.getNombre());
            pstm.setInt(2, t.getMonto()); 
            pstm.executeUpdate();
            salida=true;
            
       
           
        CerrarConexion();
            
        } catch (SQLException e) {
            System.out.println("error al abrir conexión" + e);
            salida=false;
        }
  
      return salida;
     
    }
    
    
    public void agregarOmodificarTipoCuota(TipoCuota t){
        try {
            
            
            if (t.getId()==-1) {
                //nuevo tipoCuota
                String query1 = "INSERT INTO tipoCuota VALUES (?,?)";
                PreparedStatement pstm = con.prepareStatement(query1);
                pstm.setString(1,t.getNombre());
                pstm.setInt(2,t.getMonto());
                pstm.executeUpdate();
            }
            else {
               String query2 = "UPDATE TipoCuota SET nombre = ?, monto = ? WHERE id = ?"; 
               PreparedStatement pstm = con.prepareStatement(query2);
               pstm.setString(1,t.getNombre());
               pstm.setInt(1,t.getMonto());
               pstm.executeUpdate();
            }

        } catch (SQLException e) {
            e.printStackTrace(System.out);
           
        } 
           
    }
    public void eliminarTipoCuota(int id){
        
        try {
           
            String query = "DELETE * FROM TipoCuota WHERE id=?";
            PreparedStatement pstm = con.prepareStatement(query);
            pstm.setInt(1,id);
            pstm.executeUpdate();
            pstm.close();

            //con.close();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
            
        } 
        

    }
}
