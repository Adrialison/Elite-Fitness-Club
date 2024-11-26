<%-- 
    Document   : procesar_respuesta
    Created on : 3 may. 2024, 13:09:01
    Author     : Adriana
--%>

<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="servicios.conexiones.ConexionBD" %>
<%@ page import="org.json.JSONObject" %>

<%
// Variable para almacenar el mensaje
String message = "";
boolean success = false; // Nuevo

if ("POST".equalsIgnoreCase(request.getMethod())) {
    Connection cnx = null;
    PreparedStatement ps = null;
    int rowsAffected = 0; // Nuevo

    try {
        // Recuperar datos del formulario
        String id_reclamacion = request.getParameter("id_reclamacion");
        String respuesta_texto = request.getParameter("respuesta");
        String estado = request.getParameter("estado");

        // Insertar en la tabla de respuestas
        cnx = new ConexionBD().getConexion();
        String insert_query = "INSERT INTO respuesta (id_reclamacion, respuesta_texto, estado) VALUES (?, ?, ?)";
        ps = cnx.prepareStatement(insert_query);
        ps.setString(1, id_reclamacion);
        ps.setString(2, respuesta_texto);
        ps.setString(3, estado);
        rowsAffected = ps.executeUpdate(); // Nuevo

        if (rowsAffected > 0) {
            // Asignar el mensaje de éxito
            message = "Respuesta enviada con éxito.";
            success = true; // Nuevo
        } else {
            // Asignar el mensaje de error
            message = "Error al enviar la respuesta.";
        }
    } catch (SQLException ex) {
        message = "Error al procesar la solicitud: " + ex.getMessage();
    } finally {
        try {
            if (ps != null) {
                ps.close();
            }
            if (cnx != null) {
                cnx.close();
            }
        } catch (SQLException ex) {
            message = "Error al cerrar la conexión: " + ex.getMessage();
        }
    }
} else {
    message = "Acceso no permitido.";
}

// Crear un objeto JSON con el mensaje de respuesta
JSONObject jsonResponse = new JSONObject();
jsonResponse.put("success", success); // Modificado
jsonResponse.put("message", message);

// Devolver el objeto JSON como respuesta
response.setContentType("application/json");
response.setCharacterEncoding("UTF-8");
response.getWriter().write(jsonResponse.toString());
%>
