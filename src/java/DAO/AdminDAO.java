/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import servicios.conexiones.ConexionBD;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AdminDAO {

    private final ConexionBD conexionBD;

    public AdminDAO() {
        this.conexionBD = new ConexionBD();
    }

    public boolean verificarCredenciales(String usuario, String contrasena) {
        try (Connection conexion = conexionBD.getConexion(); PreparedStatement pstmt = conexion.prepareStatement("SELECT * FROM usuariosadmin WHERE nombre_usuario = ? AND contrasena = ?")) {

            pstmt.setString(1, usuario);
            pstmt.setString(2, contrasena);

            try (ResultSet rs = pstmt.executeQuery()) {
                boolean credencialesValidas = rs.next(); // Si hay al menos una fila, las credenciales son válidas
                if (credencialesValidas) { //para saber si se ingreso el nombre del usuario
                    System.out.println("Usuario " + usuario + " ha iniciado sesión correctamente.");
                } else {
                    System.out.println("Usuario " + usuario + " no ha iniciado sesión. Credenciales incorrectas.");
                }
                return credencialesValidas;
            }
        } catch (SQLException ex) {
            ex.printStackTrace(); // Manejo básico de excepciones
            return false;
        }
    
}
}
