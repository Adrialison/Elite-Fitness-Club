<%-- 
    Document   : Admin
    Created on : 2 may. 2024, 17:34:18
    Author     : Adriana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DAO.AdminDAO"%>

<!-- Para llamar a las credenciales. el crud esta en el daoadmin -->
<%
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String usuario = request.getParameter("usuario");
        String contrasena = request.getParameter("contrasena");

        AdminDAO adminDAO = new AdminDAO();
        boolean credencialesCorrectas = adminDAO.verificarCredenciales(usuario, contrasena);

        if (credencialesCorrectas) {
            session.setAttribute("usuario", usuario);
            response.sendRedirect("contenidoadmin.jsp");
        } else {
            out.println("<p class='error'>Credenciales incorrectas. Inténtalo de nuevo.</p>");
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Elite Club Gym</title>
    <link rel="icon" href="img/Captura1.ico">
    
    <link href="css/cssinicioadmin.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="styles.css">
    
</head>
<body>
    <br>
    <br>
    <br>
    <div class="container">
        <header>
            <h1>Bienvenido al Panel de Administrador</h1>
        </header>
            <form method="post" action="">
            <label for="usuario">Usuario:</label>
            <input type="text" id="usuario" name="usuario" required>

            <label for="contrasena">Contraseña:</label>
            <div class="password-container">
                <input type="password" id="contrasena" name="contrasena" required>
                <i id="toggle-icon" class="fas fa-eye" onclick="togglePassword()"></i>
            </div>

            <button type="submit">Iniciar Sesión</button>
        </form>
    </div>
</body>
</html>
<script src="js/inicioadmin.js"></script>

