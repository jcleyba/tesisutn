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
public class Jugador extends Usuario{
    private int idJugador;
    private int matricula;
    private String nombre;
    private String apellido;
    private int estado;

    public int getIdJugador() {
        return idJugador;
    }

    public void setIdJugador(int idJugador) {
        this.idJugador = idJugador;
    }

    public int getMatricula() {
        return matricula;
    }

    public void setMatricula(int matricula) {
        this.matricula = matricula;
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

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }

    public Jugador(int idJugador, int matricula, String nombre, String apellido, int estado, int idUsuario, String username, String password, int idClub, String email) {
        super(idUsuario, username, password, idClub, email);
        this.idJugador = idJugador;
        this.matricula = matricula;
        this.nombre = nombre;
        this.apellido = apellido;
        this.estado = estado;
    }

    public Jugador() {
    }

    public Jugador(int matricula, String nombre, String apellido, int estado,  String username, String password, int idClub, String email) {
        super(username, password, idClub, email);
        this.matricula = matricula;
        this.nombre = nombre;
        this.apellido = apellido;
        this.estado = estado;
    }
    
    

    @Override
    public String toString() {
        return "Jugador{" + "idJugador=" + idJugador + ", matricula=" + matricula + ", nombre=" + nombre + ", apellido=" + apellido + ", estado=" + estado + '}';
    }
    
    

}
