/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.util.Date;

/**
 *
 * @author juanleyba
 */
public class Torneo {
    private int idTorneo;
    private String nombre;
    private String fecha;
    private int jugadoresPorLinea;
    private int intervalo;
    private int valorIntervalo;
    private int idClub;
    private String club;
    private int tipoTorneo;
    private String tipoDescripcion;
    private String horaInicio;
    private String horaCierre;

    public String getClub() {
        return club;
    }

    public void setClub(String club) {
        this.club = club;
    }

    public int getValorIntervalo() {
        return valorIntervalo;
    }

    public void setValorIntervalo(int valorIntervalo) {
        this.valorIntervalo = valorIntervalo;
    }

    public String getTipoDescripcion() {
        return tipoDescripcion;
    }

    public void setTipoDescripcion(String tipoDescripcion) {
        this.tipoDescripcion = tipoDescripcion;
    }

    
    public int getIdTorneo() {
        return idTorneo;
    }

    public void setIdTorneo(int idTorneo) {
        this.idTorneo = idTorneo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public int getJugadoresPorLinea() {
        return jugadoresPorLinea;
    }

    public void setJugadoresPorLinea(int jugadoresPorLinea) {
        this.jugadoresPorLinea = jugadoresPorLinea;
    }

    public int getIntervalo() {
        return intervalo;
    }

    public void setIntervalo(int intervalo) {
        this.intervalo = intervalo;
    }

    public int getIdClub() {
        return idClub;
    }

    public void setIdClub(int idClub) {
        this.idClub = idClub;
    }

    public int getTipoTorneo() {
        return tipoTorneo;
    }

    public void setTipoTorneo(int tipoTorneo) {
        this.tipoTorneo = tipoTorneo;
    }

    public String getHoraInicio() {
        return horaInicio;
    }

    public void setHoraInicio(String horaInicio) {
        this.horaInicio = horaInicio;
    }

    public String getHoraCierre() {
        return horaCierre;
    }

    public void setHoraCierre(String horaCierre) {
        this.horaCierre = horaCierre;
    }

    public Torneo() {
    }

    public Torneo(String nombre, String fecha, int jugadoresPorLinea, int intervalo, int idClub, int tipoTorneo, String horaInicio, String horaCierre) {
        this.nombre = nombre;
        this.fecha = fecha;
        this.jugadoresPorLinea = jugadoresPorLinea;
        this.intervalo = intervalo;
        this.idClub = idClub;
        this.tipoTorneo = tipoTorneo;
        this.horaInicio = horaInicio;
        this.horaCierre = horaCierre;
    }

    public Torneo(int idTorneo, String nombre, String fecha, int jugadoresPorLinea, int intervalo, int idClub, int tipoTorneo, String horaInicio, String horaCierre) {
        this.idTorneo = idTorneo;
        this.nombre = nombre;
        this.fecha = fecha;
        this.jugadoresPorLinea = jugadoresPorLinea;
        this.intervalo = intervalo;
        this.idClub = idClub;
        this.tipoTorneo = tipoTorneo;
        this.horaInicio = horaInicio;
        this.horaCierre = horaCierre;
    }
    
    
    
    
}
