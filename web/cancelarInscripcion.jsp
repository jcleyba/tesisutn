<%-- 
    Document   : agregarUser
    Created on : 19-ago-2015, 23:49:24
    Author     : juanleyba
--%>

<%@page import="Controller.TorneosController"%>
<%@page import="Controller.UsuarioController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    
    int idTorneo = Integer.parseInt(request.getParameter("idTorneo"));
    int idUsuario = Integer.parseInt(request.getParameter("idUsuario"));
    TorneosController tc = new TorneosController();
    tc.desactivarInscripcion(idTorneo,idUsuario);
    response.sendRedirect("misinscripciones.jsp?id="+idUsuario);
%>
 