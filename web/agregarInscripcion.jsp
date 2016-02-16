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
<%@ page import="Model.Torneo" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%  
    String idJugador = request.getParameter("idjugadorTxt");  
    String idTorneo = request.getParameter("idtorneoTxt");
    String hora = request.getParameter("comboHorarios");
    TorneosController tc = new TorneosController();
    Torneo torneo = tc.getTorneoPorId(Integer.parseInt(idTorneo));
    boolean limitealcanzado = tc.limitePorLinea(Integer.parseInt(idTorneo),hora);
    boolean inscripto = tc.inscripto(Integer.parseInt(idTorneo),Integer.parseInt(idJugador));
    if(limitealcanzado)
    {%>
<!DOCTYPE html>

<%@include file="html.jsp" %>
<body>
<jsp:include page="header.jsp" />
<h4 class="teal-text">¡Lo sentimos!</h4>
<div class="container">
    <p class="text-red">El límite de <%=torneo.getJugadoresPorLinea()%> jugadores por línea impuesto por el club ha sido alcanzado para este torneo en este horario. Elija otro horario disponible o consulte al club organizador.</p>
    <p class="center"><i class="material-icons teal-text large">thumb_down</i> </p>
    <p class="center"><a href="/torneo.jsp?idTorneo=<%=idTorneo%>" class="btn">Volver al torneo</a></p>
</div>
<jsp:include page="/footer.jsp" />

</body>
    <%}
    else if(!inscripto){
    tc.agregarInscripcion(hora, idJugador, idTorneo);
    UsuarioController uc = new UsuarioController();
    Usuario usuario = uc.getUsuarioPorIdJugador(Integer.parseInt(idJugador));
    SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy HH:mm");

    Long milisec = Long.parseLong(hora);

    String toAddress = usuario.getEmail();

    Date horario = new Date(milisec);
    String horafinal = formatter.format(horario);
        String subject = "Su inscripción ha sido exitosa";
        String message = "Estimado usuario:\n \nUsted se ha inscripto para jugar en la siguiente fecha: "+horafinal+".\n \nEquipo de Golftime.";
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
          <p class="center"><i class="material-icons teal-text large">thumb_up</i> </p>
          <p class="center"><a href="/torneos.jsp" class="btn">Volver a torneos</a></p>
      </div>
      <jsp:include page="/footer.jsp" />

  </body>
<%} else
{
    response.sendRedirect("yainscripto.jsp");
}%>