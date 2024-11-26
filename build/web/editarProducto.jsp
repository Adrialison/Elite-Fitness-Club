<%-- 
    Document   : editarProducto
    Created on : 16 may. 2024, 16:38:28
    Author     : Adriana
--%>
<%@ page import="Modelo.dto.Producto" %>
<%@ page import="DAO.ProductoDAO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
     <link rel="icon" href="${pageContext.request.contextPath}/img/Captura1.ico">
    <title>Editar Producto</title>
    <link href="css/cssformularioproductos.css" rel="stylesheet" type="text/css"/>
      <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    
    <script>
        $(document).ready(function() { //es una función de jQuery que se ejecuta cuando el DOM está completamente cargado y listo. 
            // Manejar el envío del formulario mediante AJAX
            $('#formActualizarProducto').submit(function(event) {
         //selecciona el formulario con el id formActualizarProducto y 
         //se adjunta un controlador de eventos para el evento submit del formulario.
                // Detener el envío del formulario estándar
                event.preventDefault();
        //detiene el comportamiento predeterminado del formulario, que sería enviar el formulario y recargar la página.        
                // Serializar los datos del formulario
                var formData = $(this).serialize();
           //se refiere al formulario que desencadenó el evento.   
           //serialize() convierte los datos del formulario en una cadena de texto en formato URL-encoded, 
           //   
           //         
                // Enviar la solicitud AJAX
                $.ajax({
                    type: 'POST',
                    url: '${pageContext.request.contextPath}/ControladorProducto=Actualizar',
                    data: formData, //Los datos que se enviarán en la solicitud. Aquí se envían los datos serializados del formulario.
                    success: function(response) {
                        // Manejar la respuesta del servidor
                        if (response === 'success') {
                            // Mostrar mensaje de éxito
                            $('#mensaje').text('Producto actualizado correctamente.');
                        } else {
                            // Mostrar mensaje de error
                            $('#mensaje').text('Hubo un error al actualizar el producto.');
                        }
                    },
                    error: function() {
                        // Manejar errores de la solicitud AJAX
                        $('#mensaje').text('Error de conexión. Inténtalo de nuevo más tarde.');
                    }
                });
            });
        });
    </script>
</head>
<body>
 <h2>Editar Producto</h2>
    <c:if test="${not empty mensaje}">
        <div>${mensaje}</div>
    </c:if>
    <form id="formActualizarProducto" action="${pageContext.request.contextPath}/ControladorProducto"  method="post">
        <input type="hidden" name="accion" value="actualizar">
        <input type="hidden" name="codigo" value="${producto.codigo}"/>
        Nombre: <input type="text" name="nombre" value="${producto.nombre}"/><br/>
        Descripción: <input type="text" name="descripcion" value="${producto.descripcion}"/><br/>
        Precio: <input type="text" name="precio" value="${producto.precio}"/><br/>
        Foto: <input type="text" name="foto" value="${producto.foto}"/><br/>
        Certificado: <input type="text" name="certificado" value="${producto.certificado}"/><br/>
        Fecha: <input type="text" name="fecha" value="${producto.fecha}"/><br/>
        <input type="submit" value="Actualizar"/>
    </form>
    
<a href="${pageContext.request.contextPath}/MENUPRINCIPAL/formularioProductos.jsp" class="button">Regresar</a>

</body>
</html>