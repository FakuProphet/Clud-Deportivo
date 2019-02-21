/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Controller.Gestor;
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
public class AltaTipoCuotaServlet extends HttpServlet {

   
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        String nombre = request.getParameter("nombre");
        String monto = request.getParameter("monto");
       
      
        
        TipoCuota nuevo = new TipoCuota(nombre, Integer.parseInt(monto));
        
        Gestor conexion = new Gestor();
        
        boolean bandera = conexion.addTipoCuota(nuevo);
        
        if(bandera)
        {
            getServletContext().getRequestDispatcher("/registroExito.jsp").forward(request, response);
        }
        else
        {
            response.sendRedirect("/registroError.jsp");
        }
        
        
        
    }

   
    

}
