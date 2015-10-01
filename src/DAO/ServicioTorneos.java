/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.Club;
import Model.Intervalo;
import Model.TipoTorneo;
import Model.Torneo;
import Model.Usuario;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author juanleyba
 */
public class ServicioTorneos extends ServicioBase{
    
    public List<Intervalo> getIntervalos()
    {
        ArrayList<Intervalo> lista = new ArrayList();
        try
        {
          abrirConexion();
          String sql = "SELECT idintervalos,valor,nombre FROM intervalos";
          PreparedStatement st = con.prepareStatement(sql);
          ResultSet rs = st.executeQuery();
          
          while(rs.next())
          {          
            Intervalo inter = new Intervalo();
            inter.setIdIntervalo(rs.getInt("idintervalos"));
            inter.setNombre(rs.getString("nombre"));
            inter.setValor(rs.getInt("valor"));
            lista.add(inter);     
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
    
    public List<TipoTorneo> getTipoTorneo()
    {
        ArrayList<TipoTorneo> lista = new ArrayList();
        try
        {
          abrirConexion();
          String sql = "SELECT idtiposTorneo,tipoDescripcion FROM tiposTorneo";
          PreparedStatement st = con.prepareStatement(sql);
          ResultSet rs = st.executeQuery();
          
          while(rs.next())
          {          
            TipoTorneo tt = new TipoTorneo();
            tt.setIdTipoTorneo(rs.getInt(1));
            tt.setTipoDescripcion(rs.getString(2));
            lista.add(tt);     
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
    
    public void addTorneo(Torneo t)
    {
        ResultSet rs = null;
        try
        {            
            abrirConexion();
            String sql = "CALL INSERTARTORNEO('"+
                            t.getNombre()+"','"
                            +t.getFecha()+"',"
                            + t.getJugadoresPorLinea()+","
                            +t.getIdClub()+","
                            +t.getIntervalo()+","
                            +t.getTipoTorneo()+",'"
                             +t.getHoraInicio()+"','"
                             +t.getHoraCierre()+"')";
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
    
    public List<Torneo> getTorneosPorId(int idclub)
    {
        ArrayList<Torneo> lista = new ArrayList();
        try
        {
          abrirConexion();
          String sql = "SELECT idtorneos,t.nombre,t.fecha,tt.tipoDescripcion FROM torneos t,tiposTorneo tt where t.clubes_idclubes = "+idclub+" and idtiposTorneo = tiposTorneo_idtiposTorneo";
          PreparedStatement st = con.prepareStatement(sql);
          ResultSet rs = st.executeQuery();
          
          while(rs.next())
          {          
            Torneo t = new Torneo();
            t.setIdTorneo(rs.getInt("idtorneos"));
            t.setNombre(rs.getString("t.nombre"));
            t.setFecha(rs.getString("fecha"));
            t.setTipoDescripcion(rs.getString("tt.tipoDescripcion"));
            
            lista.add(t);     
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
    
    public List<Torneo> getProximosTorneos()
    {
        ArrayList<Torneo> lista = new ArrayList();
        try
        {
          abrirConexion();
          String sql = "SELECT idtorneos,t.nombre,t.fecha,tt.tipoDescripcion,c.nombre FROM torneos t,tiposTorneo tt,clubes c where t.fecha >= CURDATE() and idtiposTorneo = tiposTorneo_idtiposTorneo and clubes_idclubes = idclubes order by 3";
          PreparedStatement st = con.prepareStatement(sql);
          ResultSet rs = st.executeQuery();
          
          while(rs.next())
          {          
            Torneo t = new Torneo();
            t.setIdTorneo(rs.getInt("idtorneos"));
            t.setNombre(rs.getString("t.nombre"));
            t.setFecha(rs.getString("t.fecha"));
            t.setClub(rs.getString("c.nombre"));
            t.setTipoDescripcion(rs.getString("tt.tipoDescripcion"));
            
            lista.add(t);     
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
    
    public Torneo getHorarios(int idTorneo)
    {
        ArrayList<Date> lista = new ArrayList();
         Torneo t = new Torneo();
        try
        {
          abrirConexion();
          String sql = "SELECT idtorneos,fecha,valor,hora_inicio,hora_fin FROM torneos, intervalos where idtorneos = "+idTorneo+" and idintervalos = intervalos_idintervalos";
          PreparedStatement st = con.prepareStatement(sql);
          ResultSet rs = st.executeQuery();
          
          while(rs.next())
          {          
           
            t.setIdTorneo(rs.getInt("idtorneos"));
            t.setFecha(rs.getString("fecha"));
            t.setValorIntervalo(rs.getInt("valor"));
            t.setHoraInicio(rs.getString("hora_inicio"));
            t.setHoraCierre(rs.getString("hora_fin").toString());
            
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
        
        return t;
    }
    
    public Torneo getTorneoPorId(int idTorneo)
    {
        Torneo t = new Torneo();
        try
        {
          abrirConexion();
          String sql = "SELECT idtorneos,t.nombre,t.fecha,t.tiposTorneo_idtiposTorneo,t.cantidadJugadores,t.intervalos_idintervalos,t.clubes_idclubes,tt.tipoDescripcion FROM torneos t,tiposTorneo tt where t.idtorneos = "+idTorneo+" and idtiposTorneo = tiposTorneo_idtiposTorneo";
          PreparedStatement st = con.prepareStatement(sql);
          ResultSet rs = st.executeQuery();
          
          while(rs.next())
          {          
            t.setIdClub(rs.getInt("idtorneos"));
            t.setNombre(rs.getString("t.nombre"));
            t.setFecha(rs.getString("t.fecha"));
            t.setIntervalo(rs.getInt("t.intervalos_idintervalos"));
            t.setTipoTorneo(rs.getInt("t.tiposTorneo_idtiposTorneo"));
            t.setIdClub(rs.getInt("t.clubes_idclubes"));
            t.setJugadoresPorLinea(rs.getInt("t.cantidadJugadores"));
            t.setTipoDescripcion(rs.getString("tt.tipoDescripcion"));    
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
        
        return t;
    }
    
    public List<Torneo> getProximosTorneosPorClub(int idClub)
    {
        ArrayList<Torneo> lista = new ArrayList();
        try
        {
          abrirConexion();
           String sql = "SELECT idtorneos,t.nombre,t.fecha,tt.tipoDescripcion FROM torneos t,tiposTorneo tt where t.fecha >= CURDATE() and idtiposTorneo = tiposTorneo_idtiposTorneo and clubes_idclubes="+idClub;
          PreparedStatement st = con.prepareStatement(sql);
          ResultSet rs = st.executeQuery();
          
          while(rs.next())
          {          
            Torneo t = new Torneo();
            t.setIdTorneo(rs.getInt("idtorneos"));
            t.setNombre(rs.getString("t.nombre"));
            t.setFecha(rs.getString("t.fecha"));
            t.setTipoDescripcion(rs.getString("tt.tipoDescripcion"));
            
            lista.add(t);     
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
    
    public void updateTorneo(Torneo t)
    {
        ResultSet rs = null;
        try
        {            
            abrirConexion();
            String sql = "UPDATE torneos set nombre ='"+t.getNombre()+"',"
                    + "      fecha = '"+t.getFecha()+"',"
                    + "      cantidadJugadores = "+ t.getJugadoresPorLinea()+","
                    + "      clubes_idclubes = "+t.getIdClub()+","
                    + "      intervalos_idintervalos ="+t.getIntervalo()+","
                    + "      tiposTorneo_idtiposTorneo = "+t.getTipoTorneo()+","
                    + "      hora_inicio ='"+t.getHoraInicio()+"',"
                    + "      hora_fin ='"+t.getHoraCierre()+"' where idtorneos ="+t.getIdTorneo();
                                                                       
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
            
    
    public void cerrarTorneo(int idTorneo)
    {
     try
        {            
            abrirConexion();
            String sql = "UPDATE torneos set tiposTorneo_idtiposTorneo = 2 where idtorneos = "+idTorneo;
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
