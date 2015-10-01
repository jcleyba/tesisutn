<%-- 
    Document   : login
    Created on : 20-ago-2015, 22:13:33
    Author     : juanleyba
--%>

<%@page import="Controller.TorneosController"%>
<%@page import="Model.Usuario"%>
<%@page import="Model.Jugador"%>
<%@page import="Controller.UsuarioController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

       <% 
        int idTorneo = Integer.parseInt(request.getParameter("id"));
        
        TorneosController bc = new TorneosController();
        bc.cerrarTorneo(idTorneo);
       
            response.sendRedirect("index.jsp");
        
        %>