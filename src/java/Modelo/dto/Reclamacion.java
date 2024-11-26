/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package Modelo.dto;

import java.util.Date;

public class Reclamacion {
    private int id;
    private String nombre;
    private String apellido;
    private String email;
    private String telefono;
    private String tipoReclamacion;
    private String descripcion;
    private Date fechaRegistro;
    private String estadoRespuesta;

    // Getters y setters
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getTipoReclamacion() {
        return tipoReclamacion;
    }

    public void setTipoReclamacion(String tipoReclamacion) {
        this.tipoReclamacion = tipoReclamacion;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public Date getFechaRegistro() {
        return fechaRegistro;
    }

    public void setFechaRegistro(Date fechaRegistro) {
        this.fechaRegistro = fechaRegistro;
    }

    public String getEstadoRespuesta() {
        return estadoRespuesta;
   
    }
    public void setEstadoRespuesta(String estadoRespuesta) {
       this.estadoRespuesta = estadoRespuesta;
    }
}
