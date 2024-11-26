<%-- 
    Document   : formulariosugerencia
    Created on : 22 abr. 2024, 18:20:21
    Author     : Adriana
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<br><br>
<br><br>

<form action="./Controlador" method="post">
    <fieldset>
        <legend class="text-white" data-aos="fade-up" data-aos-delay="200"> Formulario de Sugerencias para Mejorar Nuestro Gimnasio </legend> 

        <label for="nombre">Nombre:</label>
        <input type="text" id="nombre" name="nombre" placeholder="Ingrese su nombre" required/>
        <br><br>

        <label for="numero_socio">Número de socio:</label>
        <input type="text" id="numero_socio" name="numero_socio" placeholder="Ingrese su numero" required/>
        <br><br>

        <label for="email">Correo electrónico:</label>
        <input type="email" id="email" name="email" placeholder="Ingrese su email" required/>
        <br><br>

        <label for="tipo_sugerencia">Tipo de Sugerencia:</label>
        <select id="tipo_sugerencia" name="tipo_sugerencia">
            <option value="instalaciones">Mejora en instalaciones</option>
            <option value="clases">Clases y programas</option>
            <option value="equipamiento">Equipamiento</option>
            <option value="horarios">Horarios</option>
            <option value="servicio_cliente">Servicio al cliente</option>
            <option value="otro">Otro</option>
        </select>
        <br><br>
        <legend class="text-white" data-aos="fade-up" data-aos-delay="200"> Detalles de la Sugerencia</legend>
        <label for="descripcion">Descripción de la Sugerencia:</label><br>
        <textarea id="descripcion" name="descripcion" rows="4" cols="50"></textarea><br><br>
        <label for="contacto">¿Te gustaría ser contactado para discutir tu sugerencia en detalle?</label><br>
        <input type="radio" id="si" name="contacto" value="si">
        <label for="si">Sí</label>
        <input type="radio" id="no" name="contacto" value="no">
        <label for="no">No</label><br><br>
        <label for="comentarios">Comentarios Adicionales:</label><br>
        <textarea id="comentarios" name="comentarios" rows="4" cols="50"></textarea>
        <br><br>




        <input type="submit" name="btnEnviar" value="Enviar"/>
    </fieldset>

</form>
