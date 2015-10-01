/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.Administrador;
import Model.Jugador;
import Model.Resultado;
import Model.Torneo;
import com.itextpdf.text.*;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author juanleyba
 */
public class ReportesController {
    
    public PdfPTable createFirstTable(int idTorneo) throws ParseException {
       
        TorneosController tc = new TorneosController();
        Torneo t = tc.getTorneoPorId(idTorneo);
        ArrayList listaCells = tc.tablaHorariosTorneo(idTorneo);
        
    	// a table with three columns
        PdfPTable table = new PdfPTable(t.getJugadoresPorLinea()+1);
        // the cell object
        PdfPCell cell = new PdfPCell();
        
        for(Object item:listaCells)
        {
            cell = new PdfPCell(new Phrase(String.valueOf(item)));
            table.addCell(cell);
        }
        return table;
    }
    
    public PdfPTable crearTablaPorCategoría(int idTorneo,List<Resultado> lista) throws ParseException {
       
        List<Resultado> listaResultados = lista;
    	// a table with three columns
        PdfPTable table = new PdfPTable(4);
        // the cell object
        PdfPCell cell = new PdfPCell(new Phrase("JUGADOR"));
        PdfPCell cell1 = new PdfPCell(new Phrase("SCORE GROSS"));
        PdfPCell cell2 = new PdfPCell(new Phrase("HANDICAP"));
        PdfPCell cell3 = new PdfPCell(new Phrase("SCORE NETO"));
        table.addCell(cell);
        table.addCell(cell1);
        table.addCell(cell2);
        table.addCell(cell3);
        
       for(Resultado item:lista)
       {
           cell = new PdfPCell(new Phrase(item.getNombreJugador() +" "+ item.getApellidoJugador()));
            cell1 = new PdfPCell(new Phrase(String.valueOf(item.getSumaHoyos())));
            cell2 = new PdfPCell(new Phrase(String.valueOf(item.getHandicap())));
            cell3 = new PdfPCell(new Phrase(String.valueOf(item.getScoreNeto())));
            table.addCell(cell);
            table.addCell(cell1);
            table.addCell(cell2);
            table.addCell(cell3);
       }

        return table;
    }

    public PdfPTable crearTablaJugadores(Administrador admin) throws ParseException {
       
        AdminController ac = new AdminController();
        List<Jugador> listaJugadores = ac.obtenerJugadoresPorClub(admin);
        Font fontbold = FontFactory.getFont("Helvetica", 13, Font.BOLD);

        PdfPTable table = new PdfPTable(3);
        PdfPCell cell = new PdfPCell(new Phrase("Apellido",fontbold));
        PdfPCell cell2 = new PdfPCell(new Phrase("Nombre",fontbold));
        PdfPCell cell3= new PdfPCell(new Phrase("Matricula",fontbold));
                
             table.addCell(cell);
            table.addCell(cell2);
            table.addCell(cell3);
        
        for(Jugador item:listaJugadores)
        {
            cell = new PdfPCell(new Phrase(item.getApellido()));
            cell2 = new PdfPCell(new Phrase(item.getNombre()));
            cell3 = new PdfPCell(new Phrase(String.valueOf(item.getMatricula())));
            
            table.addCell(cell);
            table.addCell(cell2);
            table.addCell(cell3);
        }
        return table;
    }
}
