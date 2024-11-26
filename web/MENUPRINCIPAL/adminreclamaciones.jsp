<%-- 
    Document   : adminreclamaciones
    Created on : 3 may. 2024, 11:31:26
    Author     : Adriana
--%>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="Modelo.dto.Reclamacion" %>
<%@ page import= "java.sql.SQLException"%>
<%@ page import="Modelo.dto.sugerencia"%>
<%@ page import="DAO.ReclamacionSugerenciaDAO" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Registro de Reclamaciones</title>
        <link rel="icon" href="../img/Captura1.ico">
        <link href="../css/cssadminreclamaciones.css" rel="stylesheet" type="text/css"/>
    </head>
    <body> 
        <div class="container">
            <h2>Registro de Reclamaciones</h2>
            <table border="1">
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Apellido</th>
                    <th>Email</th>
                    <th>Teléfono</th>
                    <th>Tipo de Reclamación</th>
                    <th>Descripción</th>
                    <th>Fecha de Registro</th>
                    <th>Estado de Respuesta</th>
                    <!-- Agrega más encabezados según sea necesario -->
                </tr>

               <% 
ReclamacionSugerenciaDAO dao = new ReclamacionSugerenciaDAO();
List<Reclamacion> reclamaciones = null;
try {
    reclamaciones = dao.obtenerReclamacionesConEstadoRespuesta();
} catch (SQLException ex) {
    ex.printStackTrace(); // Esto imprimirá la traza de la excepción en la consola del servidor
} 
if (reclamaciones == null || reclamaciones.isEmpty()) { %>
    <tr>
        <td colspan="9">No se encontraron reclamaciones con estado de respuesta.</td>
    </tr>
<% } else {
    for (Reclamacion reclamacion : reclamaciones) { %>
        <tr>
            <td><%= reclamacion.getId()%></td>
            <td><%= reclamacion.getNombre()%></td>
            <td><%= reclamacion.getApellido()%></td>
            <td><%= reclamacion.getEmail()%></td>
            <td><%= reclamacion.getTelefono()%></td>
            <td><%= reclamacion.getTipoReclamacion()%></td>
            <td><%= reclamacion.getDescripcion()%></td>
            <td><%= reclamacion.getFechaRegistro()%></td>
            <td><%= reclamacion.getEstadoRespuesta()%></td>
        </tr>
<%  }
} %>
            </table>
            <h2>Registro de Sugerencias</h2>
            <table border="1">
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Número de Socio</th>
                    <th>Email</th>
                    <th>Tipo de Sugerencia</th>
                    <th>Descripción</th>
                    <th>Ser Contactado</th>
                    <th>Comentarios Adicionales</th>
                    <th>Fecha de Registro</th>
                    <!-- Agrega más encabezados según sea necesario -->
                </tr>

                <% List<sugerencia> sugerencias = dao.obtenerSugerencias();
                for (sugerencia sugerencia : sugerencias) { %>
                    <tr>
                        <td><%= sugerencia.getId()%></td>
                        <td><%= sugerencia.getNombre()%></td>
                        <td><%= sugerencia.getNumeroSocio()%></td>
                        <td><%= sugerencia.getEmail()%></td>
                        <td><%= sugerencia.getTipoSugerencia()%></td>
                        <td><%= sugerencia.getDescripcion()%></td>
                        <td><%= sugerencia.isContacto()%></td>
                        <td><%= sugerencia.getComentarios()%></td>
                        <td><%= sugerencia.getFechaRegistro()%></td>
                    </tr>
                <% } %>
            </table>
            <a href="../contenidoadmin.jsp" class="button" onclick="history.go(-1);">Regresar</a>
        </div>
    </body>
</html>