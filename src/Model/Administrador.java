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
public class Administrador extends Usuario{
    private int idAdministrador;
    private int idUsuarioAdmin;

    public int getIdUsuarioAdmin() {
        return idUsuarioAdmin;
    }

    public void setIdUsuarioAdmin(int idUsuarioAdmin) {
        this.idUsuarioAdmin = idUsuarioAdmin;
    }
    
    
    public int getIdAdministrador() {
        return idAdministrador;
    }

    public void setIdAdministrador(int idAdministrador) {
        this.idAdministrador = idAdministrador;
    }

    public Administrador(int idAdministrador, int idUsuario, String username, String password, int idClub, String email) {
        super(idUsuario, username, password, idClub, email);
        this.idAdministrador = idAdministrador;
    }

    public Administrador(String username, String password, int idClub, String email) {
        super(username, password, idClub, email);
    }

    
        
    public Administrador() {
    }

    @Override
    public String toString() {
        return "Administrador{" + "idAdministrador=" + idAdministrador + '}';
    }
    
    
}
