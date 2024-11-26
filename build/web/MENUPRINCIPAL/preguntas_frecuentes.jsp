<%-- 
    Document   : Preguntas_frecuentes
    Created on : 22 abr. 2024, 18:21:25
    Author     : Adriana
--%>

<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="Modelo.dto.PreguntaFrecuente" %>
<%@ page import="DAO.PreguntaFrecuenteDAO" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Preguntas Frecuentes</title>
    </head>
    <body>

         <%
            // Preguntas y respuestas codificadas manualmente
            List<PreguntaFrecuente> preguntasManuales = new ArrayList<>();
            preguntasManuales.add(new PreguntaFrecuente(1, "Pregunta 1: ¿Qué tipo de productos puedo encontrar en la tienda en línea del gimnasio?",
                    "En nuestra tienda en línea, ofrecemos una amplia variedad de productos relacionados con el fitness y el bienestar. Puedes encontrar desde equipos de ejercicio, como pesas, máquinas cardiovasculares y accesorios de yoga, hasta ropa deportiva de alta calidad, suplementos nutricionales y productos de cuidado personal diseñados para mejorar tu experiencia en el gimnasio. También disponemos de productos de marcas reconocidas para ayudarte a alcanzar tus objetivos de fitness y bienestar."));
            preguntasManuales.add(new PreguntaFrecuente(2, "Pregunta 2: ¿Cuál es la política de devoluciones y garantías de los productos comprados en la tienda en línea?",
                    "Entendemos que la satisfacción del cliente es fundamental. Por lo tanto, ofrecemos una política de devoluciones flexible. Si no estás completamente satisfecho con tu compra, puedes devolver los productos dentro de un período específico (consulta nuestras políticas de devoluciones para conocer los detalles). Además, muchos de nuestros productos están respaldados por garantías del fabricante. Te animamos a leer las descripciones de los productos para obtener información sobre las garantías específicas y los procedimientos de devolución."));
            preguntasManuales.add(new PreguntaFrecuente(3, "Pregunta 3: ¿Cómo puedo obtener asesoramiento sobre qué productos son los más adecuados para mis necesidades personales?",
                    "Nuestro equipo de expertos en fitness está aquí para ayudarte. Puedes comunicarte con nosotros a través de nuestro chat en vivo, correo electrónico o teléfono para recibir asesoramiento personalizado. Para ofrecerte la mejor recomendación, cuéntanos tus objetivos de fitness, nivel de experiencia y cualquier restricción o preferencia que tengas. Estamos comprometidos en ayudarte a elegir los productos que se adapten a tus necesidades y te ayuden a alcanzar tus metas."));

            // Obtener preguntas frecuentes de la base de datos
            PreguntaFrecuenteDAO dao = new PreguntaFrecuenteDAO();
            List<PreguntaFrecuente> preguntasBD = dao.obtenerPreguntasFrecuentes();

            // Combinar preguntas de la base de datos con las manuales
            List<PreguntaFrecuente> preguntasTotales = new ArrayList<>();
            preguntasTotales.addAll(preguntasManuales);
            preguntasTotales.addAll(preguntasBD);
        %>

        <section class="preguntas-frecuentes section" id="preguntas">
            <div class="container">
                <h2 class="mb-4">Preguntas Frecuentes</h2>
                <div class="row">
                    <% for (PreguntaFrecuente pregunta : preguntasTotales) {%>
                    <div class="col-md-6">
                        <div class="pregunta">
                            <h2><%= pregunta.getPregunta()%></h2>
                            <div class="respuesta">
                                <br>
                                <p><%= pregunta.getRespuesta()%></p>
                            </div>
                        </div>
                    </div>
                    <% }%>
                </div>
            </div>
        </section>
        <script src="js/preguntas.js" ></script>
    </body>
</html>