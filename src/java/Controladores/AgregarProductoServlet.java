/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
import Modelo.dto.Producto;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "AgregarProductoServlet", urlPatterns = {"/AgregarProductoServlet"})
public class AgregarProductoServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<Producto> carrito = (List<Producto>) session.getAttribute("carrito");
        if (carrito == null) {
            carrito = new ArrayList<>();
            session.setAttribute("carrito", carrito);
        }
        
     String product = request.getParameter("producto");
        
        
        // Obtener el código del producto a agregar desde el formulario
        String codigoStr = request.getParameter("codigo");
        if (codigoStr == null || codigoStr.isEmpty()) {
            System.err.println("El código del producto es nulo o vacío");
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Código de producto no proporcionado");
            return;
        }

        int codigo;
        try {
            codigo = Integer.parseInt(codigoStr);
        } catch (NumberFormatException e) {
            System.err.println("Error al convertir el código del producto: " + e.getMessage());
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Código de producto inválido");
            return;
        }

        // Obtener el producto desde tu base de datos o donde lo almacenes
        Producto producto = obtenerProductoPorCodigo(codigo);
        if (producto == null) {
            System.err.println("Producto no encontrado para el código: " + codigo);
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Producto no encontrado");
            return;
        }

        // Añadir el producto al carrito
        carrito.add(producto);
        System.out.println("Producto agregado al carrito: " + producto.getNombre());

        // Redireccionar a la página del carrito después de agregar el producto
        response.sendRedirect("carrito.jsp");
    }

    // Método simulado para obtener el producto por su código
    private Producto obtenerProductoPorCodigo(int codigo) {
        // Aquí deberías implementar la lógica para obtener el producto desde tu base de datos
        // Esta es una implementación simulada para ilustrar el concepto
        Producto producto = new Producto();
        producto.setCodigo(codigo);
        producto.setNombre("Producto " + codigo);
        producto.setDescripcion("Descripción del producto " + codigo);
        producto.setPrecio(100.0); // Precio simulado
        producto.setFoto("img/producto" + codigo + ".jpg"); // Imagen simulada
        return producto;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "Método GET no permitido");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}