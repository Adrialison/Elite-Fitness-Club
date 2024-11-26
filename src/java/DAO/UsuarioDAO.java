package DAO;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import servicios.conexiones.ConexionBD;

public class UsuarioDAO {

    public void insertarUsuario(String nombre, String correo, String contrasena) throws SQLException {
        
        ConexionBD conexionBD = new ConexionBD();
        try (Connection conn = conexionBD.getConexion();
             PreparedStatement pstmt = conn.prepareStatement("INSERT INTO usuarios (Nombre, Correo, Pasword) VALUES (?, ?, ?)")) {
            pstmt.setString(1, nombre);
            pstmt.setString(2, correo);
            pstmt.setString(3, contrasena);
            pstmt.executeUpdate();
        }
    }
}