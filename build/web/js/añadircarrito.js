/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/javascript.js to edit this template
 */

function agregarAlCarrito(usuarioAutenticado, producto, precio, imagen) {
    if (usuarioAutenticado) {

        const dataEnviar = {
            producto: producto,
            precio: precio,
            imagen: imagen
        };


        /* var formData = new FormData();
         formData.append('producto', producto);
         formData.append('precio', precio);
         formData.append('imagen', imagen); */

        console.log('Producto:', producto); // Depuración
        console.log('Precio:', precio); // Depuración
        console.log('Imagen:', imagen); // Depuración
        $.ajax({
            url:"http://localhost:8080/Club/gestionaCarrito",
            type: 'POST',
            data: dataEnviar,
            success: function (data) {
                console.log('Respuesta del servidor:', data);
                
                 $('#respuestaCarrito').html(data);
                 
                 let totItems = $('#totalItems').text();
                 $('#totalItemsCarrito').text(totItems);
                 
                 if (data.includes("agregado al carrito")) {
                 alert(`Producto ${producto} agregado al carrito, Precio: ${precio}`);
                 }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                console.error('Error en la solicitud AJAX:', textStatus, errorThrown);
            }
        });


        /*$.ajax({
            url: '<%= request.getContextPath()%>/gestionaCarritox',
            type: 'POST',
            data: dataEnviar,
            contentType: false,
            processData: false,
            success: function (data) {
                 $('#respuestaCarrito').html(data);
                 
                 let totItems = $('#totalItems').text();
                 $('#totalItemsCarrito').text(totItems);
                 
                 if (data.includes("agregado al carrito")) {
                 alert(`Producto ${producto} agregado al carrito, Precio: ${precio}`);
                 }
            },
            error: function (error) {
                console.error("Error:", error);
                alert("Ocurrió un error al agregar el producto al carrito");
            }
        });*/

    } else {
        alert("Por favor, inicie sesión para agregar productos al carrito.");
        window.location.href = "login.jsp";
    }
}


// Ejemplo de cómo usar la función agregarAlCarrito
// Puedes llamar a esta función desde cualquier lugar donde se maneje la interacción con productos y carrito
// Por ejemplo, desde un botón que dice "Agregar al carrito"
// agregarAlCarrito('Nombre del producto', 'Precio del producto', 'Ruta de la imagen del producto');
