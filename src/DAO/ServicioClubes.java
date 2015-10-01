/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.Club;
import Model.Torneo;
import Model.Usuario;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author juanleyba
 */
public class ServicioClubes extends ServicioBase{
    
    public List<Club> getClubes()
    {
        ArrayList<Club> lista = new ArrayList();
        try
        {
          abrirConexion();
          String sql = "SELECT idclubes,nombre,logo,direccion,telefono,estado FROM clubes";
          PreparedStatement st = con.prepareStatement(sql);
          ResultSet rs = st.executeQuery();
          
          while(rs.next())
          {          
            Club club = new Club();
            club.setIdClub(rs.getInt("idclubes"));
            club.setNombre(rs.getString("nombre"));
            club.setLogo(rs.getString("logo"));
            club.setDireccion(rs.getString("direccion"));
            club.setTelefono(rs.getString("telefono"));
            club.setEstado(rs.getInt("estado"));
            lista.add(club);     
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
        
        return lista;
    }
    
    public List<Club> getClubesActivos()
    {
        ArrayList<Club> lista = new ArrayList();
        try
        {
          abrirConexion();
          String sql = "SELECT idclubes,nombre,logo,direccion,telefono,estado FROM clubes where estado = 1";
          PreparedStatement st = con.prepareStatement(sql);
          ResultSet rs = st.executeQuery();
          
          while(rs.next())
          {          
            Club club = new Club();
            club.setIdClub(rs.getInt("idclubes"));
            club.setNombre(rs.getString("nombre"));
            club.setLogo(rs.getString("logo"));
            club.setDireccion(rs.getString("direccion"));
            club.setTelefono(rs.getString("telefono"));
            club.setEstado(rs.getInt("estado"));
            lista.add(club);     
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
        
        return lista;
    }
    public Club getClubById(int id)
    {
        Club club = new Club();
        try
        {
          abrirConexion();
          String sql = "SELECT idclubes,nombre,logo,direccion,telefono,email FROM clubes where idclubes ="+id;
          PreparedStatement st = con.prepareStatement(sql);
          ResultSet rs = st.executeQuery();
          while(rs.next())
          {          
            club.setIdClub(rs.getInt("idclubes"));
            club.setNombre(rs.getString("nombre"));
            club.setLogo(rs.getString("logo"));
            club.setDireccion(rs.getString("direccion"));
            club.setTelefono(rs.getString("telefono"));
            club.setEmail(rs.getString("email"));
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
        
        return club;
    }
    
     public void addClub(Club club)
    {
        ResultSet rs = null;
        try
        {            
            abrirConexion();
            String sql = "INSERT INTO CLUBES (nombre,logo,direccion,telefono,email) VALUES('"+club.getNombre()+"','"+club.getLogo()+"','"+club.getDireccion()+"','"+club.getTelefono()+"','"+club.getEmail()+"')";
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
     
      public void desactivarClub(int idClub)
    {
        try
        {            
            abrirConexion();
            String sql = "UPDATE clubes set estado = 0 where idclubes = "+idClub;
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
      
       public void activarClub(int idClub)
    {
        try
        {            
            abrirConexion();
            String sql = "UPDATE clubes set estado = 1 where idclubes = "+idClub;
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
       
       public void updateClub(Club c)
    {
        ResultSet rs = null;
        try
        {            
            abrirConexion();
            String sql = "UPDATE clubes set nombre ='"+c.getNombre()+"',"
                    + "      logo = '"+c.getLogo()+"',"
                    + "      direccion = '"+ c.getDireccion()+"',"
                    + "      telefono = '"+c.getTelefono()+"',"
                    + "      email = '"+c.getEmail()+"' where idclubes ="+c.getIdClub();
                                                                       
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
}
