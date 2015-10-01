/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.ServicioInscripciones;
import DAO.ServicioResultados;
import Model.Jugador;
import Model.Resultado;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author juanleyba
 */
public class ResultadosController {
    private ServicioInscripciones si = new ServicioInscripciones();
    private ServicioResultados sr = new ServicioResultados();
    
    public List<Jugador> listaJugadoresInscriptosPorTorneo(int idTorneo)
    {
        List<Jugador> listaJugadores =(ArrayList) si.getInscripcionesPorTorneo(idTorneo);
        return listaJugadores;
    }
    
    public void agregarResultado (int idTorneo,int idJugador, int categoria,int acumulado,int handicap)
    {
        Resultado r = new Resultado(acumulado,handicap,idJugador,idTorneo,categoria);
        sr.addResultado(r);
    }
    
    public void actualizarResultado (int idResultado,int idTorneo,int idJugador, int categoria,int acumulado,int handicap)
    {
        Resultado r = new Resultado(idResultado,acumulado,handicap,idJugador,idTorneo,categoria);
        sr.updateResultado(r);
    }
    
    public List<Resultado> listaResultadosPorTorneoPorCategoria(int idTorneo,int idCategoria)
    {
        List<Resultado> listaResultados =(ArrayList) sr.getResultadosPorTorneoPorCategoria(idTorneo,idCategoria);
        return listaResultados;
    }
    
    public List<Resultado> listaResultadosPorTorneo(int idTorneo)
    {
        List<Resultado> listaResultados =(ArrayList) sr.getResultadosPorTorneo(idTorneo);
        return listaResultados;
    }
}
