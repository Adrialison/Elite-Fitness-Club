<%-- 
    Document   : menubar
    Created on : 20 abr. 2024, 16:36:52
    Author     : Adriana
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>



<nav class="navbar navbar-expand-lg fixed-top">
    <div class="container">

        <a class="navbar-brand" href="index.jsp"> Elite Fitness Club</a>

        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false"
                aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-lg-auto">
                <li class="nav-item">
                    <a href="index.jsp" class="nav-link smoothScroll">Home</a>
                </li>

                <li class="nav-item">
                    <a href="#about" class="nav-link smoothScroll">Nosotros</a>
                    <ul class="submenu">
                        <li> <a href="#videos" class="nav-link smoothScroll" >Videos</a></li>
                        <li> <a href="#preguntas" class="nav-link smoothScroll" >Preguntas Frecuentes</a></li>
                    </ul>
                </li>

                <li class="nav-item">
                    <a href="Tienda.jsp" class="nav-link smoothScroll">Tienda</a>

                </li>

                <li class="nav-item">
                    <a href="#class" class="nav-link smoothScroll">Clases</a>
                    <ul class="submenu">
                        <li><a href="#schedule" class="nav-link smoothScroll">Horario</a></li>
                    </ul>         
                </li>

                <li class="nav-item">
                    <a href="#contact" class="nav-link smoothScroll">Contacto</a>
                    <ul class="submenu">
                        <li><a href="libroreclamaciones.jsp" class="nav-link smoothScroll">Libro de <br>Reclamaciones</a></li>
                        <li><a href="librosugerencias.jsp" class="nav-link smoothScroll">Sugerencias</a></li>
                    </ul>
                </li> 




                <li class="nav-item">
                    <a href="carrito.jsp" class="nav-link smoothScroll">Carrito  
                        <i class="fas fa-shopping-cart"></i> 
                        <span id="totalItemsCarrito">

                        </span>

                    </a>

                </li>


            </ul>


            <ul class = "social-icon ml-lg-3">

                <li><a href = "https://www.facebook.com/profile.php?id=61552519238246&mibextid=ZbWKwL" class = "fab fa-facebook"></a></li>
                <li><a href = "https://twitter.com/SmartFitGym5509" class = "fab fa-twitter"></a></li>
                <li><a href = "https://www.instagram.com/smartfitgym474" class = "fab fa-instagram"></a></li>
                <li class="nav-item">
                    <span id="estado-sesion"></span>
                    <a href="ControladorLogin?accion=salir" id="enlace-cerrar-sesion" > <i class="fa fa-sign-out-alt"></i></a>

                </li>
            </ul>
        </div>


     



    </div>
</nav>
