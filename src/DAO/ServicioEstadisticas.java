package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 * Created by juanleyba on 6/10/15.
 */
public class ServicioEstadisticas extends ServicioBase {

    public ArrayList getEstadísticasHistoricasJugador(int idJugador)
    {
        ArrayList lista = new ArrayList();
        try
        {
            abrirConexion();
            String sql = "SELECT avg(sumahoyos) as 'Promedio Score', avg(handicap) as 'Promedio Handicap', count(idresultados) as 'Torneos jugados' from resultados where jugadores_idjugadores = "+idJugador;
            PreparedStatement st = con.prepareStatement(sql);
            ResultSet rs = st.executeQuery();

            while(rs.next())
            {
                lista.add(rs.getFloat(1));
                lista.add(rs.getFloat(2));
                lista.add(rs.getFloat(3));
            }

            rs.close();
            st.close();
        }
        catch(Exception e)
        {
            System.out.println("Error al obtener estadísticas. Causa: " + e.getMessage());
        }
        finally
        {
            cerrarConexion();
        }

        return lista;
    }

    public ArrayList getEstadisticasPorMesPorJugador(int idJugador)
    {

        ArrayList listaSalida = new ArrayList();
        try
        {
            abrirConexion();
            String sql = "SET lc_time_names = 'es_UY'";
            String sql2 = "SELECT MONTHNAME(t.fecha),avg(sumahoyos) as 'Promedio Score', avg(handicap) as 'Promedio Handicap', count(idresultados) as 'Torneos jugados' from resultados inner join torneos t on idtorneos = categoriasportorneo_torneos_idtorneos where jugadores_idjugadores = "+idJugador+" group by 1 order by 1 desc";
            PreparedStatement st = con.prepareStatement(sql);
            st.executeQuery();
            PreparedStatement st2 = con.prepareStatement(sql2);
            ResultSet rs = st2.executeQuery();
            while(rs.next())
            {
                ArrayList listaMixta = new ArrayList();
                listaMixta.add(rs.getString(1).toString());
                listaMixta.add(rs.getFloat(2));
                listaMixta.add(rs.getFloat(3));
                listaMixta.add(rs.getFloat(4));
                listaSalida.add(listaMixta);
            }

            rs.close();
            st.close();
        }
        catch(Exception e)
        {
            System.out.println("Error al obtener estadísticas. Causa: " + e.getMessage());
        }
        finally
        {
            cerrarConexion();
        }

        return listaSalida;
    }

    public ArrayList getEstadisticasGeneralesPorClub(int idClub)
    {

        ArrayList listaSalida = new ArrayList();
        try
        {
            abrirConexion();
            String sql = "select AVG(inscripciones),COUNT(torneosjugados) from (SELECT COUNT(idinscripciones) as 'inscripciones',i.torneos_idtorneos as 'torneosjugados' FROM inscripciones i inner join torneos t on i.torneos_idtorneos = t.idtorneos where t.clubes_idclubes = "+idClub+" group by 2) as Tabla";
            PreparedStatement st = con.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while(rs.next())
            {

                listaSalida.add(rs.getFloat(1));
                listaSalida.add(rs.getFloat(2));
            }

            rs.close();
            st.close();
        }
        catch(Exception e)
        {
            System.out.println("Error al obtener estadísticas. Causa: " + e.getMessage());
        }
        finally
        {
            cerrarConexion();
        }

        return listaSalida;
    }

    public ArrayList getEstadisticasPorMesPorClub(int idClub, int anio)
    {

        ArrayList listaSalida = new ArrayList();
        try
        {
            abrirConexion();
            String sql = "SET lc_time_names = 'es_UY'";
            String sql2 = "SELECT MONTHNAME (T.FECHA),COUNT(T.IDTORNEOS) AS CANT_TORNEOS, SUM(I.CANT_INSC) AS CANT_INSCRIPCIONES,(SUM(I.CANT_INSC)/COUNT(T.IDTORNEOS)) \n" +
                    "FROM TORNEOS T \n" +
                    "INNER JOIN (SELECT COUNT(IDINSCRIPCIONES) AS CANT_INSC, TORNEOS_IDTORNEOS \n" +
                    "            FROM inscripciones \n" +
                    "            GROUP BY TORNEOS_IDTORNEOS) AS I ON I.TORNEOS_IDTORNEOS = T.IDTORNEOS \n" +
                    "WHERE T.CLUBES_IDCLUBES = "+idClub+" and YEAR(T.FECHA) = "+anio+" GROUP BY 1 order by 1 desc";
            PreparedStatement st = con.prepareStatement(sql);
            st.executeQuery();
            PreparedStatement st2 = con.prepareStatement(sql2);
            ResultSet rs = st2.executeQuery();
            while(rs.next())
            {
                ArrayList listaMixta = new ArrayList();
                listaMixta.add(rs.getString(1).toString());
                listaMixta.add(rs.getFloat(2));
                listaMixta.add(rs.getFloat(3));
                listaMixta.add(rs.getFloat(4));
                listaSalida.add(listaMixta);
            }

            rs.close();
            st.close();
        }
        catch(Exception e)
        {
            System.out.println("Error al obtener estadísticas. Causa: " + e.getMessage());
        }
        finally
        {
            cerrarConexion();
        }

        return listaSalida;
    }

    public ArrayList getEstadisticasPorMesPorClubTorneoAbierto(int idClub, int anio)
    {

        ArrayList listaSalida = new ArrayList();
        try
        {
            abrirConexion();
            String sql = "SELECT COUNT(IDTORNEOS), TIPOSTORNEO_IDTIPOSTORNEO FROM TORNEOS WHERE CLUBES_IDCLUBES = "+idClub+" AND YEAR(TORNEOS.FECHA) = "+anio+" GROUP BY 2";
            PreparedStatement st = con.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while(rs.next())
            {
                listaSalida.add(rs.getFloat(1));
            }

            rs.close();
            st.close();
        }
        catch(Exception e)
        {
            System.out.println("Error al obtener estadísticas. Causa: " + e.getMessage());
        }
        finally
        {
            cerrarConexion();
        }

        return listaSalida;
    }
    public float getEstadisticasNoSocios(int idClub, int anio)
    {

        float salida = 0;
        try
        {
            abrirConexion();
            String sql = "SELECT COUNT(U.CLUBES_IDCLUBES) FROM INSCRIPCIONES INNER JOIN (SELECT * FROM TORNEOS WHERE CLUBES_IDCLUBES = "+idClub+" AND TIPOSTORNEO_IDTIPOSTORNEO = 1 ) AS I ON I.IDTORNEOS = TORNEOS_IDTORNEOS INNER JOIN JUGADORES J ON J.IDJUGADORES = INSCRIPCIONES.JUGADORES_IDJUGADORES INNER JOIN USUARIOS U ON U.IDUSUARIOS = J.USUARIOS_IDUSUARIOS WHERE U.CLUBES_IDCLUBES !="+idClub+" AND YEAR(I.FECHA) = "+anio;
            PreparedStatement st = con.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while(rs.next())
            {
                salida = rs.getFloat(1);
            }

            rs.close();
            st.close();
        }
        catch(Exception e)
        {
            System.out.println("Error al obtener estadísticas. Causa: " + e.getMessage());
        }
        finally
        {
            cerrarConexion();
        }

        return salida;
    }

    public float getEstadisticasSocios(int idClub, int anio)
    {

        float salida = 0;
        try
        {
            abrirConexion();
            String sql = "SELECT COUNT(U.CLUBES_IDCLUBES) FROM INSCRIPCIONES INNER JOIN (SELECT * FROM TORNEOS WHERE CLUBES_IDCLUBES = 1 AND TIPOSTORNEO_IDTIPOSTORNEO = "+idClub+" ) AS I ON I.IDTORNEOS = TORNEOS_IDTORNEOS INNER JOIN JUGADORES J ON J.IDJUGADORES = INSCRIPCIONES.JUGADORES_IDJUGADORES INNER JOIN USUARIOS U ON U.IDUSUARIOS = J.USUARIOS_IDUSUARIOS WHERE U.CLUBES_IDCLUBES ="+idClub+" AND YEAR(I.FECHA) = "+anio;
            PreparedStatement st = con.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while(rs.next())
            {
                salida = rs.getFloat(1);
            }

            rs.close();
            st.close();
        }
        catch(Exception e)
        {
            System.out.println("Error al obtener estadísticas. Causa: " + e.getMessage());
        }
        finally
        {
            cerrarConexion();
        }

        return salida;
    }
}


