<%-- 
    Document   : login
    Created on : 2 may. 2024, 17:03:05
    Author     : Adriana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DAO.LoginDAO"%>
<%@page session="true"%>

<!DOCTYPE html>

<html lang="es">
<head>
    <!--link href="css/csslogin.css" rel="stylesheet" type="text/css"/-->
    
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Iniciar Sesión</title>
     <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
     <link href="css/cssloginactualizado.css" rel="stylesheet" type="text/css"/>
    <link rel="icon" href="img/Captura1.ico">
</head>
<body>
<%
    // Verificar si se ha enviado el formulario
    if (request.getMethod().equalsIgnoreCase("post")) {
        String correo = request.getParameter("correo");
        String contrasena = request.getParameter("contrasena");

        // Crear instancia del DAO para verificar credenciales
        LoginDAO loginDAO = new LoginDAO();
        
        // Verificar las credenciales del usuario
        if (loginDAO.verificarCredenciales(correo, contrasena)) {
            // Si las credenciales son válidas, redireccionar a la página principal
             session.setAttribute("usuarioAutenticado", true);
              System.out.println("edvsvsfserror");
            response.sendRedirect("index.jsp");
            // Establecer una sesión para indicar que el usuario está autenticado
          
          
        } else {
            // Si las credenciales no son válidas, mostrar un mensaje de error
            request.setAttribute("error", "Correo electrónico o contraseña incorrectos");
        }
    }
%>
<% if (request.getAttribute("error") != null && !((String) request.getAttribute("error")).isEmpty()) { %>
    <p style="color: red;"><%= request.getAttribute("error") %></p>
<% } %>

  <div class="wrapper">
        <h2>Login</h2>
        <form  action="ControladorLogin" method="post" >
            <div class="input-field">
                <input type="email" id="correo" name="correo" placeholder="Correo electrónico" required>
                <i class='bx bxs-user'></i>
            </div>
            <div class="input-field">
                <input type="password" id="contrasena" name="contrasena" placeholder="Contraseña" required>
                <i class='bx bxs-lock-alt'></i>
            </div>
            <div class="forgot">
                <p><a href="#">¿Olvidaste tu contraseña?</a></p>
            </div>
            <button type="submit"  name="accion" value="Ingresar" class="login">Iniciar Sesión</button>
            <p>¿No tienes una cuenta? <a href="registro.jsp" class="sign-up">Regístrate aquí</a>.</p>
        </form>
    </div>
    <script src="js/añadircarrito.js"></script>
</body>
</html>