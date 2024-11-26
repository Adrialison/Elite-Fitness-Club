<%-- 
    Document   : carrito
    Created on : 2 may. 2024, 20:01:45
    Author     : Adriana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page session="true"%>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Carrito de Compras</title>
        <link rel="icon" href="img/Captura1.ico">
        <link href="css/csscarrito.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%
            if (session.getAttribute("correo") == null) {
                out.println("<a href='login.jsp' class='volver-link'>Debe iniciar sesión</a>");
            } else {
                List<String[]> carrito = (List<String[]>) session.getAttribute("carrito");
                if (carrito == null) {
                    carrito = new ArrayList<>();
                    session.setAttribute("carrito", carrito);
                }

                // Elimina un producto del carrito si se ha enviado un parámetro 'eliminar'
                if (request.getMethod().equalsIgnoreCase("POST") && request.getParameter("eliminar") != null) {
                    String eliminarProducto = request.getParameter("eliminar");
                    List<String[]> nuevoCarrito = new ArrayList<>();

                    for (String[] item : carrito) {
                        // Verificamos si item no es nulo y si item[0] no es nulo antes de comparar
                        if (item != null && item.length > 0 && item[0] != null && !item[0].equals(eliminarProducto)) {
                            nuevoCarrito.add(item); // Agregamos el producto al nuevo carrito si no es el que se debe eliminar
                        }
                    }

                    // Actualizamos la sesión con el nuevo carrito sin el producto eliminado
                    session.setAttribute("carrito", nuevoCarrito);
                    carrito = nuevoCarrito; // Actualizamos también la lista carrito localmente
                }
                  String producto = request.getParameter("producto");
                // Agrega un producto al carrito si se reciben parámetros del formulario
                if (request.getMethod().equalsIgnoreCase("POST") && request.getParameter("producto") != null && request.getParameter("precio") != null && request.getParameter("imagen") != null) {
                //String producto = request.getParameter("producto");
                String precio = request.getParameter("precio");
                String imagen = request.getParameter("imagen");

                // Debugging: Print parameters
                System.out.println("Producto: " + producto);
                System.out.println("Precio: " + precio);
                System.out.println("Imagen: " + imagen);

                String[] item = {producto, precio, imagen};
                carrito.add(item);

                 }
                // Mostrar el total de productos en el carrito
                int totalItems = carrito.size();
                out.println("<div id='totalItems'>" + totalItems + "</div>");
                out.println("<h2>Número de productos: " + totalItems + "</h2>");

                // Mostrar productos en el carrito
                if (!carrito.isEmpty()) {
                    out.println("<table border='1'>");
                    out.println("<tr><th>DESCARTAR</th><th>IMAGEN</th><th>NOMBRE DEL PRODUCTO</th><th>PRECIO</th></tr>");
                    for (String[] itemx : carrito) {
                        out.println("<tr>");
                        out.println("<form method='post'>");
                        out.println("<input type='hidden' name='eliminar' value='" + itemx[0] + "'>");
                        out.println("<td><button type='submit' class='eliminar'>Descartar</button></td>");
                        out.println("</form>");
                        out.println("<td><img src='" + itemx[2] + "' alt='" + itemx[0] + "' width='50'></td>");
                        out.println("<td>" + itemx[0] + "</td>");
                        out.println("<td>" + itemx[1] + "</td>");
                        out.println("</tr>");
                    }
                    out.println("</table>");
                } else {
                    out.println("<p>No hay productos en el carrito.</p>");
                }
            }
        %>
        <br>
    <center><a href="Tienda.jsp" class="volver-link">Volver</a></center>
</body>
</html>

