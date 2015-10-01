<%-- 
    Document   : imprimir
    Created on : 10-sep-2015, 23:58:47
    Author     : juanleyba
--%>

<%@page import="Model.Administrador"%>
<%@page import="Controller.AdminController"%>
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
            Object user = session.getAttribute("usuario");
            AdminController cc = new AdminController();
            Administrador admin = (Administrador)user;
            ReportesController rc = new ReportesController();
                        
            Font fontbold = FontFactory.getFont("Helvetica", 16, Font.BOLD);
            Paragraph tituloScratch = new Paragraph("Socios",fontbold);
            tituloScratch.setAlignment(Element.ALIGN_CENTER);
           
            tituloScratch.setSpacingAfter(20);
           
            
            Document document = new Document();
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            PdfWriter.getInstance(document, baos);
            document.open();
            
            
            
            document.add(tituloScratch);
            document.add(rc.crearTablaJugadores(admin));
            
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
