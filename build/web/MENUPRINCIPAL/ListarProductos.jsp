<%-- 
    Document   : ListarProductos
    Created on : 7 jul. 2024, 19:57:55
    Author     : Adriana
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <link rel="icon" href="../img/Captura1.ico">
        <title>Lista de Productos</title>
        <link href="../css/ListarProductos.css" rel="stylesheet" type="text/css"/>
      
        <!-- Font Awesome CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"/>
        <!-- Incluir estilos y scripts necesarios -->
        <!-- DataTables CSS -->
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.css">
        <!-- jQuery -->
        <script type="text/javascript" charset="utf8" src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <!-- DataTables JS -->
        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.js"></script>
    </head>
    <body>
    <center>  <h2>Lista de Productos</h2></center>  

    <table id="productosTable" class="display">
        <thead>

            <tr>
                <th>Id</th>
                <th>Nombre</th>
                <th>Descripción</th>
                <th>Precio</th>
                <th>Imagen</th>
                <th>Certificado</th>
                <th>Fecha</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody></tbody>
    </table>

    <script>
        $(document).ready(function () {
            //dentro de esta función se ejecutará cuando el documento HTML esté completamente cargado 
            //y listo para manipularse.
            $('#productosTable').DataTable({//se inicializa la DataTable
                
         //Cuando la página se carga, DataTables envía una solicitud AJAX a esta URL.
                ajax: {//configuración para obtener los datos de la tabla de forma asíncrona a través de 
                    //una solicitud AJAX.

                    //Especifica:
                    url: '${pageContext.request.contextPath}/ControladorProducto?accion=Listar',
                    //servlet responde con una lista de productos en formato JSON,
                    dataSrc: '' // indica que los datos están en la raíz del objeto JSON  
                            // dataSrc indica la ubicacion en la respuesta Json donde se encuentran los datos que se deben mostrar en la tabla
                },
          //Definición de Columnas
                  //especifica el nombre del atributo en el objeto JSON que contiene los datos
                columns: [//especifica colummnas de la tabla
                    {"data": "codigo"}, //esa columna
                    {"data": "nombre"},
                    {"data": "descripcion"},
                    {"data": "precio"},
                    {
          //Para la columna de la imagen
         
                        "data": "foto",
                        "render": function (data) {//renderizar para mostrar la imagen correctamente:
                            //en render hace que se muestre imágenes o enlaces, o sea lo que hace es personalizar el contenido de la tabla               
                            return '<img src="' + data + '" width="100" height="100"/>';
                            //
                        }
                    },
                    {"data": "certificado"},
                    {"data": "fecha"},
                    {
           //Ultima colummna
            //definen botones para editar y eliminar 
                        "data": null,
                        //en este bloque lo que hace render es generar el contenido HTML que se mostrará en la celda
                        "render": function (data, type, row) {
                            return '<a class="btn btn-warning" href="${pageContext.request.contextPath}/ControladorProducto?accion=editar&codigo=' + row.codigo + '"><i class="fas fa-edit"></i> Editar</a> ' +
                                    '<a href="#" class="btn btn-danger" onclick="eliminarProducto(' + row.codigo + ')"><i class="fas fa-trash-alt"></i> Eliminar</a>';
                            //row.codigo es el identificador único del producto que se pasará como argumento a la función eliminarProducto
                        }                     //
                    }
                ]
            });
        });

        function eliminarProducto(id) {
            // 1. Confirmación del usuario
            if (confirm('¿Estás seguro de eliminar este producto?')) { 
                //cuadro de dialogo
                
       //-Se configura la solicitud AJAX para enviar una solicitud POST al servlet ControladorProducto. 

                // 2. Realización de una solicitud AJAX al servidor para eliminar el producto
                $.ajax({//Inicia una solicitud AJAX para enviar datos al servidor sin recargar la página.

                    // 3. Especificación de la URL a la que se enviará la solicitud
                    url: '${pageContext.request.contextPath}/ControladorProducto',

                    // 4. Tipo de solicitud HTTP que se enviará (POST en este caso)
                    // si no sabes que es POST es  para enviar datos al servidor :)
                    type: 'POST',

                    // 5. Datos que se enviarán al servidor
                    //accion :lo que esta haciendo es indicar a la accion a realiza "eliminar"
                    //id: lo que esta haciendo aqui es identificar el id a eliminar 
                    
             //solicitud incluye dos parámetros: accion con el valor Eliminar y id con el ID del producto a eliminar.
                    data: {accion: 'Eliminar', id: id},

      //-Si la solicitud se completa con éxito, se recarga la tabla DataTables 
        
        
                    // 6. Función de éxito, ejecutada cuando la solicitud se completa correctamente
                    success: function () {

                        // 7. Recargar la tabla DataTable para reflejar los cambios
                        $('#productosTable').DataTable().ajax.reload(); //reflejar los cambios sin recargar toda la página.
                        //lo que se hace aqui es recargar la tabla DataTable y actualizar los datos 

                    },
                            //manejo de errores
        // 8. Función de error, ejecutada cuando la solicitud falla
                    error: function () {
                        // 9. Muestra el mensaje de error al usuario
                        alert('Error al eliminar el producto');
                    }
                });
            }
        }
    </script>
     <center><div class="button-container">
      <a href="${pageContext.request.contextPath}/MENUPRINCIPAL/formularioProductos.jsp" class="button">Regresar a Agregar Producto</a>
            <a href="${pageContext.request.contextPath}/contenidoadmin.jsp" class="button">Pagina del Admin</a>
         </div></center>
</body>
</html>