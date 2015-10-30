/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.Inscripcion;
import Model.Jugador;
import Model.Torneo;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author juanleyba
 */
public class ServicioInscripciones extends ServicioBase{
    
     public void addInscripcion(Inscripcion i)
    {
        ResultSet rs = null;
        try
        {            
            abrirConexion();
            String sql = "INSERT INTO inscripciones (hora_inicio,estado,jugadores_idjugadores,torneos_idtorneos,hora_inscripcion) VALUES('"
                            +i.getHoraInicio()+"',"+1+","+i.getIdjugador()+","+i.getIdtorneo()+",CURDATE())";
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
     
     public List<Jugador> getInscripcionesPorFecha(String fecha,int idTorneo)
    {
        ArrayList<Jugador> lista = new ArrayList();
        try
        {
          abrirConexion();
          String sql = "SELECT idjugadores, idinscripciones, j.nombre,j.apellido FROM inscripciones i, torneos t, jugadores j\n" +
"where j.idjugadores = i.jugadores_idjugadores and i.hora_inicio = '"+fecha+"' and i.estado = 1 and idtorneos = "+idTorneo;
          PreparedStatement st = con.prepareStatement(sql);
          ResultSet rs = st.executeQuery();
          
          while(rs.next())
          {          
            Jugador club = new Jugador();
            club.setIdJugador(rs.getInt("idjugadores"));
            club.setNombre(rs.getString("j.nombre"));
            club.setApellido(rs.getString("j.apellido"));
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
    
     public List<Torneo> getInscripcionesPorUsuario(int idUsuario)
    {
        ArrayList<Torneo> lista = new ArrayList();
        try
        {
          abrirConexion();
          String sql = "SELECT t.idtorneos,T.NOMBRE,T.FECHA,C.NOMBRE, IDINSCRIPCIONES FROM TORNEOS T, INSCRIPCIONES I, JUGADORES J, CLUBES C WHERE T.IDTORNEOS=I.TORNEOS_IDTORNEOS AND T.CLUBES_IDCLUBES = C.IDCLUBES AND I.JUGADORES_IDJUGADORES = J.IDJUGADORES AND J.USUARIOS_IDUSUARIOS = "+idUsuario+" and i.estado = 1 GROUP BY IDINSCRIPCIONES"; 
          PreparedStatement st = con.prepareStatement(sql);
          ResultSet rs = st.executeQuery();
          
          while(rs.next())
          {          
            Torneo torneo = new Torneo();
            torneo.setIdTorneo(rs.getInt("t.idtorneos"));
            torneo.setNombre(rs.getString("t.nombre"));
            torneo.setClub(rs.getString("c.nombre"));
            torneo.setFecha(rs.getString("t.fecha"));
            lista.add(torneo);     
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
     
      public void desactivarInscripcion(int idTorneo,int idJugador)
    {
        try
        {            
            abrirConexion();
            String sql = "UPDATE inscripciones i set i.estado = 0 where torneos_idtorneos = "+idTorneo+" and jugadores_idjugadores ="+idJugador;
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
       
        public boolean existeInscripcion(int idTorneo,int idJugador)
    {
        boolean inscripto = false;
        try
        {            
            abrirConexion();
            String sql = "SELECT * from inscripciones where torneos_idtorneos = "+idTorneo+" and jugadores_idjugadores = "+idJugador;
            PreparedStatement st = con.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if(rs.next())
            {
                inscripto = true;
            }
            else {
                inscripto = false;
            }
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
        return inscripto;
    }
        
        
         public List<Jugador> getInscripcionesPorTorneo(int idTorneo)
    {
        ArrayList<Jugador> lista = new ArrayList();
        try
        {
          abrirConexion();
          String sql = "SELECT j.idjugadores, j.nombre,j.apellido FROM inscripciones i inner join jugadores j on j.idjugadores = i.jugadores_idjugadores where i.estado = 1 and i.torneos_idtorneos = "+idTorneo;
          PreparedStatement st = con.prepareStatement(sql);
          ResultSet rs = st.executeQuery();
          
          while(rs.next())
          {          
            Jugador club = new Jugador();
            club.setIdJugador(rs.getInt("idjugadores"));
            club.setNombre(rs.getString("j.nombre"));
            club.setApellido(rs.getString("j.apellido"));
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

    public List<Inscripcion> limitePorLinea(int idTorneo,String fecha)
    {
        ArrayList<Inscripcion> lista = new ArrayList();

        try
        {
            abrirConexion();
            String sql = "SELECT idinscripciones,hora_inicio from inscripciones where torneos_idtorneos = "+idTorneo+" and hora_inicio = '"+fecha+"'";
            PreparedStatement st = con.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while(rs.next())
            {
                Inscripcion in = new Inscripcion();
                in.setIdInscripcion(rs.getInt("idinscripciones"));
                in.setHoraInicio(rs.getString("hora_inicio"));

                lista.add(in);
            }

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
        return lista;
    }
}
