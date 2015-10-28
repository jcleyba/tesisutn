/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;



/**
 *
 * @author juanleyba
 */
public class ServicioJugadores extends ServicioBase {
    
    public void addJugador(Jugador j)
    {
        ResultSet rs = null;
        try
        {            
            abrirConexion();
            String sql = "CALL INSERTARJUGADOR('"+j.getUsername()+"','"+j.getPassword()+"','"+ j.getEmail()+"',"+j.getIdClub()+",'"+j.getNombre()+"','"+j.getApellido()+"',"+0+","+j.getMatricula()+")";
            PreparedStatement st = con.prepareStatement(sql);
            st.executeUpdate();
            st.close();
        }
        catch(Exception e)
        {
            System.out.println("Error al agregar el usuario. Causa: " + e.getMessage());
        }
        finally
        {
            cerrarConexion();
        }
    }
    
    public Usuario jugadorPorUserAndPass (String username,String pwd)
    {
        Usuario user = new Usuario();
        try
        {
          abrirConexion();
          //PASAR DATOS A OBJETO JUGADOR
          String sql = "SELECT idusuarios,username, password, email,clubes_idclubes FROM usuarios, jugadores where username = '"+username+"' and password ='"+pwd+"' and jugadores.usuarios_idusuarios = usuarios.idusuarios";
          PreparedStatement st = con.prepareStatement(sql);
          ResultSet rs = st.executeQuery(sql);
          if(rs.next())
          {
            user.setIdUsuario(rs.getInt("idusuarios"));
            user.setUsername(rs.getString("username"));
            user.setPassword(rs.getString("password"));
            user.setEmail(rs.getString("email"));
            user.setIdClub(rs.getInt("clubes_idclubes"));         
          }
          else {
            user = null;  
          }
          rs.close();
          st.close();
        }
        catch(Exception e)
        {
            System.out.println("Error al agregar el ingresar. Causa: " + e.getMessage());      
        }
        finally
        {
            cerrarConexion();
        }
        
        return user;
    }
    
    public Usuario usuarioPorIdJugador (int idJugador)
    {
        Usuario user = new Usuario();
        try
        {
          abrirConexion();
          //PASAR DATOS A OBJETO JUGADOR
          String sql = "SELECT idusuarios,username, password, email,clubes_idclubes FROM usuarios, jugadores where  jugadores.usuarios_idusuarios = usuarios.idusuarios and idjugadores = "+idJugador;
          PreparedStatement st = con.prepareStatement(sql);
          ResultSet rs = st.executeQuery(sql);
          if(rs.next())
          {
            user.setIdUsuario(rs.getInt("idusuarios"));
            user.setUsername(rs.getString("username"));
            user.setPassword(rs.getString("password"));
            user.setEmail(rs.getString("email"));
            user.setIdClub(rs.getInt("clubes_idclubes"));         
          }
          else {
            user = null;  
          }
          rs.close();
          st.close();
        }
        catch(Exception e)
        {
            System.out.println("Error al agregar el ingresar. Causa: " + e.getMessage());      
        }
        finally
        {
            cerrarConexion();
        }
        
        return user;
    }
    
    public List<Jugador> getJugadoresPorClub(int idClub)
    {
        ArrayList<Jugador> lista = new ArrayList();
        try
        {
          abrirConexion();
          String sql = "SELECT idjugadores,nombre,apellido,matricula,estado FROM jugadores,usuarios where idusuarios = usuarios_idusuarios and clubes_idclubes ="+idClub+" order by 3";
          PreparedStatement st = con.prepareStatement(sql);
          ResultSet rs = st.executeQuery();
          
          while(rs.next())
          {          
            Jugador club = new Jugador();
            club.setIdJugador(rs.getInt("idjugadores"));
            club.setNombre(rs.getString("nombre"));
            club.setApellido(rs.getString("apellido"));
            club.setMatricula(rs.getInt("matricula"));
            club.setEstado(rs.getInt("estado"));
            lista.add(club);     
          }
          
          rs.close();
          st.close();
        }
        catch(Exception e)
        {
            System.out.println("Error al agregar el listar. Causa: " + e.getMessage());      
        }
        finally
        {
            cerrarConexion();
        }
        
        return lista;
    }
    
    public Jugador jugadorPorIdUsuario (int idUsuario)
    {
        Jugador user = new Jugador();
        try
        {
          abrirConexion();
          //PASAR DATOS A OBJETO JUGADOR
          String sql = "SELECT idjugadores,nombre,apellido,estado, matricula, j.usuarios_idusuarios FROM usuarios, jugadores j where usuarios_idusuarios ="+idUsuario;
          PreparedStatement st = con.prepareStatement(sql);
          ResultSet rs = st.executeQuery(sql);
          if(rs.next())
          {
            user.setIdJugador(rs.getInt("idjugadores"));
            user.setNombre(rs.getString("nombre"));
            user.setApellido(rs.getString("apellido"));
            user.setEstado(rs.getInt("estado"));
            user.setMatricula(rs.getInt("matricula"));   
            user.setIdUsuario(rs.getInt("j.usuarios_idusuarios"));
          }
          else {
            user = null;  
          }
          rs.close();
          st.close();
        }
        catch(Exception e)
        {
            System.out.println("Error al agregar el ingresar. Causa: " + e.getMessage());      
        }
        finally
        {
            cerrarConexion();
        }
        
        return user;
    }
    
    public void activarJugador(int idJugador)
    {
        ResultSet rs = null;
        try
        {            
            abrirConexion();
            String sql = "UPDATE jugadores set estado=1 where idjugadores = "+idJugador;
            PreparedStatement st = con.prepareStatement(sql);
            st.executeUpdate();
            st.close();
        }
        catch(Exception e)
        {
            System.out.println("Error al agregar el usuario. Causa: " + e.getMessage());
        }
        finally
        {
            cerrarConexion();
        }
    }
    
     public void desactivarJugador(int idJugador)
    {
        try
        {            
            abrirConexion();
            String sql = "UPDATE jugadores set estado=0 where idjugadores = "+idJugador;
            PreparedStatement st = con.prepareStatement(sql);
            st.executeUpdate();
            st.close();
        }
        catch(Exception e)
        {
            System.out.println("Error al agregar el usuario. Causa: " + e.getMessage());
        }
        finally
        {
            cerrarConexion();
        }
    }
     
    public void updateJugador(int idJugador)
    {
        try
        {            
            abrirConexion();
            String sql = "UPDATE jugadores set estado=0 where idjugadores = "+idJugador;
            PreparedStatement st = con.prepareStatement(sql);
            st.executeUpdate();
            st.close();
        }
        catch(Exception e)
        {
            System.out.println("Error al agregar el usuario. Causa: " + e.getMessage());
        }
        finally
        {
            cerrarConexion();
        }
    } 
    
    public void updateUsuario(int idUsuario, String username,String password,String email,int idclub)
    {
        try
        {            
            abrirConexion();
            String sql = "UPDATE usuarios set username ='"+username+"',password ='"+password+"',email='"+email+"', clubes_idclubes="+idclub+" where idusuarios = "+idUsuario;
            PreparedStatement st = con.prepareStatement(sql);
            st.executeUpdate();
            st.close();
        }
        catch(Exception e)
        {
            System.out.println("Error al agregar el usuario. Causa: " + e.getMessage());
        }
        finally
        {
            cerrarConexion();
        }
    }
    
    public void updateJugador(int idUsuario, String nombre,String apellido,int matricula)
    {
        try
        {            
            abrirConexion();
                String sql = "UPDATE jugadores set nombre ='"+nombre+"',apellido ='"+apellido+"',matricula='"+matricula+"' where usuarios_idusuarios = "+idUsuario;
            PreparedStatement st = con.prepareStatement(sql);
            st.executeUpdate();
            st.close();
        }
        catch(Exception e)
        {
            System.out.println("Error al agregar el usuario. Causa: " + e.getMessage());
        }
        finally
        {
            cerrarConexion();
        }
    }

    public Usuario usuarioPorEmail (String email)
    {
        Usuario user = new Usuario();
        try
        {
            abrirConexion();
            String sql = "SELECT idusuarios,username, password, email,clubes_idclubes FROM usuarios where email = '"+email+"'";
            PreparedStatement st = con.prepareStatement(sql);
            ResultSet rs = st.executeQuery(sql);
            if(rs.next())
            {
                user.setIdUsuario(rs.getInt("idusuarios"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setEmail(rs.getString("email"));
                user.setIdClub(rs.getInt("clubes_idclubes"));
            }
            else {
                user = null;
            }
            rs.close();
            st.close();
        }
        catch(Exception e)
        {
            System.out.println("Error al agregar el ingresar. Causa: " + e.getMessage());
        }
        finally
        {
            cerrarConexion();
        }

        return user;
    }
}
