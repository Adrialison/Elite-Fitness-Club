/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;
import Modelo.dto.Producto;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import servicios.conexiones.ConexionBD;

public class ProductoDAO { 
    //Se declaran las variables con, ps, rs para manejar la conexión a la base de datos 
    //y los resultados de las consultas
      Connection con;
    PreparedStatement ps;
    ResultSet rs;

    private final ConexionBD conexionBD;

    public ProductoDAO() { //Constructor 
        this.conexionBD = new ConexionBD();
    }


          
          
    public boolean agregarProducto(Producto p) { //método agrega un nuevo producto a la base de datos
        try (Connection connection = conexionBD.getConexion();
             PreparedStatement statement = connection.prepareStatement("INSERT INTO producto (nombre, descripcion, precio, foto, certificado, fecha) VALUES (?, ?, ?, ?, ?, ?)")) {
            statement.setString(1, p.getNombre());
            statement.setString(2, p.getDescripcion());
            statement.setDouble(3, p.getPrecio());
            statement.setString(4, p.getFoto());
            statement.setString(5, p.getCertificado());
            statement.setString(6, p.getFecha());

            int rowsAffected = statement.executeUpdate();
            return rowsAffected > 0; //se utiliza para almacenar el número de filas afectadas 
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
    }

    
public List<Producto> listarProductos() { //obtiene todos los productos de la base de datos y los devuelve como una lista. 
    ConexionBD cn = new ConexionBD();
    String sql = "SELECT codigo, nombre, descripcion, precio, foto, certificado, fecha FROM producto";
    List<Producto> lista = new ArrayList<>();
    
    try (Connection con = cn.getConexion();
         PreparedStatement ps = con.prepareStatement(sql);
         ResultSet rs = ps.executeQuery()) {
        while (rs.next()) {
            Producto p = new Producto();
            p.setCodigo(rs.getInt("codigo"));
            p.setNombre(rs.getString("nombre"));
            p.setDescripcion(rs.getString("descripcion"));
            p.setPrecio(rs.getInt("precio"));
            p.setFoto(rs.getString("foto"));
            p.setCertificado(rs.getString("certificado"));
            p.setFecha(rs.getString("fecha"));
            lista.add(p);
        }
    } catch (SQLException ex) {
        ex.printStackTrace();
    }
    return lista;
}
public Producto obtenerProductoPorId(int codigo) {
    String sql = "SELECT * FROM producto WHERE codigo = ?";
    Producto producto = null;

    try (Connection con = conexionBD.getConexion();
         PreparedStatement ps = con.prepareStatement(sql)) {
        ps.setInt(1, codigo);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            producto = new Producto();
            producto.setCodigo(rs.getInt("codigo"));
            producto.setNombre(rs.getString("nombre"));
            producto.setDescripcion(rs.getString("descripcion"));
            producto.setPrecio(rs.getDouble("precio")); // Asegúrate de que el tipo sea correcto
            producto.setFoto(rs.getString("foto"));
            producto.setCertificado(rs.getString("certificado"));
            producto.setFecha(rs.getString("fecha"));
            System.out.println("Producto encontrado: " + producto); // Depuración
        } else {
            System.out.println("Producto no encontrado con el código: " + codigo); // Depuración
        }
    } catch (SQLException ex) {
        ex.printStackTrace();
    }
    return producto;
}

public boolean edit(Producto p) { //actualiza un producto existente en la base de datos
    System.out.println("Intentando actualizar el producto: " + p);

    try {
        String sql = "UPDATE producto SET nombre=?, descripcion=?, precio=?, foto=?, certificado=?, fecha=? WHERE codigo=?";
        con = conexionBD.getConexion();
        ps = con.prepareStatement(sql);

        // Establecer los parámetros de la consulta
        ps.setString(1, p.getNombre());
        ps.setString(2, p.getDescripcion());
        ps.setDouble(3, p.getPrecio());
        ps.setString(4, p.getFoto());
        ps.setString(5, p.getCertificado());
        ps.setString(6, p.getFecha());
        ps.setInt(7, p.getCodigo()); // Usar el método getCodigo() para obtener el ID del producto

        // Agregar impresión de debug para verificar los valores de los parámetros
        System.out.println("Valores de los parámetros de la consulta: nombre=" + p.getNombre() + ", descripcion=" + p.getDescripcion() +
                           ", precio=" + p.getPrecio() + ", foto=" + p.getFoto() + ", certificado=" + p.getCertificado() + ", fecha=" + p.getFecha() +
                           ", codigo=" + p.getCodigo());

        // Ejecutar la consulta
        int rowsAffected = ps.executeUpdate();

        // Verificar si se editó exitosamente al menos una fila
        if (rowsAffected > 0) { //se utiliza para almacenar el número de filas afectadas 
            System.out.println("Actualización exitosa para el producto: " + p);
            return true;
        } else {
            System.out.println("No se encontró el producto para actualizar: " + p);
            return false;
        }
    } catch (Exception e) {
        // Manejar la excepción adecuadamente (puedes registrarla, lanzarla nuevamente, etc.)
        e.printStackTrace();
        return false;
    } finally {
        // Cerrar la conexión y el PreparedStatement en el bloque finally para garantizar su liberación
        try {
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
}

//ELIMINAR
public boolean eliminarProducto(int id) {
    String sql = "DELETE FROM producto WHERE codigo = ?";
    //para asegurarse de que los recursos se cierren correctamente.
    try (Connection con = conexionBD.getConexion();
         PreparedStatement ps = con.prepareStatement(sql)) {
        ps.setInt(1, id);
        int rowsAffected = ps.executeUpdate();
        return rowsAffected > 0; //se utiliza para almacenar el número de filas afectadas 
    } catch (SQLException ex) {
        ex.printStackTrace(); // Imprime la traza de la excepción para depuración
        return false;
    }
}

  


}