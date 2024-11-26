<%-- 
    Document   : formularioreclamacion
    Created on : 22 abr. 2024, 18:19:52
    Author     : Adriana
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<br><br>
<br><br>
<center><h2 class="text-white" data-aos="fade-up" data-aos-delay="200"> Libro de Reclamaciones</h2></center>
<br><br>
<form class ="formulario" action="./ControladorReclamacion" method="post" > 
    <fieldset>
       
        <legend class="text-white" data-aos="fade-up" data-aos-delay="200"> Información Personal</legend>
        <label>Nombre</label>


        <input type="text" id="Nombre" name="txtNombre" placeholder="Ingrese su nombre" required/>
        <br><br>
        <label>Apellido</label>
        <input type="text" id="Apellido" name="txtApellido" placeholder="Ingrese su apellido" required/>


        <br><br>
        <label>Correo Electrónico</label>
        <input type="email" id="Correo" name="txtEmail" placeholder="Ingrese su correo electrónico" required/>
        <br><br>


        <label>Teléfono</label>
        <input type="tel"  id="Telefono" name="txtTelefono" placeholder="Ingrese su número de teléfono" maxlength="5" required/>
    </fieldset>
    <br>


    <fieldset>



        <legend class="text-white" data-aos="fade-up" data-aos-delay="200"> Detalles de la Reclamación</legend>
        <label>Tipo de Reclamación</label>
        <select id="Tipo_Reclamacion" name="cboTipoReclamacion">
            <option value="Servicio">Servicio</option>
            <option value="Producto">Producto</option>
            <option value="Facturación">Facturación</option>
            <option value="Otro">Otro</option>
        </select>


        <br><br>
        <label>Descripción de la Reclamación</label>
        <textarea  id="descripcion" name="txtDescripcion" rows="5" cols="62"  wrap required></textarea>


       

    </fieldset>


    <br>
    <center> <input type="submit" name="btnEnviar" value="Enviar Reclamación" /></center>

</form>

<br><br>
