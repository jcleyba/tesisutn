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
            <input id="first_name" type="text" class="validate" value='<%=j.getNombre()%>' required name="nombreTxt">
          <label for="first_name">Nombre</label>
        </div>
        <div class="input-field col s4">
          <input id="last_name" type="text" class="validate" value='<%=j.getApellido()%>' required name="apellidoTxt">
          <label for="last_name">Apellido</label>
        </div>
           <div class="input-field col s4">
          <input id="username" type="text" class="validate" value="<%=user.getUsername()%>" required name="usernameTxt">
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
          <input id="email" type="email" class="validate" value="<%=user.getEmail()%>" required name="emailTxt">
          <label for="email">Email</label>
        </div>
           <div class="input-field col s6">
          <input id="email" type="text" class="validate" required value='<%=j.getMatricula()%>' name="matriculaTxt">
          <label for="email">Matricula</label>
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
      <script type="text/javascript" src="js/jquery.js"></script>
      <script type="text/javascript" src="js/materialize.min.js"></script>
      <script type="text/javascript" src="js/scripts.js"></script>

  </body>
</html>
