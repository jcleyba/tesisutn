<%-- 
    Document   : checkRol
    Created on : 26-ago-2015, 22:44:28
    Author     : juanleyba
--%>
<%@page import="Controller.UsuarioController"%>
<%@page import="Model.Jugador"%>
<%@page import="Model.Administrador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% 
    UsuarioController uc = new UsuarioController();
    Object user = session.getAttribute("usuario");
    boolean isAdmin = uc.isAdmin(user);
    if(user == null || !isAdmin )
    {
        response.sendRedirect("/administrador.jsp");
    }
%>