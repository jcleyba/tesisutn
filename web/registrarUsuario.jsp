<%-- 
    Document   : agregarUser
    Created on : 19-ago-2015, 23:49:24
    Author     : juanleyba
--%>

<%@page import="Controller.EmailUtility"%>
<%@page import="Controller.UsuarioController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    UsuarioController uc = new UsuarioController();
    
    String nom = request.getParameter("nombreTxt");
    String ape = request.getParameter("apellidoTxt");
    String user = request.getParameter("usernameTxt");
    String pass = request.getParameter("passwordTxt");
    String email = request.getParameter("emailTxt");
    
    int matricula = Integer.parseInt(request.getParameter("matriculaTxt"));  
    int club = Integer.parseInt(request.getParameter("comboClubes"));
    uc.agregarJugador(user,pass,club,email,matricula,nom,ape);
    
    
    

    String toAddress = uc.getEmailAdmin(club);
    String subject = "Se ha registrado un nuevo usuario";
    String message = "Bienvenido a Golftime \n Active al usuario "+nom+" "+ape+" cuyo email es: "+email+".\n Gracias.";
    EmailUtility mailing = new EmailUtility();
    mailing.sendEmail(toAddress, subject, message);
    
%>
 <%@include file="html.jsp" %>
  <body>
      <jsp:include page="header.jsp" />
      <div class="container">
          <h4>Bienvenido a Golf Time!</h4>
          <p>Su registro ha sido exitoso. Para comenzar a utilizar el sistema e inscribirse a torneos, el administrador de su club deberá activar su cuenta.</p>
          <p>Si en las próximas 24hs. hábiles usted no puede inscribirse, contacte a su club de origen.</p>
      </div> 
        <div id="loginForm" class="modal modal-fixed-footer">
    <div class="modal-content">
        <h4 class="center-align">Iniciar Sesión</h4>
        <p>Ingrese sus datos para comenzar a utilizar Golftime.</p>
     <form action="/login.jsp" method="GET" class="col s12">
            <div class="row">
                    <div class="input-field col s12">
                      <input id="username" type="text" class="validate" required name="txtUserName">
                      <label for="username">Usuario</label>
                    </div>
            </div>
             <div class="row">
                <div class="input-field col s12">
                  <input id="password" type="password" class="validate" required name="txtPassword">
                  <label for="password">Contraseña</label>
                </div>
             </div>
             <div class="row center-align">
                <div class="input-field col s12">
                    <input type="submit" value="Enviar" class="btn ">
                </div>
              </div>
    </form>
    </div>
  </div>
      <footer class="page-footer blue-grey darken-4">
          <div class="container  blue-grey darken-4">
              <div class="row">
                  <div class="col l6 s12">
                      <h5 class="white-text">Gracias por visitar Golftime</h5>
                      <p class="grey-text text-lighten-4">La primera aplicación web de inscripciones online.</p>
                  </div>
                  <div class="col l4 offset-l2 s12">
                      <h5 class="white-text">Links</h5>
                      <ul>
                          <li><a class="grey-text text-lighten-3" href="clubes.jsp">Clubes</a></li>
                          <li><a class="grey-text text-lighten-3" href="torneos.jsp">Torneos</a></li>
                          <li><a class="grey-text text-lighten-3" href="resultados.jsp">Resultados</a></li>
                      </ul>
                  </div>
              </div>
          </div>
          <div class="footer-copyright blue-grey darken-4">
              <div class="container blue-grey darken-4 center-align">
                  © 2015 Golftime - Todos los derechos reservados

              </div>
          </div>
      </footer>
    </body>
