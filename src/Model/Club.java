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
public class Club {
    private int idClub;
    private String nombre;
    private String logo;
    private String direccion;
    private String telefono;
    private int estado;
    private String email;

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
    

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public int getIdClub() {
        return idClub;
    }

    public void setIdClub(int idClub) {
        this.idClub = idClub;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }

    public Club(int idClub, String nombre, String logo) {
        this.idClub = idClub;
        this.nombre = nombre;
        this.logo = logo;
    }

    public Club(int idClub, String nombre, String logo, String direccion, String telefono, String email) {
        this.idClub = idClub;
        this.nombre = nombre;
        this.logo = logo;
        this.direccion = direccion;
        this.telefono = telefono;
        this.email = email;
    }
    
    

    public Club() {
    }

    @Override
    public String toString() {
        return "Club{" + "idClub=" + idClub + ", nombre=" + nombre + ", logo=" + logo + '}';
    }
    
    
}
