<%-- 
    Document   : agregarUser
    Created on : 19-ago-2015, 23:49:24
    Author     : juanleyba
--%>

<%@page import="Controller.EmailUtility"%>
<%@page import="Controller.UsuarioController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html>

<% 
    UsuarioController uc = new UsuarioController();
    
    String nom = new String(request.getParameter("nombreTxt").getBytes("ISO-8859-1"),"UTF-8");
    String ape = new String(request.getParameter("apellidoTxt").getBytes("ISO-8859-1"),"UTF-8");
    String user = request.getParameter("usernameTxt");
    String pass = request.getParameter("passwordTxt");
    String email = request.getParameter("emailTxt");
    
    int matricula = Integer.parseInt(request.getParameter("matriculaTxt"));  
    int club = Integer.parseInt(request.getParameter("comboClubes"));

    Integer codigo = uc.errorPorUsuarioRegistrado(user,email);
    if(codigo == 101)
    {
        response.sendRedirect("/usuarioExistente.jsp");
    }
    else if( codigo == 102)
    {
        response.sendRedirect("/emailRegistrado.jsp");
    }
    else
    {
        uc.agregarJugador(user,pass,club,email,matricula,nom,ape);
        String toAddress = uc.getEmailAdmin(club);
        String subject = "Se ha registrado un nuevo usuario";
        String message = "Bienvenido a Golftime \n Active al usuario "+nom+" "+ape+" cuyo email es: "+email+".\n Gracias.";
        EmailUtility mailing = new EmailUtility();
        mailing.sendEmail(toAddress, subject, message);
    }
    
%>
 <%@include file="html.jsp" %>
  <body>
      <jsp:include page="header.jsp" />
      <h4 class="teal-text">Bienvenido a Golf Time!</h4>
      <div class="container">
          <p>Su registro ha sido exitoso. Para comenzar a utilizar el sistema e inscribirse a torneos, el administrador de su club deberá activar su cuenta.</p>
          <p>Si en las próximas 24hs. hábiles usted no puede inscribirse, contacte a su club de origen.</p>
          <p class="center"><i class="material-icons teal-text large">thumb_up</i> </p>
          <p class="center"><a href="index.jsp" class="btn">Volver a inicio</a></p>
      </div> 
      <jsp:include page="/footer.jsp" />
    </body>
</html>