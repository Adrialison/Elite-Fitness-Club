<%-- 
    Document   : procesar_reclamacion
    Created on : 22 abr. 2024, 18:41:04
    Author     : Adriana
--%>



<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="icon" href="img/Captura1.ico">
<link href="css/cssprocesar_reclama.css" rel="stylesheet" type="text/css"/>
<!DOCTYPE html>
<html>
    <head>
        <title>Procesamiento de Reclamación</title>
    </head>
    <body>

        <h2>Resumen de la Reclamación</h2>
        <hr size="20px" color="#F43C14" />

       

        <p><strong>Nombre:</strong> ${nombre}</p>
        <p><strong>Apellido:</strong> ${apellido}</p>
        <p><strong>Correo Electrónico:</strong> ${ correo}</p>
        <p><strong>Teléfono:</strong> ${telefono}</p>
        <p><strong>Tipo de Reclamación:</strong> ${tipoReclamacion}</p>
        <p><strong>Descripción de la Reclamación:</strong></p>
        
        <p>${descripcion}</p>
        
        <% if (request.getAttribute("insercionExitosa") != null && (boolean) request.getAttribute("insercionExitosa")) { %>
        <p>Reclamacion guardada exitosamente.</p>
        <% } else { %>
        <p>Error al guardar la reclamacion.</p>
        <% }%>
        <br>
        <a href="index.jsp">Volver</a>
    </body>
</html>