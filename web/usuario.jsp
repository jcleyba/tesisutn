<%-- 
    Document   : index
    Created on : 13-ago-2015, 22:33:09
    Author     : juanleyba
--%>

<%@page import="Model.Jugador"%>
<%@page import="java.util.List"%>
<%@page import="Controller.TorneosController"%>
<%@page import="Controller.ClubesController"%>
<%@page import="Model.Club"%>
<%@page import="Controller.ClubesController"%>
<%@page import="Controller.UsuarioController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.Usuario"%>
<%          
    
    Usuario user = (Usuario)session.getAttribute("usuario");
    ClubesController cc = new ClubesController();
    UsuarioController uc = new UsuarioController();
    List<Club> listaClubes = cc.listarClubesActivos();
    int idUsuario = Integer.parseInt(request.getParameter("id"));
    Jugador j = uc.getJugador(idUsuario);
    if(idUsuario != user.getIdUsuario()){
        response.sendRedirect("error.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <%@include file="html.jsp" %>
  <body>
      <jsp:include page="header.jsp" />
      <h4 class="teal-text">Actualizar cuenta</h4>
      <div class="container">
          <h6>Edite sus datos para actualizar.</h6>
       <div class="row">
           <form class="col s12" method="POST" action="actualizarUsuario.jsp?id=<%=user.getIdUsuario()%>">
      <div class="row">
        <div class="input-field col s4">
            <input id="first_name" type="text" pattern="[^'\x22]+" class="validate" value='<%=j.getNombre()%>' required name="nombreTxt">
          <label for="first_name" class="active">Nombre</label>
        </div>
        <div class="input-field col s4">
          <input id="last_name" type="text" pattern="[^'\x22]+"   class="validate" value='<%=j.getApellido()%>' required name="apellidoTxt">
          <label for="last_name" class="active">Apellido</label>
        </div>
           <div class="input-field col s4">
          <input id="username" type="text"  pattern="[^'\x22]+"  class="validate" value="<%=user.getUsername()%>" required name="usernameTxt">
          <label for="username" class="active">Nombre de usuario</label>
        </div>
      </div>

               <div class="row">
                   <div class="input-field col s6">
                       <input id="password" type="password" name="passwordTxt" class="required" pattern="^\S{6,}$" onchange="this.setCustomValidity(this.validity.patternMismatch ? 'Debe tener al menos seis caracteres' : ''); if(this.checkValidity()) form.password_two.pattern = this.value;" required>          <label for="password">Contraseña</label>
                       <label for="password"  class="active">Contraseña</label>
                   </div>
                   <div class="input-field col s6">
                       <input id="passwordRepeat" class="validate" name="password_two" type="password" pattern="^\S{6,}$" onchange="this.setCustomValidity(this.validity.patternMismatch ? 'Sus contraseñas no coinciden' : '');"  required>
                       <label for="passwordRepeat"  class="active">Repetir Contraseña</label>
                   </div>
               </div>
      <div class="row">
        <div class="input-field col s6">
          <input id="email" type="email" class="validate" value="<%=user.getEmail()%>" required name="emailTxt">
          <label for="email"  class="active">Email</label>
        </div>
           <div class="input-field col s6">
          <input id="email" type="text"  pattern="[^'\x22]+" class="validate" min="0" max="1000000" step="1" title="Ingrese su número de matricula" required value='<%=j.getMatricula()%>' name="matriculaTxt">
          <label for="email"  class="active">Matricula</label>
        </div>
        <div class="row"> 
            <select name="comboClubes" class="col s12" required>
                  <option value="" disabled selected>Club</option>
                  <% for(Club item:listaClubes) {%>
                  <option value="<%=item.getIdClub()%>"<%if (item.getIdClub()== user.getIdClub()){%>selected<%}%>><%=item.getNombre()%></option>
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
            <jsp:include page="/footer.jsp" />

  </body>
</html>
