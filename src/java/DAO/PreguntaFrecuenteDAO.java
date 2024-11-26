/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Modelo.dto.PreguntaFrecuente;
import servicios.conexiones.ConexionBD;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PreguntaFrecuenteDAO {

    public List<PreguntaFrecuente> obtenerPreguntasFrecuentes() {
        List<PreguntaFrecuente> preguntas = new ArrayList<>();
        String consulta = "SELECT pregunta, respuesta FROM preguntas_frecuentes";

        try (Connection conexion = new ConexionBD().getConexion();
             PreparedStatement ps = conexion.prepareStatement(consulta);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                PreguntaFrecuente pregunta = new PreguntaFrecuente();
                pregunta.setPregunta(rs.getString("pregunta"));
                pregunta.setRespuesta(rs.getString("respuesta"));
                preguntas.add(pregunta);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return preguntas;
    }
    
    public boolean eliminarPreguntaFrecuente(int id) {
    String consulta = "DELETE FROM preguntas_frecuentes WHERE id = ?";
    try (Connection conexion = new ConexionBD().getConexion();
         PreparedStatement ps = conexion.prepareStatement(consulta)) {
        ps.setInt(1, id);
        int rowsAffected = ps.executeUpdate();
        return rowsAffected > 0;
    } catch (SQLException e) {
        e.printStackTrace();
        return false;
    }
}
}