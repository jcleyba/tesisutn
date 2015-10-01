/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.Administrador;
import Model.Usuario;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author juanleyba
 */
public class ServicioAdministrador  extends ServicioBase{
    
    public Administrador adminUserAndPass (String username,String pwd)
    {
        Administrador a = new Administrador();
        try
        {
          abrirConexion();
          String sql = "SELECT idadministradores, usuarios_idusuarios FROM usuarios,administradores where idusuarios=usuarios_idusuarios and username = '"+username+"' and password = '"+pwd+"'";
;
          PreparedStatement st = con.prepareStatement(sql);
          ResultSet rs = st.executeQuery(sql);
          if(rs.next())
          {
            a.setIdAdministrador(rs.getInt("idadministradores"));   
            a.setIdUsuarioAdmin(rs.getInt("usuarios_idusuarios"));
          }
          else {
            a = null;  
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
        
        return a;
    }
    
    public void agregarAdministrador(Administrador a)
    {
        ResultSet rs = null;
        try
        {            
            abrirConexion();
            String sql = "CALL INSERTARADMINISTRADOR('"+a.getUsername()+"','"+a.getPassword()+"','"+ a.getEmail()+"',"+a.getIdClub()+")";
            PreparedStatement st = con.prepareStatement(sql);
            st.executeUpdate();
            st.close();
        }
        catch(Exception e)
        {
                System.out.println("Error al agregar el ADMIN. Causa: " + e.getMessage());
        }
        finally
        {
            cerrarConexion();
        }
    }
    
    public int getAdminClub(int idUsuario)
    {
        int idClub = 0;
         try
        {
          abrirConexion();
          String sql = "SELECT clubes_idclubes FROM usuarios where idusuarios = "+idUsuario;
          PreparedStatement st = con.prepareStatement(sql);
          ResultSet rs = st.executeQuery(sql);
          if(rs.next())
          {
            idClub = rs.getInt("clubes_idclubes");     
          }
          else {
            idClub = 0;  
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
        return idClub;
    }
    
    
    public Usuario getAdmin(int idAdmin)
    {
        Usuario admin = new Usuario();
         try
        {
          abrirConexion();
          String sql = "SELECT username, email, clubes_idclubes FROM usuarios u, administradores a where idusuarios = usuarios_idusuarios and idadministradores ="+idAdmin;
          PreparedStatement st = con.prepareStatement(sql);
          ResultSet rs = st.executeQuery(sql);
          while(rs.next())
          {
            admin.setUsername( rs.getString("username"));
            admin.setEmail(rs.getString("email"));
            admin.setIdClub(rs.getInt("clubes_idclubes"));
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
        return admin;
    }
    
    
    public String getAdminEmail(int idClub)
    {
        String email = "";
         try
        {
          abrirConexion();
          String sql = "SELECT u.email FROM usuarios u, administradores a where u.clubes_idclubes = "+idClub+" and u.idusuarios = a.usuarios_idusuarios ";
          PreparedStatement st = con.prepareStatement(sql);
          ResultSet rs = st.executeQuery(sql);
          if(rs.next())
          { 
            email = rs.getString("u.email"); 
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
        return email;
    }
}

