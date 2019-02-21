package Servlet;

import Controller.Gestor;
import Model.Socio;
import Model.TipoCuota;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Lucia
 */
public class AgregarSocio extends HttpServlet {
    

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        Gestor g = new Gestor();
        ArrayList<TipoCuota> cuotas = g.loadTipoCuotas();
        int c = cuotas.size();
        System.out.println("c " + c );
        request.setAttribute("cuotas", cuotas);
        
        request.getRequestDispatcher("agregar-socio.jsp").forward(request, response);
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        Gestor g = new Gestor();
        
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String dni = request.getParameter("dni");
        String direccion = request.getParameter("direccion");
        String telefono = request.getParameter("telefono");
        String mail = request.getParameter("mail");
        int tipoCuota = Integer.parseInt(request.getParameter("tipoCuota"));
        
        Socio s = new Socio(nombre,apellido,dni,direccion,telefono,mail, tipoCuota);
        
        boolean add = g.addSocio(s);
        
        if(add) {
            request.setAttribute("socio", s);
            response.sendRedirect("/Club_Deportivo/AgregarSocio");
        }
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
