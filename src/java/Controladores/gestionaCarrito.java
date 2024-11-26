/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controladores;

import java.io.IOException;
import java.io.PrintWriter;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Adriana
 */
@WebServlet(name = "gestionaCarrito", urlPatterns = {"/gestionaCarrito"})
public class gestionaCarrito extends HttpServlet {

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
      PrintWriter out = response.getWriter();
        HttpSession session = request.getSession(true);
        if (session.getAttribute("correo") == null) {
            out.println("<a href='login.jsp' class='volver-link'>Debe iniciar sesión</a>");
        } else {
            List<String[]> carrito = (List<String[]>) session.getAttribute("carrito");
            if (carrito == null) {
                carrito = new ArrayList<>();
                session.setAttribute("carrito", carrito);
            }

            // Elimina un producto del carrito si se ha enviado un parámetro 'eliminar'
            if (request.getMethod().equalsIgnoreCase("POST") && request.getParameter("eliminar") != null) {
                String eliminarProducto = request.getParameter("eliminar");
                List<String[]> nuevoCarrito = new ArrayList<>();

                for (String[] item : carrito) {
                    // Verificamos si item no es nulo y si item[0] no es nulo antes de comparar
                    if (item != null && item.length > 0 && item[0] != null && !item[0].equals(eliminarProducto)) {
                        nuevoCarrito.add(item); // Agregamos el producto al nuevo carrito si no es el que se debe eliminar
                    }
                }

                // Actualizamos la sesión con el nuevo carrito sin el producto eliminado
                session.setAttribute("carrito", nuevoCarrito);
                carrito = nuevoCarrito; // Actualizamos también la lista carrito localmente
            }

            // Agrega un producto al carrito si se reciben parámetros del formulario
            if (request.getMethod().equalsIgnoreCase("POST") && request.getParameter("producto") != null && request.getParameter("precio") != null && request.getParameter("imagen") != null) {
                String producto = request.getParameter("producto");
                String precio = request.getParameter("precio");
                String imagen = request.getParameter("imagen");

                // Debugging: Print parameters
                System.out.println("Producto: " + producto);
                System.out.println("Precio: " + precio);
                System.out.println("Imagen: " + imagen);

                String[] item = {producto, precio, imagen};
                carrito.add(item);

            }
            // Mostrar el total de productos en el carrito
            int totalItems = carrito.size();
            out.println("<div id='totalItems'>" + totalItems + "</div>");
            out.println("<h2>Número de productos: " + totalItems + "</h2>");

            // Mostrar productos en el carrito
            if (!carrito.isEmpty()) {
                out.println("<table border='1'>");
                out.println("<tr><th>DESCARTAR</th><th>IMAGEN</th><th>NOMBRE DEL PRODUCTO</th><th>PRECIO</th></tr>");
                for (String[] itemx : carrito) {
                    out.println("<tr>");
                    out.println("<form method='post'>");
                    out.println("<input type='hidden' name='eliminar' value='" + itemx[0] + "'>");
                    out.println("<td><button type='submit' class='eliminar'>Descartar</button></td>");
                    out.println("</form>");
                    out.println("<td><img src='" + itemx[2] + "' alt='" + itemx[0] + "' width='50'></td>");
                    out.println("<td>" + itemx[0] + "</td>");
                    out.println("<td>" + itemx[1] + "</td>");
                    out.println("</tr>");
                }
                out.println("</table>");
            } else {
                out.println("<p>No hay productos en el carrito.</p>");
            }
        }

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
