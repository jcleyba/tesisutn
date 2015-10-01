<%-- 
    Document   : login
    Created on : 20-ago-2015, 22:13:33
    Author     : juanleyba
--%>

<%@page import="Model.Usuario"%>
<%@page import="Model.Jugador"%>
<%@page import="Controller.UsuarioController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

       <% 
        int idJugador = Integer.parseInt(request.getParameter("id"));
        
        UsuarioController bc = new UsuarioController();
        bc.desactivarJugador(idJugador);
       
            response.sendRedirect("index.jsp");
        
        %>