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
public class Resultado {
   private int idResultado;
   private int sumaHoyos;
   private int handicap;
   private int idJugador;
   private String nombreJugador;
   private String apellidoJugador;
   private int scoreNeto;
   private int idTorneo;
   private int idCategoria;

    public String getNombreJugador() {
        return nombreJugador;
    }

    public void setNombreJugador(String nombreJugador) {
        this.nombreJugador = nombreJugador;
    }

    public String getApellidoJugador() {
        return apellidoJugador;
    }

    public void setApellidoJugador(String apellidoJugador) {
        this.apellidoJugador = apellidoJugador;
    }

    public int getScoreNeto() {
        return scoreNeto;
    }

    public void setScoreNeto(int scoreNeto) {
        this.scoreNeto = scoreNeto;
    }

   
    public int getIdResultado() {
        return idResultado;
    }

    public void setIdResultado(int idResultado) {
        this.idResultado = idResultado;
    }

    public int getSumaHoyos() {
        return sumaHoyos;
    }

    public void setSumaHoyos(int sumaHoyos) {
        this.sumaHoyos = sumaHoyos;
    }

    public int getHandicap() {
        return handicap;
    }

    public void setHandicap(int handicap) {
        this.handicap = handicap;
    }

    public int getIdJugador() {
        return idJugador;
    }

    public void setIdJugador(int idJugador) {
        this.idJugador = idJugador;
    }

    public int getIdTorneo() {
        return idTorneo;
    }

    public void setIdTorneo(int idTorneo) {
        this.idTorneo = idTorneo;
    }

    public int getIdCategoria() {
        return idCategoria;
    }

    public void setIdCategoria(int idCategoria) {
        this.idCategoria = idCategoria;
    }

    public Resultado(int sumaHoyos, int handicap, int idJugador, int idTorneo, int idCategoria) {
        this.sumaHoyos = sumaHoyos;
        this.handicap = handicap;
        this.idJugador = idJugador;
        this.idTorneo = idTorneo;
        this.idCategoria = idCategoria;
    }

    public Resultado() {
    }

    @Override
    public String toString() {
        return "Resultado{" + "idResultado=" + idResultado + ", sumaHoyos=" + sumaHoyos + ", handicap=" + handicap + ", idJugador=" + idJugador + ", idTorneo=" + idTorneo + ", idCategoria=" + idCategoria + '}';
    }

    public Resultado(int idResultado, int sumaHoyos, int handicap, int idJugador, int idTorneo, int idCategoria) {
        this.idResultado = idResultado;
        this.sumaHoyos = sumaHoyos;
        this.handicap = handicap;
        this.idJugador = idJugador;
        this.idTorneo = idTorneo;
        this.idCategoria = idCategoria;
    }
   
}
