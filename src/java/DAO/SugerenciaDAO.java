/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;


import Modelo.dto.sugerencia;
import servicios.conexiones.ConexionBD;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Date;

public class SugerenciaDAO {

    public boolean insertarSugerencia(sugerencia sugerencia) {
        Connection cnx = null;
        PreparedStatement ps = null;

        try {
             cnx = new ConexionBD().getConexion();
            String cadSQL = "INSERT INTO sugerencias (nombre, numero_socio, email, tipo_sugerencia, descripcion, ser_contactado, comentarios_adicionales,fecha_reg) VALUES (?, ?, ?, ?, ?, ?, ?,?)";
            ps = cnx.prepareStatement(cadSQL);
            ps.setString(1, sugerencia.getNombre());
            ps.setString(2, sugerencia.getNumeroSocio());
            ps.setString(3, sugerencia.getEmail());
            ps.setString(4, sugerencia.getTipoSugerencia());
            ps.setString(5, sugerencia.getDescripcion());
            ps.setBoolean(6, sugerencia.isContacto());
            ps.setString(7, sugerencia.getComentarios());
             // Obtener la fecha actual del sistema
            java.sql.Date fechaActual = new java.sql.Date(new Date().getTime());
            ps.setDate(8, fechaActual);

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
    
    
}