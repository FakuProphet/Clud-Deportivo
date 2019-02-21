/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Controller.Gestor;
import Model.Actividad;
import Model.Socio;
import Model.SocioXActividad;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Prophet
 */
public class cargarDatosServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        int id = Integer.parseInt( request.getParameter("id"));
        /*Cargamos en un arraylist en el contenedor le indicamos que es del tipo de l clase*/
        Gestor g = new Gestor();
        ArrayList<Actividad> lista = g.loadActividadesDisponibles();
        Socio socio = g.getSocio(id);
        
        request.setAttribute("listaActividades", lista); 
        request.setAttribute("idSocio", id);
        request.setAttribute("miSocio",socio);
        request.getRequestDispatcher("inscribirSocio.jsp").forward(request, response);
        
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        Gestor g = new Gestor();    
        String idActividad = request.getParameter("cboActividad");
        String idSocio = request.getParameter("codSocio");
        SocioXActividad sxa = new SocioXActividad(Integer.parseInt(idActividad),Integer.parseInt(idSocio));
              
        boolean add = g.inscribirSocio(sxa);
        
        
            if(add)
            {
                getServletContext().getRequestDispatcher("/inscripcionExito.jsp").forward(request, response);
            }
            else
            {
                response.sendRedirect("inscripcionError.jsp");
            }  
        
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
