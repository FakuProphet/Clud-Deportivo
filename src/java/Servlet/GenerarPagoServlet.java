/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Controller.Gestor;
import Model.PagoCuota;
import Model.TipoCuota;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Prophet
 */
public class GenerarPagoServlet extends HttpServlet {

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
        
        
        /*PARA VALIDAR QUE EL MISMO SOCIO NO PAGUE, LA MISMA CUOTA
        SE HA VALIDADO PO MEDIO DE LA CREACION DE UNA CLAVE COMPUESTA
        EN LA TABLA*/
        Gestor conexion = new Gestor();
        String mes = request.getParameter("cboMes");
        String anio = request.getParameter("cboAnio");
        String id = request.getParameter("codCliente");
        
        PagoCuota nuevo = new PagoCuota(Integer.parseInt(mes), Integer.parseInt(anio), Integer.parseInt(id));
        boolean bandera = conexion.addPago(nuevo);
        
            if(bandera)
            {
                getServletContext().getRequestDispatcher("/pagoExito.jsp").forward(request, response);
            }
            else
            {
                response.sendRedirect("pagoError.jsp");
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
