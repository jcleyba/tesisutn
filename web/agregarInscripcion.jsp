<%-- 
    Document   : agregarUser
    Created on : 19-ago-2015, 23:49:24
    Author     : juanleyba
--%>

<%@page import="Controller.EmailUtility"%>
<%@page import="Model.Usuario"%>
<%@page import="Controller.TorneosController"%>
<%@page import="Controller.UsuarioController"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%  
    String idJugador = request.getParameter("idjugadorTxt");  
    String idTorneo = request.getParameter("idtorneoTxt");
    String hora = request.getParameter("comboHorarios");
    TorneosController tc = new TorneosController();

    tc.agregarInscripcion(hora, idJugador, idTorneo);
    UsuarioController uc = new UsuarioController();
    Usuario usuario = uc.getUsuarioPorIdJugador(Integer.parseInt(idJugador));
    SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy HH:mm");

    Long milisec = Long.parseLong(hora);

    String toAddress = usuario.getEmail();

    Date horario = new Date(milisec);
    String horafinal = formatter.format(horario);
        String subject = "Su inscripción ha sido exitosa";
        String message = "Usted se ha inscripto para jugar en la siguiente fecha: "+horafinal;
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
      <jsp:include page="/footer.jsp" />

  </body>
