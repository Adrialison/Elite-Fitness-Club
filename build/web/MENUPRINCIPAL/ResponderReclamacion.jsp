<%-- 
    Document   : ResponderReclamacion
    Created on : 3 may. 2024, 12:44:43
    Author     : Adriana
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="Modelo.dto.Reclamacion"%>
<%@ page import="DAO.ReclamacionDAO"%>
<%@ page import="java.sql.SQLException" %>
<%@ page import="servicios.conexiones.ConexionBD"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Responder Reclamación</title>
        <link rel="icon" href="../img/Captura1.ico">
        <link href="../css/cssResponderReclamacion.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    </head>
    <body>
        <br><br>
        <form id="respuestaForm">
            <h2>Responder Reclamación</h2>
            <label for="id_reclamacion"><strong>Seleccione la reclamación:</strong></label>
            <select name="id_reclamacion" required>
                <%
                    ReclamacionDAO reclamacionDAO = new ReclamacionDAO();
                    try {
                        List<Reclamacion> reclamaciones = reclamacionDAO.obtenerReclamacionesSinRespuesta();
                        for (Reclamacion reclamacion : reclamaciones) {
                            out.println("<option value='" + reclamacion.getId() + "'>"
                                    + reclamacion.getNombre() + " - "
                                    + reclamacion.getTipoReclamacion() + " - "
                                    + reclamacion.getDescripcion() + "</option>");
                        }
                    } catch (SQLException ex) {
                        out.println("Error al conectar a la base de datos: " + ex.getMessage());
                    }
                %>
            </select>
            <br><br>

            <label for="respuesta"><strong>Respuesta:</strong></label>
            <textarea name="respuesta" required></textarea>

            <label for="estado"><strong>Estado:</strong></label>
            <select name="estado" required>
                <option value="Reclamo Pendiente">Reclamo Pendiente</option>
                <option value="Reclamo Atendido">Reclamo Atendido</option>
            </select>
            <br>
            <br>
            <center><button type="button" onclick="enviarRespuesta()">Enviar Respuesta</button> </center>
        </form>

    <center><button class="regresar-btn" onclick="window.location.href = '../contenidoadmin.jsp'">Regresar</button></center>

    <!-- Div para mostrar el mensaje de respuesta -->
    <div id="mensajeRespuesta" class="respuesta-mensaje"></div>

    <!-- Script para enviar la respuesta del formulario de manera asíncrona -->
    <script>
        function enviarRespuesta() {
            var formData = $('#respuestaForm').serialize(); // Obtener datos del formulario

            // Enviar la respuesta de manera asíncrona
            $.ajax({
                type: 'POST',
                url: 'procesar_respuesta.jsp',
                data: formData,
                success: function (response) {
                    console.log(response); // Verifica la respuesta del servidor en la consola

                    // Mostrar mensaje emergente
                    Swal.fire({
                        icon: response.success ? 'success' : 'error',
                        title: response.message,
                        showConfirmButton: false,
                        timer: 1500 // Tiempo en milisegundos antes de que se cierre automáticamente
                    });

                    // Actualizar la página después de un tiempo (opcional)
                    setTimeout(function () {
                        location.reload();
                    }, 2000); // 2000 milisegundos (2 segundos)
                },
                error: function () {
                    Swal.fire({
                        icon: 'error',
                        title: 'Error',
                        text: 'Hubo un problema al enviar la respuesta.'
                    });
                }
            });
        }
    </script>
</body>
</html>