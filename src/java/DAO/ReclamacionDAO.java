/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Modelo.dto.Reclamacion;
import servicios.conexiones.ConexionBD;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ReclamacionDAO {

    public boolean insertarReclamacion(Reclamacion reclamacion) {
        Connection cnx = null;
        PreparedStatement ps = null;

        try {
            cnx = new ConexionBD().getConexion();
            String cadSQL = "INSERT INTO reclamaciones (nombre, apellido, email, telefono, tipo_reclamacion, descripcion, fecha_reg) VALUES (?, ?, ?, ?, ?, ?, ?)";
            ps = cnx.prepareStatement(cadSQL);

            ps.setString(1, reclamacion.getNombre());
            ps.setString(2, reclamacion.getApellido());
            ps.setString(3, reclamacion.getEmail());
            ps.setString(4, reclamacion.getTelefono());
            ps.setString(5, reclamacion.getTipoReclamacion());
            ps.setString(6, reclamacion.getDescripcion());
            // Obtener la fecha actual del sistema
            java.sql.Date fechaActual = new java.sql.Date(new Date().getTime());
            ps.setDate(7, fechaActual);

            int filasInsertadas = ps.executeUpdate();
            return filasInsertadas > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                if (cnx != null) {
                    cnx.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public List<Reclamacion> obtenerReclamacionesSinRespuesta() throws SQLException {
        List<Reclamacion> reclamaciones = new ArrayList<>();
        Connection cnx = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            cnx = new ConexionBD().getConexion();
            String consulta = "SELECT r.id, r.nombre, r.tipo_reclamacion, r.descripcion " +
                              "FROM reclamaciones r " +
                              "LEFT JOIN respuesta rs ON r.id = rs.id_reclamacion " +
                              "WHERE rs.id_reclamacion IS NULL";
            ps = cnx.prepareStatement(consulta);
            rs = ps.executeQuery();

            while (rs.next()) {
                Reclamacion reclamacion = new Reclamacion();
                reclamacion.setId(rs.getInt("id"));
                reclamacion.setNombre(rs.getString("nombre"));
                reclamacion.setTipoReclamacion(rs.getString("tipo_reclamacion"));
                reclamacion.setDescripcion(rs.getString("descripcion"));
                reclamaciones.add(reclamacion);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (cnx != null) {
                cnx.close();
            }
        }

        return reclamaciones;
    }
}