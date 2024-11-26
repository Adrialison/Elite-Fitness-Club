/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import servicios.conexiones.ConexionBD;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ProcesarPreguntaDAO {

    public void insertarPregunta(String pregunta, String respuesta) throws SQLException {
        // Consulta para insertar una nueva pregunta en la base de datos
        String consulta = "INSERT INTO preguntas_frecuentes (pregunta, respuesta) VALUES (?, ?)";

        try (Connection conexion = new ConexionBD().getConexion();
             PreparedStatement ps = conexion.prepareStatement(consulta)) {

            // Establecer los parámetros de la consulta
            ps.setString(1, pregunta);
            ps.setString(2, respuesta);

            // Ejecutar la consulta
            ps.executeUpdate();
        }
    }
}
