<%-- 
    Document   : agregarAdmin
    Created on : 02-sep-2015, 15:58:13
    Author     : juanleyba
--%>

<%@page import="Controller.UsuarioController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    UsuarioController uc = new UsuarioController();
    String username = request.getParameter("txtUsername");
    String password = request.getParameter("txtPassword");
    String email = request.getParameter("txtEmail");
    int club = Integer.parseInt(request.getParameter("comboClubes"));
    uc.addAdmin(username,password,email,club);
    response.sendRedirect("index.jsp");
%>
