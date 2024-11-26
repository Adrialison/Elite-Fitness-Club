<%-- 
    Document   : Tienda
    Created on : 20 abr. 2024, 16:30:21
    Author     : Adriana
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title> Elite Fitness Club</title>
        <link rel="icon" href="img/Captura1.ico">
        <meta charset="UTF-8">

        <link href="css/videos.css" rel="stylesheet" type="text/css"/>
        <link href="css/submenu_1.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>

        <link href="css/aos.css" rel="stylesheet" type="text/css"/>
        <link href="css/justificado.css" rel="stylesheet" type="text/css"/>
        <link href="css/justificadoHero.css" rel="stylesheet" type="text/css"/>
        <link href="css/estilotienda.css" rel="stylesheet" type="text/css"/>
        <link href="css/estilos.css" rel="stylesheet" type="text/css"/>
        <link href="css/login.css" rel="stylesheet" type="text/css"/>
        <link href="css/carritomenu.css" rel="stylesheet" type="text/css"/>
        <!-- MAIN CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link href="css/tooplate-gymso-style.css" rel="stylesheet" type="text/css"/>
        <link href="css/estilohero.css" rel="stylesheet" type="text/css"/>
        <link href="css/estilopreguntas.css" rel="stylesheet" type="text/css"/>
        <link href="css/cssfooter.css" rel="stylesheet" type="text/css"/>
    </head>
    <body data-spy="scroll" data-target="#navbarNav" data-offset="50">

        <!-- MENU BAR -->
        <%@ include file="./MENUPRINCIPAL/menubar.jsp" %>


        <!-- HERO -->

        <section class="hero d-flex flex-column justify-content-center align-items-center" id="home">
            <div class="container">
                <%@ include file="./MENUPRINCIPAL/Tienda_productos.jsp" %>
            </div>
        </section>

        <!-- NOSOTROS-->
        <%@ include file="./MENUPRINCIPAL/Nosotros.jsp" %>

        <!-- VIDEOS DE NUESTROS PRODUCTOS Y SERVICIOS -->
        <%@ include file="./MENUPRINCIPAL/Videos.jsp" %>

        <!-- CLASS -->
        <%@ include file="./MENUPRINCIPAL/clases.jsp" %>

        <!-- HORARIO-->
        <%@ include file="./MENUPRINCIPAL/horario.jsp" %>

        <!-- CONTACTANOS -->
        <%@ include file="./MENUPRINCIPAL/contactanos.jsp" %>

        <!-- PREGUNTAS FRECUENTES -->
        <%@ include file="./MENUPRINCIPAL/preguntas_frecuentes.jsp" %>


        <!-- FOOTER -->
        <footer class="site-footer">
            <div class="container">
                <div class="row">
                    <div class="ml-auto col-lg-4 col-md-5">
                        <p class="copyright-text">Copyright &copy; 2023  Elite Fitness Club Co.</p>
                    </div>

                    <div class="d-flex justify-content-center mx-auto col-lg-5 col-md-7 col-12">
                        <div class="mr-4">
                            <ul>
                                <i class="fa fa-user mr-1"></i>
                                <a href="#">Panel de Administrador</a>
                            </ul>
                            <ul>
                                <i class="fa fa-user mr-1"></i>
                                <a href="#">EliteFitnessClub@company.com</a>
                            </ul>
                            <ul>
                                <span id="estado-sesion"></span>
                                <a href="#">
                                    <i class="fa fa-sign-in-alt"></i> Iniciar Sesión
                                </a>
                            </ul>
                        </div>

                        <!-- Agrega iconos de redes sociales debajo del número de teléfono -->
                        <div>
                            <p>
                                <i class="fa fa-phone mr-1"></i><span class="phone-number">010-020-0840</span>
                            </p>
                            <ul class="social-icons">
                                <a href="https://www.facebook.com/profile.php?id=61552519238246&mibextid=ZbWKwL" target="_blank"><i class="fab fa-facebook-square"></i></a>
                                <a href="https://www.instagram.com/smartfitgym474" target="_blank"><i class="fab fa-instagram"></i></a>
                                <a href="https://twitter.com/SmartFitGym5509" target="_blank"><i class="fab fa-twitter"></i></a>
                            </ul>

                        </div>
                    </div>
                </div>
            </div>
        </footer>

        <!-- SCRIPTS -->
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/aos.js"></script>
        <script src="js/smoothscroll.js"></script>
        <script src="js/producto1.js" ></script>
        <script src="js/custom.js"></script> 
        
        
        <!--script src="js/iniciarsesion.js"></script-->
        <script src="js/añadircarrito.js" ></script>

    </body>
</html>