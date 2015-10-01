/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.Club;
import Model.Intervalo;
import Model.Resultado;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author juanleyba
 */
public class ServicioResultados extends ServicioBase {
    
    public void addResultado(Resultado r)
    {
        ResultSet rs = null;
        try
        {            
            abrirConexion();
            String sql = "INSERT INTO resultados (sumahoyos,handicap,jugadores_idjugadores,categoriasportorneo_torneos_idtorneos,categoriasportorneo_categorias_idcategorias) VALUES("+r.getSumaHoyos()+","+r.getHandicap()+","+r.getIdJugador()+","+r.getIdTorneo()+","+r.getIdCategoria()+")"; 
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
    
    public List<Resultado> getResultadosPorTorneoPorCategoria(int idTorneo, int idCategoria)
    {
        ArrayList<Resultado> lista = new ArrayList();
        try
        {
          abrirConexion();
          String sql = "SELECT R.IDRESULTADOS, J.NOMBRE, J.APELLIDO, R.SUMAHOYOS, R.HANDICAP, SUM(R.SUMAHOYOS - R.HANDICAP) FROM RESULTADOS R INNER JOIN JUGADORES J ON J.IDJUGADORES = R.JUGADORES_IDJUGADORES WHERE R.CATEGORIASPORTORNEO_TORNEOS_IDTORNEOS = "+idTorneo+" AND R.CATEGORIASPORTORNEO_CATEGORIAS_IDCATEGORIAS = "+idCategoria+" GROUP BY J.NOMBRE, J.APELLIDO, R.SUMAHOYOS, R.HANDICAP ORDER BY 6";
          PreparedStatement st = con.prepareStatement(sql);
          ResultSet rs = st.executeQuery();
          
          while(rs.next())
          {          
            Resultado resu = new Resultado();
            resu.setIdResultado(rs.getInt("R.IDRESULTADOS"));
            resu.setNombreJugador(rs.getString("J.NOMBRE"));
            resu.setApellidoJugador(rs.getString("J.APELLIDO"));
            resu.setSumaHoyos(rs.getInt("R.SUMAHOYOS"));
            resu.setHandicap(rs.getInt("R.HANDICAP"));
            resu.setScoreNeto(rs.getInt(6));
            lista.add(resu);     
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
    
    public List<Resultado> getResultadosPorTorneo(int idTorneo)
    {
        ArrayList<Resultado> lista = new ArrayList();
        try
        {
          abrirConexion();
          String sql = "SELECT R.IDRESULTADOS, J.NOMBRE, J.APELLIDO, R.SUMAHOYOS, R.HANDICAP, SUM(R.SUMAHOYOS - R.HANDICAP) FROM RESULTADOS R INNER JOIN JUGADORES J ON J.IDJUGADORES = R.JUGADORES_IDJUGADORES WHERE R.CATEGORIASPORTORNEO_TORNEOS_IDTORNEOS = "+idTorneo+" GROUP BY J.NOMBRE, J.APELLIDO, R.SUMAHOYOS, R.HANDICAP ORDER BY 6";
          PreparedStatement st = con.prepareStatement(sql);
          ResultSet rs = st.executeQuery();
          
          while(rs.next())
          {          
            Resultado resu = new Resultado();
            resu.setIdResultado(rs.getInt("R.IDRESULTADOS"));
            resu.setNombreJugador(rs.getString("J.NOMBRE"));
            resu.setApellidoJugador(rs.getString("J.APELLIDO"));
            resu.setSumaHoyos(rs.getInt("R.SUMAHOYOS"));
            resu.setHandicap(rs.getInt("R.HANDICAP"));
            resu.setScoreNeto(rs.getInt(6));
            lista.add(resu);     
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
    
    public void updateResultado(Resultado r)
    {
        ResultSet rs = null;
        try
        {            
            abrirConexion();
            String sql = "UPDATE resultados set sumahoyos ="+r.getSumaHoyos()+","
                    + "      handicap = "+r.getHandicap()+","
                    + "      jugadores_idjugadores = "+ r.getIdJugador()+","
                    + "      categoriasportorneo_torneos_idtorneos = "+r.getIdTorneo()+","
                    + "      categoriasportorneo_categorias_idcategorias = "+r.getIdCategoria()+" where idresultados ="+r.getIdResultado();
                                                                       
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
