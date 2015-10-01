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
public class Usuario {
   private int idUsuario;
   private String username;
   private String password;
   private int idClub;
   private String email;

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getIdClub() {
        return idClub;
    }

    public void setIdClub(int idClub) {
        this.idClub = idClub;
    }



    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Usuario(String username, String password, int idClub, String email) {
        this.username = username;
        this.password = password;
        this.idClub = idClub;
        this.email = email;
    }

   

    public Usuario() {
    }

    public Usuario(int idUsuario, String username, String password, int idClub, String email) {
        this.idUsuario = idUsuario;
        this.username = username;
        this.password = password;
        this.idClub = idClub;
        this.email = email;
    }


     
    
    @Override
    public String toString() {
        return "Usuario{" + "idUsuario=" + idUsuario + ", username=" + username + ", password=" + password + ", club=" + idClub + ", email=" + email + '}';
    }
   
   
    
}
