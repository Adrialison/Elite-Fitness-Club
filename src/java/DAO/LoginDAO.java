/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import servicios.conexiones.ConexionBD;

public class LoginDAO {

    private final ConexionBD conexionBD;

    public LoginDAO() {
        this.conexionBD = new ConexionBD();
    }

    public boolean verificarCredenciales(String correo, String contrasena) {
        try (Connection conexion = conexionBD.getConexion();
             PreparedStatement pstmt = conexion.prepareStatement("SELECT ID, Pasword, Nombre FROM usuarios WHERE Correo = ?")) {

            pstmt.setString(1, correo);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    String passwordHash = rs.getString("Pasword");
                    if (passwordHash != null && passwordHash.equals(contrasena)) {
                        // Si las credenciales son correctas, se devuelve true
                        return true;
                    }
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        // Si las credenciales no son correctas, o si hay algún error, se devuelve false
        return false;
    }
}