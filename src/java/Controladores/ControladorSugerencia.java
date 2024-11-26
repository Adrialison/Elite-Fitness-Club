/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controladores;

import DAO.SugerenciaDAO;
import Modelo.dto.sugerencia;
import Modelo.dto.*;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author Adriana
 */
public class ControladorSugerencia extends HttpServlet {

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
        // Recuperar los parámetros del formulario
        String nombre = request.getParameter("nombre");
        String numeroSocio = request.getParameter("numero_socio");
        String email = request.getParameter("email");
        String tipoSugerencia = request.getParameter("tipo_sugerencia");
        String descripcion = request.getParameter("descripcion");
        String contacto = request.getParameter("contacto") != null ? "Sí" : "No";
        String comentarios = request.getParameter("comentarios");

        // Crear un objeto sugerencia
        sugerencia nuevaSugerencia = new sugerencia();
        nuevaSugerencia.setNombre(nombre);
        nuevaSugerencia.setNumeroSocio(numeroSocio);
        nuevaSugerencia.setEmail(email);
        nuevaSugerencia.setTipoSugerencia(tipoSugerencia);
        nuevaSugerencia.setDescripcion(descripcion);
        nuevaSugerencia.setContacto(contacto.equals("Sí")); // Convertir a booleano
        nuevaSugerencia.setComentarios(comentarios);

// Instanciar el DAO y llamar al método para insertar la sugerencia
        boolean insercionExitosa = false;
        try {
            SugerenciaDAO sugerenciaDAO = new SugerenciaDAO();
            insercionExitosa = sugerenciaDAO.insertarSugerencia(nuevaSugerencia);
        } catch (Exception e) {
            e.printStackTrace();
            // Manejar la excepción, por ejemplo, redirigir a una página de error
            request.setAttribute("error", "Error al procesar la sugerencia.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
            return;
        }
// Guardar los datos en el request para que estén disponibles en procesar_sugerencia.jsp
        request.setAttribute("nombre", nombre);
        request.setAttribute("numeroSocio", numeroSocio);
        request.setAttribute("email", email);
        request.setAttribute("tipoSugerencia", tipoSugerencia);
        request.setAttribute("descripcion", descripcion);
        request.setAttribute("contacto", contacto);
        request.setAttribute("comentarios", comentarios);
        
        
     
        // Redirigir internamente al JSP deseado, con un atributo para indicar el resultado
        request.setAttribute("insercionExitosa", insercionExitosa);
        request.getRequestDispatcher("procesar_sugerencia.jsp").forward(request, response);
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
        processRequest(request, response);
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