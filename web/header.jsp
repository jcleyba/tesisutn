<%-- 
    Document   : header
    Created on : 24-ago-2015, 21:42:07
    Author     : juanleyba
--%>
<%@page import="java.util.List"%>
<%@page import="Model.Club"%>
<%@page import="Controller.ClubesController"%>
<%@page import="Controller.UsuarioController"%>
<%@page import="Model.Jugador"%>
<%@page import="Model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="navbar-fixed">
<nav  class="teal darken-4">
    <div class="nav-wrapper">
      <a href="/" class="brand-logo center">Golftime</a>
      <ul id="nav-mobile" class="left hide-on-med-and-down">
        <li><a href="/clubes.jsp" >Clubes</a></li>
        <li><a href="/torneos.jsp">Torneos</a></li>
       
      </ul>
      <ul id="nav-mobile" class="right">
          <% Usuario user = (Usuario)session.getAttribute("usuario");
              if( user != null){%>
              <li><a class="dropdown-button" href="#!" data-activates="dropdown1"><%=(user.getUsername() != null)? user.getUsername() : "Admin" %><i class="material-icons right">arrow_drop_down</i></a></li>
          <li><a href="/logout.jsp"><i class="material-icons left">close</i>Salir</a></li>
        <%} else {%>
         <li><a href="#loginForm" class="modal-trigger"><i class="material-icons left">person</i>Iniciar Sesión</a></li>
         <li><a href="#singupForm" class="modal-trigger"><i class="material-icons left">add</i>Registrarme</a></li>
        
        <%}%>
       
      </ul>
         <%if( user != null){%>
        <ul id="dropdown1" class="dropdown-content">
  <li><a href="usuario.jsp?id=<%=user.getIdUsuario()%>">Actualizar Datos</a></li>
  <li><a href="misinscripciones.jsp?idjugador=<%=user.getIdUsuario()%>">Mis Inscripciones</a></li>
  
</ul><%}%>
    </div>
  </nav>
    </div>
      <% 
              UsuarioController uc = new UsuarioController();
              boolean isAdmin = uc.isAdmin(user);
              if(user != null && !isAdmin)
                {
                    out.println("Bienvenido "+user.getUsername()+"  ");
                
              }   %> 
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
     
      <div id="singupForm" class="modal modal-fixed-footer">
    <div class="modal-content">
        <h4 class="center-align">Registrarme</h4>
        <% 
    ClubesController cc = new ClubesController();
    List<Club> lista = cc.listarClubes();
    %>
       <div class="row">
           <form class="col s12" method="POST" action="/registrarUsuario.jsp">
      <div class="row">
        <div class="input-field col s4">
          <input id="first_name" type="text" class="validate" required name="nombreTxt">
          <label for="first_name">Nombre</label>
        </div>
        <div class="input-field col s4">
          <input id="last_name" type="text" class="validate" required name="apellidoTxt">
          <label for="last_name">Apellido</label>
        </div>
           <div class="input-field col s4">
          <input id="username" type="text" class="validate" required name="usernameTxt">
          <label for="username">Nombre de usuario</label>
        </div>
      </div>

      <div class="row">
        <div class="input-field col s6">
          <input id="password" type="password" class="validate" required name="passwordTxt">
          <label for="password">Contraseña</label>
        </div>
           <div class="input-field col s6">
          <input id="password" type="password" class="validate" required>
          <label for="password">Repetir Contraseña</label>
        </div>
      </div>
      <div class="row">
        <div class="input-field col s6">
          <input id="email" type="email" class="validate" required name="emailTxt">
          <label for="email">Email</label>
        </div>
           <div class="input-field col s6">
          <input id="email" type="text" class="validate" required name="matriculaTxt">
          <label for="email">Matricula</label>
        </div>
        <div class="row"> 
            <select name="comboClubes" class="col s12" required>
                  <option value="" disabled selected>Club</option>
                  <% for(Club item:lista) {%>
                  <option value="<%=item.getIdClub()%>"><%=item.getNombre()%></option>
                  <%}%>                  
              </select>
              <br>
              <div class="row center-align">
                <div class="input-field col s12">
                    <input type="submit" value="Enviar" class="btn ">
                </div>
              </div>
          </div> 
      </div>
    </form>
  </div>
              
    </div>
  </div>