/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo.dto;

public class PreguntaFrecuente {
    private int id;
    private String pregunta;
    private String respuesta;

    // Constructor
    public PreguntaFrecuente() {
    }

    // Constructor con todos los campos
    public PreguntaFrecuente(int id, String pregunta, String respuesta) {
        this.id = id;
        this.pregunta = pregunta;
        this.respuesta = respuesta;
    }

    // Getters y setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPregunta() {
        return pregunta;
    }

    public void setPregunta(String pregunta) {
        this.pregunta = pregunta;
    }

    public String getRespuesta() {
        return respuesta;
    }

    public void setRespuesta(String respuesta) {
        this.respuesta = respuesta;
    }
}
