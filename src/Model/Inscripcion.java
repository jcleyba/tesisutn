/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author juanleyba
 */
public class Inscripcion {
    private int idInscripcion;
    private String horaInicio;
    private boolean estado;
    private String hora_inscripcion;
    private int idjugador;
    private int idtorneo;

    public int getIdjugador() {
        return idjugador;
    }

    public void setIdjugador(int idjugador) {
        this.idjugador = idjugador;
    }

    public int getIdtorneo() {
        return idtorneo;
    }

    public void setIdtorneo(int idtorneo) {
        this.idtorneo = idtorneo;
    }
    

    public int getIdInscripcion() {
        return idInscripcion;
    }

    public void setIdInscripcion(int idInscripcion) {
        this.idInscripcion = idInscripcion;
    }

    public String getHoraInicio() {
        return horaInicio;
    }

    public void setHoraInicio(String horaInicio) {
        this.horaInicio = horaInicio;
    }

    public boolean isEstado() {
        return estado;
    }

    public void setEstado(boolean estado) {
        this.estado = estado;
    }

    public String getHora_inscripcion() {
        return hora_inscripcion;
    }

    public void setHora_inscripcion(String hora_inscripcion) {
        this.hora_inscripcion = hora_inscripcion;
    }

    public Inscripcion() {
    }

    public Inscripcion(String horaInicio, boolean estado, String hora_inscripcion) {
        this.horaInicio = horaInicio;
        this.estado = estado;
        this.hora_inscripcion = hora_inscripcion;
    }

    public Inscripcion(String horaInicio, boolean estado, int idjugador, int idtorneo) {
        this.horaInicio = horaInicio;
        this.estado = estado;
        this.idjugador = idjugador;
        this.idtorneo = idtorneo;
    }
    
    
}
