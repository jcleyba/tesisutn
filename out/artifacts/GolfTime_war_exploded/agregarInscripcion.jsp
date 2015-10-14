<%-- 
    Document   : agregarUser
    Created on : 19-ago-2015, 23:49:24
    Author     : juanleyba
--%>

<%@page import="Controller.EmailUtility"%>
<%@page import="Model.Usuario"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Controller.TorneosController"%>
<%@page import="Controller.UsuarioController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%  
    String idJugador = request.getParameter("idjugadorTxt");  
    String idTorneo = request.getParameter("idtorneoTxt");
    String hora = request.getParameter("comboHorarios");
    TorneosController tc = new TorneosController();
    tc.agregarInscripcion(hora, idJugador, idTorneo);
    
    UsuarioController uc = new UsuarioController();
    Usuario usuario = uc.getUsuarioPorIdJugador(Integer.parseInt(idJugador));
 

        String toAddress = usuario.getEmail();
        String subject = "Su inscripción ha sido exitosa";
        String message = "Usted se ha inscripto para jugar a las "+hora;
        EmailUtility mailing = new EmailUtility();
        mailing.sendEmail(toAddress, subject, message);

%>
<!DOCTYPE html>

 <%@include file="html.jsp" %>
  <body>
      <jsp:include page="header.jsp" />
      <h4 class="teal-text">¡Felicitaciones!</h4>
      <div class="container">
          <p>Su inscripcion ha sido exitosa. En los próximos minutos recibirá un mail de confirmación de su inscripción. Adelante y suerte!.</p>
      </div> 
    </body>
