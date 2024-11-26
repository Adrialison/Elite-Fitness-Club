/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package servicios.conexiones;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ConexionBD {
    public Connection getConexion() throws SQLException {
    Connection cnx = null;
    String url = "jdbc:mysql://localhost:3306/bdutp?useTimeZone=true&serverTimezone=UTC&autoReconnect=true";
    String user = "root";
    String clave = ""; // Considera obtener la clave de forma segura
    
    String driver = "com.mysql.cj.jdbc.Driver";

    try {
        // Registrar el controlador JDBC
        Class.forName(driver);
        
        // Intentar establecer la conexión
        System.out.println("Intentando conectar a la base de datos...");
        cnx = DriverManager.getConnection(url, user, clave);
        System.out.println("Conexión exitosa a la base de datos.");
    } catch (ClassNotFoundException ex) {
        Logger.getLogger(ConexionBD.class.getName()).log(Level.SEVERE, "Error al cargar el controlador JDBC", ex);
        throw new SQLException("Error al cargar el controlador JDBC: " + ex.getMessage());
    } catch (SQLException ex) {
        Logger.getLogger(ConexionBD.class.getName()).log(Level.SEVERE, "Error al conectar a la base de datos", ex);
        throw ex; // Re-lanza la excepción para que el llamador pueda manejarla
    }

    return cnx;
}
}