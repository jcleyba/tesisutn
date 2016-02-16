<%-- 
    Document   : agregarResultado
    Created on : 10-sep-2015, 14:38:08
    Author     : juanleyba
--%>

<%@page import="Controller.ResultadosController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int idTorneo = Integer.parseInt(request.getParameter("idTorneo"));
    int idResultado = Integer.parseInt(request.getParameter("idResultado"));
    int idJugador = Integer.parseInt(request.getParameter("comboInscriptos"));
    int handicap = Integer.parseInt(request.getParameter("handicapTxt"));
    int categoria = 0;
    if(handicap <= 0)
    {
        categoria = 1;
    }
    else if(handicap >= 0 && handicap <= 9)
    {
        categoria = 2;
    }
    else if(handicap >= 0 && handicap <= 9)
    {
        categoria = 2;
    }
    else if(handicap >= 10 && handicap <= 16)
    {
        categoria = 3;
    }
    else if(handicap >= 17 && handicap <= 24)
    {
        categoria = 4;
    }
    else
    {
        categoria = 5;
    }
    
    int hoyo1 = Integer.parseInt(request.getParameter("hoyo1"));
    int hoyo2 = Integer.parseInt(request.getParameter("hoyo2"));
    int hoyo3 = Integer.parseInt(request.getParameter("hoyo3"));
    int hoyo4 = Integer.parseInt(request.getParameter("hoyo4"));
    int hoyo5 = Integer.parseInt(request.getParameter("hoyo5"));
    int hoyo6 = Integer.parseInt(request.getParameter("hoyo6"));
    int hoyo7 = Integer.parseInt(request.getParameter("hoyo7"));
    int hoyo8 = Integer.parseInt(request.getParameter("hoyo8"));
    int hoyo9 = Integer.parseInt(request.getParameter("hoyo9"));
    int hoyo10 = Integer.parseInt(request.getParameter("hoyo10"));
    int hoyo11 = Integer.parseInt(request.getParameter("hoyo11"));
    int hoyo12 = Integer.parseInt(request.getParameter("hoyo12"));
    int hoyo13 = Integer.parseInt(request.getParameter("hoyo13"));
    int hoyo14 = Integer.parseInt(request.getParameter("hoyo14"));
    int hoyo15 = Integer.parseInt(request.getParameter("hoyo15"));
    int hoyo16 = Integer.parseInt(request.getParameter("hoyo16"));
    int hoyo17 = Integer.parseInt(request.getParameter("hoyo17"));
    int hoyo18 = Integer.parseInt(request.getParameter("hoyo18"));
    
    int acumulado = hoyo1+hoyo2+hoyo3+hoyo4+hoyo5+hoyo6+hoyo7+hoyo8+hoyo9+hoyo10+hoyo11+hoyo12+hoyo13+hoyo14+hoyo15+hoyo16+hoyo17+hoyo18;
    
    ResultadosController rc = new ResultadosController();
    rc.actualizarResultado(idResultado,idTorneo,idJugador,categoria,acumulado,handicap);
    
    response.sendRedirect("index.jsp");
%>
