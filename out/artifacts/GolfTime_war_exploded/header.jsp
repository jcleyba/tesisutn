<%-- 
    Document   : header
    Created on : 24-ago-2015, 21:42:07
    Author     : juanleyba
--%>
<%@page import="java.util.List"%>
<%@page import="Model.Club"%>
<%@page import="Controller.ClubesController"%>
<%@page import="Controller.UsuarioController"%>
<%@page import="Model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="navbar">
<nav  class="teal">
    <div class="nav-wrapper">
      <a href="index.jsp" class="brand-logo center"><img src="/images/golftime.svg" alt="Logo"  title="Golftime"></a>
      <ul id="nav-mobile" class="left">
        <li><a href="/clubes.jsp" >Clubes</a></li>
        <li><a href="/torneos.jsp">Torneos</a></li>
          <li><a href="/listaResultados.jsp">Resultados</a></li>
      </ul>
      <ul id="nav-mobile" class="right m2">
          <% Usuario user = (Usuario)session.getAttribute("usuario");
              if( user != null){%>
              <li><a class="dropdown-button" href="#!" data-activates="dropdown1"><%=(user.getUsername() != null)? user.getUsername() : "Admin" %><i class="material-icons right">arrow_drop_down</i></a></li>
          <li><a href="/logout.jsp"><i class="material-icons left">close</i>Salir</a></li>
        <%} else {%>
         <li><a href="#loginForm" class="modal-trigger"><i class="material-icons left">person</i>Iniciar Sesión</a></li>
         <li><a href="#singupForm" class="modal-trigger"><i class="material-icons left">add</i>Registrarme</a></li>
        
        <%}%>
       
      </ul>
         <%
             UsuarioController uc = new UsuarioController();
             if(user != null && !uc.isAdmin(user)){
         %>
        <ul id="dropdown1" class="dropdown-content">
            <li><a href="usuario.jsp?id=<%=user.getIdUsuario()%>">Actualizar Datos</a></li>
            <li><a href="misinscripciones.jsp?idjugador=<%=user.getIdUsuario()%>">Mis Inscripciones</a></li>
            <li><a href="misestadisticas.jsp?idjugador=<%=user.getIdUsuario()%>">Mis Estadísticas</a></li>
  
        </ul>
        <%}else if(user != null){%>
        <ul id="dropdown1" class="dropdown-content">
        <li><a href="/admin/misestadisticas.jsp">Mis Estadísticas</a></li>
        </ul>
        <%}%>
    </div>
  </nav>
    </div>
<div id="loginForm" class="modal modal-fixed-footer">
    <div class="modal-content">
        <h4 class="center-align">Iniciar Sesión</h4>
        <p>Ingrese sus datos para comenzar a utilizar Golftime.</p>
     <form action="/login.jsp" method="GET" class="col s12">
            <div class="row">
                    <div class="input-field col s12">
                      <input id="username" type="text" class="validate" title="Su nombre de usuario no puede tener comillas" required name="txtUserName">
                      <label for="username">Usuario</label>
                    </div>
            </div>
             <div class="row">
                <div class="input-field col s12">
                  <input id="contraseña" type="password" class="validate" required name="txtPassword">
                  <label for="contraseña">Contraseña</label>
                </div>
             </div>
             <div class="row center-align">
                <div class="input-field col s12">
                    <button class="btn waves-effect waves-light" type="submit" name="action">Enviar
                        <i class="material-icons right">send</i>
                    </button>
                </div>
              </div>
    </form>
       <p class="center"><a href="/recuperoUsuario.jsp" >Olvidé mi nombre de usuario</a>
           <br>
           <br>
           <a href="/recuperoContrasenia.jsp">Olvidé mi contraseña</a>
       </p>

    </div>
  </div>
<div id="singupForm" class="modal modal-fixed-footer">
    <div class="modal-content">
        <h4 class="center-align">Registrarme</h4>
        <% 
    ClubesController cc = new ClubesController();
    List<Club> lista = cc.listarClubesActivos();
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
          <input id="username" type="text" class="validate"  title="Su nombre de usuario no puede tener comillas" required name="usernameTxt">
          <label for="username">Nombre de usuario</label>
        </div>
      </div>

      <div class="row">
        <div class="input-field col s6">
            <input id="password" name="passwordTxt" type="password" class="required" pattern="^\S{6,}$" onchange="this.setCustomValidity(this.validity.patternMismatch ? 'Debe tener al menos seis caracteres' : ''); if(this.checkValidity()) form.password_two.pattern = this.value;" required>          <label for="password">Contraseña</label>
        </div>
           <div class="input-field col s6">
               <input id="passwordRepeat" class="validate" name="password_two" type="password" pattern="^\S{6,}$" onchange="this.setCustomValidity(this.validity.patternMismatch ? 'Sus contraseñas no coinciden' : '');"  required>
               <label for="passwordRepeat">Repetir Contraseña</label>
        </div>
      </div>
      <div class="row">
        <div class="input-field col s6">
            <input id="email-input" type="email" class="validate" required name="emailTxt">
            <label for="email-input">Email</label>
        </div>
           <div class="input-field col s6">
          <input id="email" type="number" class="validate" min="0" max="1000000" step="1"  title="Ingrese su número de matricula" required name="matriculaTxt">
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