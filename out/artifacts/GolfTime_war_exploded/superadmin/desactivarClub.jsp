<%-- 
    Document   : login
    Created on : 20-ago-2015, 22:13:33
    Author     : juanleyba
--%>

<%@page import="Controller.ClubesController"%>
<%@page import="Model.Usuario"%>
<%@page import="Model.Jugador"%>
<%@page import="Controller.UsuarioController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

       <% 
        int idClub = Integer.parseInt(request.getParameter("id"));
        
        ClubesController bc = new ClubesController();
        bc.desactivarClub(idClub);
       
            response.sendRedirect("index.jsp");
        
        %>