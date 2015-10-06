<%-- 
    Document   : altas
    Created on : 28-ago-2015, 20:29:41
    Author     : juanleyba
--%>

<%@page import="java.util.List"%>
<%@page import="Controller.ClubesController"%>
<%@page import="Model.Club"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <% 
    ClubesController cc = new ClubesController();
    List<Club> listaClubes = cc.listarClubes();
    %>
<html>
        <jsp:include page="/html.jsp" />
          <body>
      <jsp:include page="/header.jsp" />
        <div class="container">
             <div class="row">
    <div class="col s12">
      <ul class="tabs">
        <li class="tab col s3"><a class="active" href="#addclubes">Agregar Clubes</a></li>
        <li class="tab col s3"><a  href="#admin" class="">Administradores</a></li>
        <li class="tab col s3"><a  href="#clubes" class="">Clubes</a></li>
      </ul>
    </div>
    <div id="addclubes" class="col s12">
     <div id="loginForm" class="">
     <h4 class="center-align">Agregar club</h4>
     <form action="agregarClub.jsp" method="POST" class="col s12" enctype="multipart/form-data">
            <div class="row">
                    <div class="input-field col s12">
                      <input id="nombre" type="text" class="validate" required name="txtNombreClub">
                      <label for="nombre">Nombre Club</label>
                    </div>
                <div class="input-field col s12">
                      <input id="direccion" type="text" class="validate" required name="txtDireccion">
                      <label for="direccion">Dirección</label>
                    </div>
                <div class="input-field col s12">
                      <input id="telefono" type="text" class="validate" required name="txtTelefono">
                      <label for="telefono">Teléfono</label>
                    </div>
                <div class="input-field col s12">
                      <input id="email1" type="email" class="validate" required name="txtEmail">
                      <label for="email1">Email</label>
                    </div>
            </div>
             <div class="row">
               <div class=" input-field col s12">
                     
                   
                   <div>Subir Logo</div>
                <input type="file" name="logoClub" />
     
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
                
            <div id="admin" class="col s12">
                <h4 class="center-align">Agregar Admin</h4>
   <form class="col s12" method="POST" action="agregarAdmin.jsp">
      <div class="row">
           <div class="input-field col s12">
          <input id="username" type="text" class="validate" required name="txtUsername">
          <label for="username">Nombre de usuario</label>
        </div>
      </div>

      <div class="row">
        <div class="input-field col s6">
          <input id="password" type="password" class="validate" required name="txtPassword">
          <label for="password">Contraseña</label>
        </div>
           <div class="input-field col s6">
          <input id="passwordRepeat" type="password" class="validate" required>
          <label for="password">Repetir Contraseña</label>
        </div>
      </div>
      <div class="row">
        <div class="input-field col s12">
          <input id="email" type="email" class="validate" required name="txtEmail">
          <label for="email">Email</label>
       
          <div class="row"> <select name="comboClubes" class="col s12" required>
                  <option value="" disabled selected>Club</option>
                  <% for(Club item:listaClubes) {%>
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
          
       <div id="clubes" class="col s12">
        <h4 class="center-align">Torneos</h4>
         <table class="bordered">
        <thead>
          <tr>
              <th data-field="nombre">Nombre</th>
              <th data-field="fecha">Direccion</th>
              <th data-field="tipoTorneo">Telefono</th>
              <th data-field="matricula">Activo</th>
              <th data-field="matricula">Editar</th>
              
          </tr>
        </thead>

        <tbody>
          
        <%
           if(listaClubes != null){
            for(Club item:listaClubes) { %>
            <tr>
            <td><%=item.getNombre() %></td>
            <td><%= item.getDireccion()%></td>
            <td><%=item.getTelefono()%></td>
            <td>
                <%if(item.getEstado() != 0){%>
                <a href="desactivarClub.jsp?id=<%=item.getIdClub()%>" class="btn">Desactivar</a>
                <%} else {%>
                <a href="activarClub.jsp?id=<%=item.getIdClub()%>" class="btn">Activar</a>
                <%}%>
            </td>
            <td>
                 <a href="editarClub.jsp?id=<%=item.getIdClub()%>" class="btn">Editar</a>
            </td>
            </tr>
         <%}}%>
          
        </tbody>
      </table>
        
     </div>
          </div>
    </div>
              <footer class="page-footer blue-grey darken-4">
          <div class="container  blue-grey darken-4">
            <div class="row">
              <div class="col l6 s12">
                <h5 class="teal-text">Gracias por visitar Golftime</h5>
                <p class="grey-text text-lighten-4">La primera aplicación web de inscripciones online.</p>
              </div>
              <div class="col l4 offset-l2 s12">
                <h5 class="teal-text">Links</h5>
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
         <script type="text/javascript" src="/js/jquery.js"></script>
      <script type="text/javascript" src="/js/materialize.min.js"></script>
      <script type="text/javascript" src="/js/scripts.js"></script>
      <script>
          var password = document.getElementById("password")
                  , confirm_password = document.getElementById("passwordRepeat");

          function validatePassword(){
              if(password.value != confirm_password.value) {
                  confirm_password.setCustomValidity("Las contraseñas no coinciden");
              } else {
                  confirm_password.setCustomValidity('');
              }
          }

          password.onchange = validatePassword;
          confirm_password.onkeyup = validatePassword;
      </script>

  </body>
</html>
