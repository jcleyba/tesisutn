<%-- 
    Document   : agregarUser
    Created on : 19-ago-2015, 23:49:24
    Author     : juanleyba
--%>

<%@page import="Controller.UsuarioController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    int idUsuario = Integer.parseInt(request.getParameter("id"));
    UsuarioController uc = new UsuarioController();
    
    String nom = request.getParameter("nombreTxt");
    String ape = request.getParameter("apellidoTxt");
    String user = request.getParameter("usernameTxt");
    String pass = request.getParameter("passwordTxt");
    String email = request.getParameter("emailTxt");
    
    int matricula = Integer.parseInt(request.getParameter("matriculaTxt"));  
    int club = Integer.parseInt(request.getParameter("comboClubes"));
    uc.actualizarJugador(idUsuario,nom,ape,matricula,user,pass,email,club);
    response.sendRedirect("index.jsp");
%>
 <%@include file="html.jsp" %>
  <body>
      <jsp:include page="header.jsp" />
      <div class="container">
          <h4>Bienvenido a Golf Time!</h4>
          <p>Su actualización ha sido exitosa. Para comenzar a utilizar el sistema e inscribirse a torneos, el administrador de su club deberá activar su cuenta.</p>
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
    </body>
