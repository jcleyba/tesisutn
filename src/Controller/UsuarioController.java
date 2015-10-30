/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;
import DAO.*;
import Model.Administrador;
import Model.Club;
import Model.Jugador;
import Model.Usuario;
/**
 *
 * @author juanleyba
 */
public class UsuarioController {
    private Usuario user = null;
    public void agregarJugador(String username,String password,int idClub, String email, int matricula, String nombre, String apellido)
    {
        ServicioJugadores datos = new ServicioJugadores();
        user = new Jugador(matricula, nombre, apellido, 0, username, password, idClub, email);
        datos.addJugador((Jugador) user);
     }
    
    public void addAdmin(String username,String password, String email, int idClub)
    {
        ServicioAdministrador datos = new ServicioAdministrador();
        user = new Administrador(username, password, idClub, email);
        datos.agregarAdministrador((Administrador) user);
     }
    
    public Usuario loginJugador(String username,String pwd){
        
        ServicioJugadores sb = new ServicioJugadores();
        Usuario j = sb.jugadorPorUserAndPass(username,pwd);
        
        return j;
    }
    
    public Administrador loginAdmin(String username,String pwd){
        ServicioAdministrador sb = new ServicioAdministrador();
        Administrador a = sb.adminUserAndPass(username,pwd);
        
        return a;
    }
    
    public boolean isAdmin(Object o)
    {
        return (o instanceof Administrador);
    }
    
    public Jugador getJugador(int idUsuario)
    {
        
        ServicioJugadores sb = new ServicioJugadores();
        Jugador j = sb.jugadorPorIdUsuario(idUsuario);
        
        return j;
    }
    
    public Usuario getAdmin(int idAdmin)
    {
        
        ServicioAdministrador sb = new ServicioAdministrador();
        Usuario j = sb.getAdmin(idAdmin);
        
        return j;
    }
    
    public Usuario getUsuarioPorIdJugador(int idJugador)
    {
        
        ServicioJugadores sj = new ServicioJugadores();
        Usuario j = sj.usuarioPorIdJugador(idJugador);
        
        return j;
    }
    
    public void activarJugador(int idJugador)
    {
        ServicioJugadores sb = new ServicioJugadores();
        sb.activarJugador(idJugador);
    }
    
     public void desactivarJugador(int idJugador)
    {
        ServicioJugadores sb = new ServicioJugadores();
        sb.desactivarJugador(idJugador);
    }
     
     public void actualizarJugador(int idUsuario,String nombre,String apellido,int matricula, String username,String password,String email,int idClub )
    {
        ServicioJugadores sb = new ServicioJugadores();
        sb.updateJugador(idUsuario,nombre,apellido,matricula);
        sb.updateUsuario(idUsuario, username, password, email, idClub);
    }
     
     public String getEmailAdmin (int idClub)
     {   
         ServicioAdministrador sa = new ServicioAdministrador();
         return sa.getAdminEmail(idClub);
     }

    public Integer errorPorUsuarioRegistrado(String username, String email)
    {
        Integer codigo = 0;
        ServicioJugadores sj = new ServicioJugadores();

        Usuario porUserName = sj.passwordPorUsuario(username);
        Usuario porEmail = sj.usuarioPorEmail(email);

        if(porUserName != null)
        {
            codigo = 101;
        }
        else if(porEmail != null)
        {
            codigo = 102;
        }
        else
        {
            codigo = 200;
        }

        return codigo;
    }
}
