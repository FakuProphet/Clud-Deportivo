/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Controller.Gestor;
import Model.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Lucia
 */
public class Login extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         PrintWriter out=response.getWriter();
            out.print("Sorry, no tiene acceso a esta seccion !");
        
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
               
                
		String name=request.getParameter("nombreUsuario");
		String password=request.getParameter("contrasenia");
		Gestor g = new Gestor();
                
                boolean validar = g.checkUser(name, password);
                
                        if(validar)
                        {   
                            HttpSession session=request.getSession();
                            session.setAttribute("name",name);
                            request.getRequestDispatcher("/administrador.jsp").include(request, response);                  
                        }
                        else
                        {
                            request.getRequestDispatcher("/errorLogin.html").include(request, response);
                        }    
      
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */


}
