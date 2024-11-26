/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controladores;

import javax.servlet.http.Part;
import Modelo.dto.Producto;
import DAO.ProductoDAO;
import com.google.gson.Gson;
import com.sun.jdi.connect.spi.Connection;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import servicios.conexiones.ConexionBD;
import java.util.ArrayList;

/**
 *
 * @author Adriana
 */
public class ControladorProducto extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
        ProductoDAO pdao = new ProductoDAO();

        switch (accion) {
            case "Guardar":
                guardarProducto(request, response, pdao);
                break;
            case "Listar":
                listarProductos(response, pdao);
                break;
            case "editar":
                editarProducto(request, response, pdao);
                break;
            case "actualizar":
               
                actualizarProducto(request, response, pdao);
                 
                break;
            case "Eliminar":
                eliminarProducto(request, response, pdao);
                break;
            default:
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Acción no reconocida");
                break;
        }
    }
//METODO guardarProducto
    
private void guardarProducto(HttpServletRequest request, HttpServletResponse response, ProductoDAO pdao)
        throws ServletException, IOException {
    Producto p = new Producto();
    ArrayList<String> lista = new ArrayList<>();

    try {
        FileItemFactory fileFactory = new DiskFileItemFactory();
        ServletFileUpload fileUpload = new ServletFileUpload(fileFactory);
        //estos dos configuran y manejan la subida de archivos
        List<FileItem> items = fileUpload.parseRequest(request);
        //fileitem contiene archivos subidos.
        for (FileItem item : items) {
            if (!item.isFormField()) {
                String rutaImagenes = getServletContext().getRealPath("/imagenes/");
                File directorioImagenes = new File(rutaImagenes);
                if (!directorioImagenes.exists()) {
                    directorioImagenes.mkdirs();//crea los directorios especificados, 
                    //incluidos todos los directorios padres necesarios.


                }
                File archivo = new File(directorioImagenes, item.getName());
                item.write(archivo);//escribe el contenido del archivo subido en el archivo archivo
                p.setFoto(request.getContextPath() + "/imagenes/" + item.getName());
                //Método que configura la ruta de acceso a la imagen subida para el objeto Producto p.
            } else {
                lista.add(item.getString());
            }
        }

        p.setNombre(lista.get(0));
        p.setDescripcion(lista.get(1));
        p.setPrecio(Double.parseDouble(lista.get(2)));
        p.setCertificado(lista.get(3));
        p.setFecha(lista.get(4));

        if (pdao.agregarProducto(p)) { //agregar el producto utilizando ProductoDAO para interactuar con la BD
    request.setAttribute("mensaje", "Producto agregado exitosamente");
    response.sendRedirect(request.getContextPath() + "/MENUPRINCIPAL/ListarProductos.jsp");
    return; // Salir del método después de la redirección
} else {
    request.setAttribute("mensaje", "Error al agregar el producto");
}
    } catch (Exception e) {
        e.printStackTrace();
        request.setAttribute("mensaje", "Error al procesar el producto");
    }

    // Si no se redirigió, continuar mostrando el formulario
    request.getRequestDispatcher("MENUPRINCIPAL/ListarProductos.jsp").forward(request, response);
}

//METODO listarProductos

    private void listarProductos(HttpServletResponse response, ProductoDAO pdao)
            throws IOException {
        List<Producto> productos = pdao.listarProductos();
        response.setContentType("application/json; charset=UTF-8"); 
      //Establece el tipo de contenido de la respuesta HTTP como JSON, indicando que se enviará un JSON al cliente.
        String listaProductosJson = new Gson().toJson(productos);
      //Convierte la lista de productos en formato JSON utilizando la liberia Gson.
      
        response.getWriter().println(listaProductosJson); //permite escribir datos de respuesta en una solicitud HTTP
      //Escribe la lista de productos en formato JSON en la respuesta HTTP que será enviada al cliente (generalmente la página web que solicita los datos).
    }

private void editarProducto(HttpServletRequest request, HttpServletResponse response, ProductoDAO pdao)
        throws ServletException, IOException {
    String codigoStr = request.getParameter("codigo");

    // Verificar si el parámetro "codigo" está presente y no está vacío
    if (codigoStr == null || codigoStr.isEmpty()) {
        request.setAttribute("mensaje", "Código de producto no proporcionado o vacío.");
        request.getRequestDispatcher("/MENUPRINCIPAL/ListarProductos.jsp").forward(request, response);
        return;
    }

    try {
        int codigo = Integer.parseInt(codigoStr);
        System.out.println("Código de producto recibido: " + codigo); // Depuración
        Producto producto = pdao.obtenerProductoPorId(codigo);
        if (producto != null) {
            request.setAttribute("producto", producto);
            request.setAttribute("accion", "actualizar");
            request.getRequestDispatcher("editarProducto.jsp").forward(request, response);
        } else {
            request.setAttribute("mensaje", "Producto no encontrado");
            request.getRequestDispatcher("/MENUPRINCIPAL/ListarProductos.jsp").forward(request, response);
        }
    } catch (NumberFormatException e) {
        request.setAttribute("mensaje", "Formato de código de producto inválido.");
        request.getRequestDispatcher("/MENUPRINCIPAL/ListarProductos.jsp").forward(request, response);
    }
}

   private void actualizarProducto(HttpServletRequest request, HttpServletResponse response, ProductoDAO pdao)
        throws ServletException, IOException {
    try {
        String codigoStr = request.getParameter("codigo");
        String nombre = request.getParameter("nombre");
        String descripcion = request.getParameter("descripcion");
        String foto = request.getParameter("foto");
        String precioStr = request.getParameter("precio");
        String certificado = request.getParameter("certificado");
        String fecha = request.getParameter("fecha");

        // Verificar que los parámetros necesarios no sean nulos
        if (codigoStr == null || nombre == null || descripcion == null || precioStr == null) {
            throw new ServletException("Los parámetros requeridos están ausentes.");
        }

        // Crear un objeto Producto y configurar sus atributos
        Producto p = new Producto();
        p.setCodigo(Integer.parseInt(codigoStr));
        p.setNombre(nombre);
        p.setDescripcion(descripcion);
        p.setFoto(foto);
        p.setPrecio(Double.parseDouble(precioStr));
        p.setCertificado(certificado);
        p.setFecha(fecha);

        // Actualizar el producto en la base de datos usando el DAO
        if (pdao.edit(p)) {
            // Redirigir a formularioProductos.jsp después de la actualización
            response.sendRedirect(request.getContextPath() + "/MENUPRINCIPAL/formularioProductos.jsp");
        } else {
            request.setAttribute("mensaje", "Error al actualizar el producto");
            request.getRequestDispatcher("editarProducto.jsp").forward(request, response);
        }
    } catch (NumberFormatException e) {
        request.setAttribute("mensaje", "Error de formato en los datos del producto.");
        request.getRequestDispatcher("editarProducto.jsp").forward(request, response);
    } catch (Exception e) {
        request.setAttribute("mensaje", "Error al procesar la actualización del producto.");
        request.getRequestDispatcher("editarProducto.jsp").forward(request, response);
    }
}

    private void eliminarProducto(HttpServletRequest request, HttpServletResponse response, ProductoDAO pdao)
            throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        if (pdao.eliminarProducto(id)) {
            response.sendRedirect("ControladorProducto?accion=Listar");
        } else {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error al eliminar el producto");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
