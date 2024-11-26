<%-- 
    Document   : procesar_sugerencia
    Created on : 22 abr. 2024, 18:29:11
    Author     : Adriana
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Procesamiento de Sugerencia - Smart Fit Gym</title>
    <link rel="icon" href="img/Captura1.ico">
    <link href="css/cssprocesar_reclama.css" rel="stylesheet" type="text/css"/>
</head>
<body>
    <h1>Procesamiento de Sugerencia</h1>
    <hr size="20px" color="#F43C14" />
    
   
    
    <p><strong>Nombre:</strong> ${nombre}</p>
    <p><strong>Número de Socio:</strong> ${numeroSocio}</p>
    <p><strong>Correo Electrónico:</strong> ${email}</p>
    <p><strong>Tipo de Sugerencia:</strong> ${tipoSugerencia}</p>
    <p><strong>Descripción de la Sugerencia:</strong> ${descripcion}</p>
    <p><strong>Desea ser contactado:</strong> ${contacto}</p>
    <p><strong>Comentarios Adicionales:</strong> ${comentarios}</p>
    
   

    <% if (request.getAttribute("insercionExitosa") != null && (boolean)request.getAttribute("insercionExitosa")) { %>
        <p>Sugerencia guardada exitosamente.</p>
    <% } else { %>
        <p>Error al guardar la sugerencia.</p>
    <% } %>

    <a href="index.jsp">Volver</a>
</body>
</html>