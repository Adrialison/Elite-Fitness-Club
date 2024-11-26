  /*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controladores;

import DAO.LoginDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ControladorLogin extends HttpServlet {

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

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String accion = request.getParameter("accion");

            if (accion == null) {
                request.getRequestDispatcher("index.jsp").forward(request, response);
            } else if (accion.equals("Ingresar")) {
                String correo = request.getParameter("correo");
                String contrasena = request.getParameter("contrasena");

                // Crear instancia del DAO para verificar credenciales
                LoginDAO loginDAO = new LoginDAO();

                // Verificar las credenciales del usuario
                if (loginDAO.verificarCredenciales(correo, contrasena)) {
                    HttpSession session = request.getSession(true);
                
                    session.setAttribute("correo", correo);
                    response.sendRedirect("Tienda.jsp"); // Redirigir solo una vez después de un inicio de sesión exitoso
                } else {
                    // Manejar otras condiciones, como credenciales inválidas
                    request.setAttribute("error", "Correo electrónico o contraseña incorrectos");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                }
            } else if (accion.equals("salir")) {
                HttpSession session = request.getSession(false);
                if (session != null) {
                    session.removeAttribute("correo");
                    session.invalidate();
                }
                response.sendRedirect("index.jsp");
            }
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
