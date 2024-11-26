/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controladores;

import DAO.ReclamacionDAO;
import Modelo.dto.Reclamacion;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ControladorReclamacion extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Recuperar los parámetros del formulario
        String nombre = request.getParameter("txtNombre");
        String apellido = request.getParameter("txtApellido");
        String correo = request.getParameter("txtEmail");
        String telefono = request.getParameter("txtTelefono");
        String tipoReclamacion = request.getParameter("cboTipoReclamacion");
        String descripcion = request.getParameter("txtDescripcion");

        // Crear un objeto reclamación
        Reclamacion nuevaReclamacion = new Reclamacion();
        nuevaReclamacion.setNombre(nombre);
        nuevaReclamacion.setApellido(apellido);
        nuevaReclamacion.setEmail(correo);
        nuevaReclamacion.setTelefono(telefono);
        nuevaReclamacion.setTipoReclamacion(tipoReclamacion);
        nuevaReclamacion.setDescripcion(descripcion);

        // Instanciar el DAO y llamar al método para insertar la reclamación
        boolean insercionExitosa = false;
        try {
            ReclamacionDAO reclamacionDAO = new ReclamacionDAO();
            insercionExitosa = reclamacionDAO.insertarReclamacion(nuevaReclamacion);
        } catch (Exception e) {
            e.printStackTrace();
            // Manejar la excepción, por ejemplo, redirigir a una página de error
            request.setAttribute("error", "Error al procesar la reclamación.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
            return;
        }

        // Guardar los datos en el request para que estén disponibles en procesar_reclamacion.jsp
        request.setAttribute("nombre", nombre);
        request.setAttribute("apellido", apellido);
        request.setAttribute("correo", correo);
        request.setAttribute("telefono", telefono);
        request.setAttribute("tipoReclamacion", tipoReclamacion);
        request.setAttribute("descripcion", descripcion);

        // Redirigir internamente al JSP deseado, con un atributo para indicar el resultado
        request.setAttribute("insercionExitosa", insercionExitosa);
        request.getRequestDispatcher("procesar_reclamacion.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
