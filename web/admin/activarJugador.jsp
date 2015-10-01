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
        int idJugador = Integer.parseInt(request.getParameter("id"));
        UsuarioController uc = new UsuarioController();
        Usuario user = uc.getUsuarioPorIdJugador(idJugador);
  

        String toAddress = user.getEmail();
        String subject = "Su cuenta de Golftime ha sido activada";
        String message = "Bienvenido a Golftime. \n \n Su cuenta ha sido activada y usted podrá inscribirse online a torneo tanto como consultar sus resultados y estadísticas. \n \n Adelante y suerte! \n Equipo Golftime";
        EmailUtility mailing = new EmailUtility();
        mailing.sendEmail(toAddress, subject, message);
        uc.activarJugador(idJugador);
        response.sendRedirect("index.jsp");
        
        %>