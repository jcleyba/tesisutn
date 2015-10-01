<%-- 
    Document   : agregarTorneo
    Created on : 03-sep-2015, 21:36:22
    Author     : juanleyba
--%>

<%@page import="Controller.TorneosController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%    
        String nombre = new String(request.getParameter("nombreTxt").getBytes("ISO-8859-1"),"UTF-8");

        String fecha = request.getParameter("dateTxt");
        String horaInicioStr = request.getParameter("horaInicioTxt"); 
        String horaCierreStr = request.getParameter("horaCierreTxt"); 

        int cantidadJugadores = Integer.parseInt(request.getParameter("jugadoresTxt"));
        int tipoTorneo = Integer.parseInt(request.getParameter("comboTipoTorneo"));
        int intervalo = Integer.parseInt(request.getParameter("comboIntervalo"));
        int idclub = Integer.parseInt(request.getParameter("txtIdClub"));
        TorneosController tc = new TorneosController();
        tc.agregarTorneo(nombre,fecha,cantidadJugadores,intervalo,idclub,tipoTorneo,horaInicioStr,horaCierreStr);
        response.sendRedirect("index.jsp#torneos");
%>
