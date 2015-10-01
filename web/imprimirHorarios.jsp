<%-- 
    Document   : imprimir
    Created on : 10-sep-2015, 23:58:47
    Author     : juanleyba
--%>

<%@page import="Model.Torneo"%>
<%@page import="Controller.TorneosController"%>
<%@page import="Controller.ResultadosController"%>
<%@page import="Controller.ReportesController"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.OutputStream"%>
<%@page import="com.itextpdf.text.pdf.PdfWriter"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="com.itextpdf.text.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
            
            ReportesController rc = new ReportesController();
            TorneosController tc = new TorneosController();
            int idTorneo = Integer.parseInt(request.getParameter("idTorneo"));
            Torneo torneo = tc.getTorneoPorId(idTorneo);
                        
            Font fontbold = FontFactory.getFont("Helvetica", 16, Font.BOLD);
            Paragraph tituloScratch = new Paragraph("Horarios",fontbold);
            tituloScratch.setAlignment(Element.ALIGN_CENTER);
           
            tituloScratch.setSpacingAfter(20);
           
            Paragraph nombreTorneo = new Paragraph("Torneo: "+torneo.getNombre(), fontbold);
            nombreTorneo.setAlignment(Element.ALIGN_CENTER);
            nombreTorneo.setSpacingAfter(10);
            
            Paragraph fechaTorneo = new Paragraph("Fecha: "+tc.fechaOrdenada(torneo.getFecha()),fontbold);
            fechaTorneo.setAlignment(Element.ALIGN_CENTER);
            fechaTorneo.setSpacingAfter(10);
            
            Document document = new Document();
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            PdfWriter.getInstance(document, baos);
            document.open();
            
            document.add(nombreTorneo);
            document.add(fechaTorneo);
            
            document.add(tituloScratch);
            document.add(rc.createFirstTable(idTorneo));
            
            document.close();
 
            // setting some response headers
            response.setHeader("Expires", "0");
            response.setHeader("Cache-Control",
                "must-revalidate, post-check=0, pre-check=0");
            response.setHeader("Pragma", "public");
            // setting the content type
            response.setContentType("application/pdf");
            // the contentlength
            response.setContentLength(baos.size());
            // write ByteArrayOutputStream to the ServletOutputStream
            OutputStream os = response.getOutputStream();
            baos.writeTo(os);
            os.flush();
            os.close();
      
 
%>
