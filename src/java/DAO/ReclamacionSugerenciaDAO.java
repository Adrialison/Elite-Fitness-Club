

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Modelo.dto.Reclamacion;
import Modelo.dto.sugerencia;
import servicios.conexiones.ConexionBD;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ReclamacionSugerenciaDAO{
    // Método para obtener todas las reclamaciones con su estado de respuesta
   public List<Reclamacion> obtenerReclamacionesConEstadoRespuesta() throws SQLException {
        List<Reclamacion> reclamaciones = new ArrayList<>();
        String consulta = "SELECT \n" +
                          "    r.id, \n" +
                          "    r.nombre, \n" +
                          "    r.apellido, \n" +
                          "    r.email, \n" +
                          "    r.telefono, \n" +
                          "    r.tipo_reclamacion, \n" +
                          "    r.descripcion, \n" +
                          "    r.fecha_reg, \n" +
                          "    res.estado \n" +
                          "FROM \n" +
                          "    reclamaciones r\n" +
                          "INNER JOIN \n" +
                          "    respuesta res \n" +
                          "ON \n" +
                          "    r.id = res.id_reclamacion;";

        try (Connection conexion = new ConexionBD().getConexion();
             PreparedStatement ps = conexion.prepareStatement(consulta);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Reclamacion reclamacion = new Reclamacion();
                reclamacion.setId(rs.getInt("id"));
                reclamacion.setNombre(rs.getString("nombre"));
                reclamacion.setApellido(rs.getString("apellido"));
                reclamacion.setEmail(rs.getString("email"));
                reclamacion.setTelefono(rs.getString("telefono"));
                reclamacion.setTipoReclamacion(rs.getString("tipo_reclamacion"));
                reclamacion.setDescripcion(rs.getString("descripcion"));
                reclamacion.setFechaRegistro(rs.getDate("fecha_reg"));
                reclamacion.setEstadoRespuesta(rs.getString("estado"));
                reclamaciones.add(reclamacion);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Manejar la excepción según sea necesario
            throw new SQLException("Error al obtener las reclamaciones con estado de respuesta", e);
        }

        return reclamaciones;
    }


    // Método para obtener todas las sugerencias
    public List<sugerencia> obtenerSugerencias() {
        List<sugerencia> sugerencias = new ArrayList<>();
        String consulta = "SELECT * FROM sugerencias";

        try (Connection conexion = new ConexionBD().getConexion();
             PreparedStatement ps = conexion.prepareStatement(consulta);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                sugerencia sugerencia = new sugerencia();
                sugerencia.setId(rs.getInt("id"));
                sugerencia.setNombre(rs.getString("nombre"));
                sugerencia.setNumeroSocio(rs.getString("numero_socio"));
                sugerencia.setEmail(rs.getString("email"));
                sugerencia.setTipoSugerencia(rs.getString("tipo_sugerencia"));
                sugerencia.setDescripcion(rs.getString("descripcion"));
                sugerencia.setContacto(rs.getBoolean("ser_contactado"));
                sugerencia.setComentarios(rs.getString("comentarios_adicionales"));
                sugerencia.setFechaRegistro(rs.getDate("fecha_reg"));
                sugerencias.add(sugerencia);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Manejar la excepción según sea necesario
        }

        return sugerencias;
    }
}