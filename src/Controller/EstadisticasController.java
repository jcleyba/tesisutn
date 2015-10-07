package Controller;

import DAO.ServicioEstadisticas;


import java.util.ArrayList;


/**
 * Created by juanleyba on 6/10/15.
 */
public class EstadisticasController {

    private ServicioEstadisticas servicio = new ServicioEstadisticas();

    public float[] estadisticasJugador(int idJugador)
    {
        ArrayList<Float> listaNumeral = servicio.getEstadísticasHistoricasJugador(idJugador);
        float[] floatArray = new float[listaNumeral.size()];
        int i = 0;

        for (Float f : listaNumeral) {
            floatArray[i++] = (f != null ? f : Float.NaN);
        }
        return floatArray;
    }

    public ArrayList estadisticasPorMes(int idJugador)
    {
        ArrayList listaMixta = servicio.getEstadisticasPorMesPorJugador(idJugador);

        return listaMixta;
    }

    public float[] estadisticasGeneralesPorClub(int idClub)
    {
        ArrayList<Float> listaNumeral = servicio.getEstadisticasGeneralesPorClub(idClub);
        float[] floatArray = new float[listaNumeral.size()];
        int i = 0;

        for (Float f : listaNumeral) {
            floatArray[i++] = (f != null ? f : Float.NaN);
        }
        return floatArray;
    }
}
