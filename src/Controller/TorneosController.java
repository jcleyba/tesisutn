/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.ServicioClubes;
import DAO.ServicioInscripciones;
import DAO.ServicioJugadores;
import DAO.ServicioTorneos;
import Model.Club;
import Model.Inscripcion;
import Model.Intervalo;
import Model.Jugador;
import Model.TipoTorneo;
import Model.Torneo;
import Model.Usuario;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;

/**
 *
 * @author juanleyba
 */
public class TorneosController {
    
    static final long ONE_MINUTE_IN_MILLISECONDS = 60000;
    ServicioTorneos st = new ServicioTorneos();
    public List<Intervalo> listarIntervalos()
    {
        ArrayList<Intervalo> listaIntervalos = new ArrayList();
        ServicioTorneos sc = new ServicioTorneos();
        listaIntervalos = (ArrayList<Intervalo>) sc.getIntervalos();
        return listaIntervalos;
    }
    
    public List<TipoTorneo> listarTipos()
    {
        ArrayList<TipoTorneo> listaTipos = new ArrayList();
        ServicioTorneos sc = new ServicioTorneos();
        listaTipos = (ArrayList<TipoTorneo>) sc.getTipoTorneo();
        return listaTipos;
    }
    
    public void agregarTorneo(String nombre, String fecha, int jugadores,int intervalo, int idclub,int tipo,String horainicio, String horacierre)
    {
       
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        String fechafinal = null;
    try {
		Date date = formatter.parse(fecha);
		fechafinal = formatter.format(date);
		System.out.println(formatter.format(date));

	} catch (ParseException e) {
		e.printStackTrace();
	}
    
    String horaInicio = null;
    SimpleDateFormat timeformatter = new SimpleDateFormat("yyyy-MM-dd HH:mm");		
		
	try {

		Date date = timeformatter.parse(fecha +" "+horainicio);
		horaInicio = timeformatter.format(date);
		System.out.println(formatter.format(date));

	} catch (ParseException e) {
		e.printStackTrace();
	}
    String horaCierre = null;
    SimpleDateFormat othertimeformatter = new SimpleDateFormat("yyyy-MM-dd HH:mm");		
		
	try {

		Date date = othertimeformatter.parse(fecha+" "+horacierre);
		horaCierre = othertimeformatter.format(date);
		System.out.println(formatter.format(date));

	} catch (ParseException e) {
		e.printStackTrace();
	}
        
        ServicioTorneos st = new ServicioTorneos();
        Torneo torneo = new Torneo(nombre,fechafinal,jugadores,intervalo,idclub,tipo, horaInicio, horaCierre);
        st.addTorneo(torneo);
    }
    
     public List<Torneo> listarTorneos(int idclub)
    {
        ArrayList<Torneo> listaTorneos = new ArrayList();
        ServicioTorneos st = new ServicioTorneos();
        listaTorneos = (ArrayList<Torneo>) st.getTorneosPorId(idclub);
        return listaTorneos;
    }
     
      public List<Torneo> listarProximosTorneos()
    {
        ArrayList<Torneo> listaTorneos = new ArrayList();
        ServicioTorneos st = new ServicioTorneos();
        listaTorneos = (ArrayList<Torneo>) st.getProximosTorneos();
        return listaTorneos;
    }

    public List<Torneo> listarTorneosPrevios()
    {
        ArrayList<Torneo> listaTorneos = new ArrayList();
        ServicioTorneos st = new ServicioTorneos();
        listaTorneos = (ArrayList<Torneo>) st.getTorneosJugados();
        return listaTorneos;
    }

    public List<Torneo> listarProximosTorneosPorClub(int idClub)
    {
        ArrayList<Torneo> listaTorneos = new ArrayList();
        ServicioTorneos st = new ServicioTorneos();
        listaTorneos = (ArrayList<Torneo>) st.getProximosTorneosPorClub(idClub);
        return listaTorneos;
    }   
      
      
      public List<Date> calcularHorariosPorTorneo(int idTorneo) throws ParseException
    {
        ArrayList<Date> listaHorarios = new ArrayList();
        ServicioTorneos st = new ServicioTorneos();
        Torneo torneo = st.getHorarios(idTorneo);
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        Date horaInicio = null;
        Date horaCierre = null;
        try
        {
                 horaInicio = formatter.parse(torneo.getHoraInicio());
                 horaCierre = formatter.parse(torneo.getHoraCierre());

        }
        catch(Exception e)
        {
            System.out.println("Error:"+e);
        }
        
        long ini = horaInicio.getTime();
        long fin = horaCierre.getTime();
        
        long acumulador = ini -(torneo.getValorIntervalo() * ONE_MINUTE_IN_MILLISECONDS);
        
        
        while(acumulador < fin)
        {         
            acumulador = acumulador +(torneo.getValorIntervalo() * ONE_MINUTE_IN_MILLISECONDS);
            Date acumulada = new Date(acumulador);
            listaHorarios.add(acumulada);
        }
        
        return listaHorarios;
    }
      
    public void agregarInscripcion(String hora_inicio,String idJugador, String idTorneo)
    {
       long segundos = Long.parseLong(hora_inicio);
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        Date hora = new Date(segundos);
        String horafinal = formatter.format(hora);  
        int j = Integer.parseInt(idJugador);
        int t = Integer.parseInt(idTorneo);

        Inscripcion i = new Inscripcion(horafinal,true,j,t);
        ServicioInscripciones si = new ServicioInscripciones();
        si.addInscripcion(i);
    }
    
    public Torneo getTorneoPorId(int idTorneo)
    {
        ServicioTorneos st = new ServicioTorneos();
        Torneo t = st.getTorneoPorId(idTorneo);
        return t;
    }
    
    public String fechaOrdenada(String fecha) throws ParseException
    {
        String fechaTorneo = "";
       try
       {
           SimpleDateFormat formatter =new SimpleDateFormat("yyyy-MM-dd HH:mm", new Locale("es","ES"));
           
           Date date = formatter.parse(fecha);
           formatter.applyPattern("dd MMM yyyy");
           fechaTorneo = formatter.format(date);
       }
       catch(Exception e)
       {
           System.out.println("Error: "+e);
       }
        
        return fechaTorneo;
    }
    
    public List<Jugador> getInscripcionesPorFechaPorTorneo(long fecha,int idTorneo)
    {
        ServicioInscripciones st = new ServicioInscripciones();
        ArrayList<Jugador> listaHorarios = new ArrayList();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        Date date = new Date(fecha);
        String fechaString = formatter.format(date);
        listaHorarios = (ArrayList<Jugador>)st.getInscripcionesPorFecha(fechaString, idTorneo);
        return listaHorarios;
    }
    
    public boolean posibleInscribirse(Torneo t, Usuario user)
    {
        boolean posible = false;
        if(user != null){
        
        int tipoTorneo = t.getTipoTorneo();
        int idClubUsuario = user.getIdClub();
        int idClubTorneo = t.getIdClub();
        
        if(tipoTorneo == 2){
            posible = false;
        }
        else if(tipoTorneo == 1){
            posible = true;
        }
        else if(tipoTorneo == 3 && idClubUsuario == idClubTorneo){
            posible = true;
        }
        else {
            posible = false;
        }
        }
        return posible;
    }
    
    public void actualizarTorneo(int idTorneo,String nombre, String fecha, int jugadores,int intervalo, int idclub,int tipo,String horainicio, String horacierre)
    {
       
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        String fechafinal = null;
    try {
		Date date = formatter.parse(fecha);
		fechafinal = formatter.format(date);
		System.out.println(formatter.format(date));

	} catch (ParseException e) {
		e.printStackTrace();
	}
    
    String horaInicio = null;
    SimpleDateFormat timeformatter = new SimpleDateFormat("yyyy-MM-dd HH:mm");		
		
	try {

		Date date = timeformatter.parse(fecha +" "+horainicio);
		horaInicio = timeformatter.format(date);
		System.out.println(formatter.format(date));

	} catch (ParseException e) {
		e.printStackTrace();
	}
    String horaCierre = null;
    SimpleDateFormat othertimeformatter = new SimpleDateFormat("yyyy-MM-dd HH:mm");		
		
	try {

		Date date = othertimeformatter.parse(fecha+" "+horacierre);
		horaCierre = othertimeformatter.format(date);
		System.out.println(formatter.format(date));

	} catch (ParseException e) {
		e.printStackTrace();
	}
        
        
        Torneo torneo = new Torneo(idTorneo,nombre,fechafinal,jugadores,intervalo,idclub,tipo, horaInicio, horaCierre);
        st.updateTorneo(torneo);
    }
    
    public void cerrarTorneo(int idTorneo){
        
        st.cerrarTorneo(idTorneo);
    }
    
    public List<Torneo> listarInscripcionesPorUsuario(int idUsuario)
    {
        ArrayList<Torneo> listaTorneos = new ArrayList();
        ServicioInscripciones si = new ServicioInscripciones();
        listaTorneos =(ArrayList)si.getInscripcionesPorUsuario(idUsuario);
        
        return listaTorneos;
    }
    
    public void desactivarInscripcion(int idTorneo, int idUsuario)
    {
        ServicioJugadores sj = new ServicioJugadores();
        Jugador j = sj.jugadorPorIdUsuario(idUsuario);
        ServicioInscripciones si = new ServicioInscripciones();
        si.desactivarInscripcion(idTorneo, j.getIdJugador());
    }
    
    public boolean inscripto(int idTorneo, int idJugador)
    {
        ServicioInscripciones si = new ServicioInscripciones();
        return si.existeInscripcion(idTorneo, idJugador);
    }
    
    public ArrayList tablaHorariosTorneo(int idTorneo) throws ParseException
    {
        ArrayList listaTTT = new ArrayList();
        ServicioTorneos st = new ServicioTorneos();
        Torneo torneo = st.getTorneoPorId(idTorneo);
        TorneosController tc = new TorneosController();
        List<Date> horariosTorneo = tc.calcularHorariosPorTorneo(idTorneo);
        
        for(Date item : horariosTorneo)
        {
            int minutes = item.getMinutes();
            String minutesStr = "";
            if(minutes<10)
            {
                minutesStr = "0"+String.valueOf(minutes);
            }
            else{
                minutesStr = String.valueOf(minutes);
            }
                
                    
            listaTTT.add(item.getHours()+":"+minutesStr);
            List<Jugador> listaJugadores = tc.getInscripcionesPorFechaPorTorneo(item.getTime(), idTorneo);
            String[] nombres = new String[torneo.getJugadoresPorLinea()];
            for(int i = 0;i<nombres.length;i++)
            {
                nombres[i] = "";
            }
            
            if(listaJugadores.size()>0)
            {
                for(int i=0;i<listaJugadores.size();i++)
                {      
                    nombres[i] = listaJugadores.get(i).getNombre() + listaJugadores.get(i).getApellido();
                }
            }
            for(String nombre : nombres)
            {
                listaTTT.add(nombre);
            }
        }
        
        
        return listaTTT;
                
    }
}
