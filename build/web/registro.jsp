<%-- 
    Document   : registro
    Created on : 2 may. 2024, 17:13:52
    Author     : Adriana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="DAO.UsuarioDAO" %>
<%@ page import="java.sql.SQLException" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <link href="css/cssloginactualizado.css" rel="stylesheet" type="text/css"/>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <title>Registro</title>
    <link rel="icon" href="img/Captura1.ico">
    <style>
        /* Estilos para el pop-up */
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgb(0,0,0);
            background-color: rgba(0,0,0,0.4);
            padding-top: 60px;
        }

        .modal-content {
            background-color: #fefefe;
            margin: 5% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
        }
    </style>
</head>
<body>

<div id="myModal" class="modal">
    <div class="modal-content">
        <p>Registro exitoso. Bienvenido</p>
    </div>
</div>

<%
    // Obtener los parámetros del formulario
    String nombre = request.getParameter("nombre");
    String correo = request.getParameter("correo");
    String contrasena = request.getParameter("contrasena");

    // Crear una instancia del DAO
    UsuarioDAO usuarioDAO = new UsuarioDAO();

    // Insertar el usuario en la base de datos
    try {
        usuarioDAO.insertarUsuario(nombre, correo, contrasena);
%>
    <script>
        // Mostrar el mensaje de registro exitoso
        document.getElementById("myModal").style.display = "block";

        // Redirigir al usuario después de 1 segundo
        setTimeout(function() {
            window.location.href = 'login.jsp'; // Redirige a la página de login después de 1 segundo
        }, 1000); // Redirige después de 1 segundo
    </script>
<%
    } catch (SQLException e) {
        // Manejar cualquier excepción
        e.printStackTrace();
        // También podrías mostrar un mensaje de error en caso de falla
    }
%>

  <div class="wrapper">
        <h2>Registro</h2>
        <form method="post" action="registro.jsp">
            <div class="input-field">
                <input type="text" id="nombre" name="nombre" placeholder="Nombre" required>
                <i class='bx bxs-user'></i>
            </div>
            <div class="input-field">
                <input type="email" id="correo" name="correo" placeholder="Correo electrónico" required>
                <i class='bx bxs-envelope'></i>
            </div>
            <div class="input-field">
                <input type="password" id="contrasena" name="contrasena" placeholder="Contraseña" required>
                <i class='bx bxs-lock-alt'></i>
            </div>
            <button type="submit" class="login">Registrarse</button>
            <p>¿Ya tienes una cuenta? <a href="login.jsp" class="sign-up">Inicia sesión aquí</a>.</p>
        </form>
    </div>

</body>
</html>