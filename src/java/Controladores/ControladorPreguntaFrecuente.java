/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controladores;

import DAO.PreguntaFrecuenteDAO;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class ControladorPreguntaFrecuente extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private PreguntaFrecuenteDAO preguntaFrecuenteDAO = new PreguntaFrecuenteDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    String action = request.getParameter("action");
    if ("delete".equals(action)) {
        String idStr = request.getParameter("id");
        if (idStr != null && !idStr.isEmpty()) {
            int id = Integer.parseInt(idStr);
            boolean isDeleted = preguntaFrecuenteDAO.eliminarPreguntaFrecuente(id);
            response.setContentType("application/json");
            PrintWriter out = response.getWriter();
            if (isDeleted) {
                out.write("{\"success\":true}");
            } else {
                out.write("{\"success\":false}");
            }
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID is missing or empty");
        }
    }
}

}