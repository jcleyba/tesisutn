<%-- 
    Document   : loginAdmin
    Created on : 26-ago-2015, 14:38:23
    Author     : juanleyba
--%>

<%@page import="Model.Administrador"%>
<%@page import="Controller.UsuarioController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

       <% 
        String username = request.getParameter("usernameTxt");
        String pass = request.getParameter("passwordTxt");
        UsuarioController bc = new UsuarioController();
        Administrador user =  bc.loginAdmin(username, pass);
        if(user != null)
        {
            session.setAttribute("usuario", user);
            response.sendRedirect("/admin/index.jsp");
        }
        else
        {
           response.sendRedirect("/error.jsp");
        }

        %>
 