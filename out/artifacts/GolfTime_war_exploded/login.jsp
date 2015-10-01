<%-- 
    Document   : login
    Created on : 20-ago-2015, 22:13:33
    Author     : juanleyba
--%>

<%@page import="Controller.EmailUtility"%>
<%@page import="Model.Usuario"%>
<%@page import="Model.Jugador"%>
<%@page import="Controller.UsuarioController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

       <% 
        String mat = request.getParameter("txtUserName");
        String pass = request.getParameter("txtPassword");
        UsuarioController bc = new UsuarioController();
        Usuario user = bc.loginJugador(mat, pass);
        if(user != null)
        {
            session.setAttribute("usuario", user);
            response.sendRedirect("index.jsp");
        }
        else
        {
            response.sendRedirect("error.jsp");                           
        }
        
        %>