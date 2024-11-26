<%-- 
    Document   : formularioProductos
    Created on : 3 may. 2024, 11:22:50
    Author     : Adriana
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <link rel="icon" href="${pageContext.request.contextPath}/img/Captura1.ico">
        <title>Agregar Producto</title>
        <link href="${pageContext.request.contextPath}/css/cssformularioproductos.css" rel="stylesheet" type="text/css"/>
        
    </head>
    <body>
        <h1>Agregar Nuevo Producto</h1>
        <form  id="formAgregarProducto" action="${pageContext.request.contextPath}/ControladorProducto?accion=Guardar" method="post" enctype="multipart/form-data">
            <label for="nombre">Nombre del Producto:</label>
            <input type="text" id="nombre" name="nombre" required><br>
            <label for="descripcion">Descripción:</label>
            <textarea id="descripcion" name="descripcion" rows="4" cols="50" required></textarea><br>
            <label for="precio">Precio:</label>
            <input type="number" id="precio" name="precio" min="0" step="0.01" required><br>
            <label for="imagen">Imagen del Producto:</label>
            <input type="file" id="imagen" name="imagen" accept="image/*" required><br>
            <label for="certificado">Certificado:</label>
            <input type="text" id="certificado" name="certificado"><br>
            <label for="fecha">Fecha:</label>
            <input type="date" id="fecha" name="fecha"><br>
            <button type="submit">Agregar Producto</button>
        </form>

      <script>
$(document).ready(function() {
    $('#formAgregarProducto').submit(function(event) {
        event.preventDefault(); // Evita el envío normal del formulario

        // Serialize el formulario para obtener los datos
        var formData = new FormData(this);

        // Envío AJAX usando jQuery
        $.ajax({
            type: 'POST',
            url: $(this).attr('action'),
            data: formData,
            processData: false,
            contentType: false,
            success: function(response) {
                 // Manejar la respuesta del servidor
                console.log(response); // Verificar la respuesta en la consola
                // Manejar la respuesta del servidor
                alert('Producto agregado exitosamente');
                $('#productosTable').DataTable().ajax.reload(); // Recargar tabla de productos
                $('#formAgregarProducto')[0].reset(); // Limpiar el formulario después de agregar
            },
            error: function() {
                alert('Error al agregar el producto');
            }
        });
    });
});
</script>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>


        <br>
      <!-- Incluir el contenido de ListarProductos.jsp aquí -->
    <jsp:include page="ListarProductos.jsp" />
        <!--a href="./contenidoadmin.jsp" class="button" onclick="history.go(-1);">Regresar</a-->
        <a href="${pageContext.request.contextPath}/contenidoadmin.jsp" class="button" onclick="history.go(-1);">Regresar</a>

        <br>
    </body>
</html>
