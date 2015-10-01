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
            ResultadosController res = new ResultadosController();
            ReportesController rc = new ReportesController();
            TorneosController tc = new TorneosController();
            int idTorneo = Integer.parseInt(request.getParameter("idTorneo"));
            Torneo torneo = tc.getTorneoPorId(idTorneo);
                        
            Font fontbold = FontFactory.getFont("Helvetica", 16, Font.BOLD);
            Paragraph tituloScratch = new Paragraph("Scratch",fontbold);
            tituloScratch.setAlignment(Element.ALIGN_CENTER);
            Paragraph titulo0a9 = new Paragraph("0 a 9",fontbold);
            titulo0a9.setAlignment(Element.ALIGN_CENTER);
            Paragraph titulo10a16 = new Paragraph("10 a 16",fontbold);
            titulo10a16.setAlignment(Element.ALIGN_CENTER);
            Paragraph titulo17a24 = new Paragraph("17 a 24",fontbold);
            titulo17a24.setAlignment(Element.ALIGN_CENTER);
            Paragraph titulo25a36 = new Paragraph("25 a 36",fontbold);
            titulo25a36.setAlignment(Element.ALIGN_CENTER);
            tituloScratch.setSpacingAfter(20);
            titulo0a9.setSpacingAfter(20);
            titulo10a16.setSpacingAfter(20);
            titulo17a24.setSpacingAfter(20);
            titulo25a36.setSpacingAfter(20);
            
            Paragraph nombreTorneo = new Paragraph(torneo.getNombre(), fontbold);
            nombreTorneo.setAlignment(Element.ALIGN_CENTER);
            nombreTorneo.setSpacingAfter(10);
            
            Paragraph fechaTorneo = new Paragraph(tc.fechaOrdenada(torneo.getFecha()),fontbold);
            fechaTorneo.setAlignment(Element.ALIGN_CENTER);
            fechaTorneo.setSpacingAfter(10);
            
            Document document = new Document();
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            PdfWriter.getInstance(document, baos);
            document.open();
            
            document.add(nombreTorneo);
            document.add(fechaTorneo);
            
            document.add(tituloScratch);
            document.add(rc.crearTablaPorCategoría(idTorneo,res.listaResultadosPorTorneo(idTorneo)));
            document.add(titulo0a9);
            document.add(rc.crearTablaPorCategoría(idTorneo,res.listaResultadosPorTorneoPorCategoria(idTorneo,2)));
            document.add(titulo10a16);
            document.add(rc.crearTablaPorCategoría(idTorneo,res.listaResultadosPorTorneoPorCategoria(idTorneo,3)));
            document.add(titulo17a24);
            document.add(rc.crearTablaPorCategoría(idTorneo,res.listaResultadosPorTorneoPorCategoria(idTorneo,4)));
            document.add(titulo25a36);
            document.add(rc.crearTablaPorCategoría(idTorneo,res.listaResultadosPorTorneoPorCategoria(idTorneo,5)));
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
