<%-- 
    Document   : error
    Created on : 19-ago-2015, 22:27:15
    Author     : juanleyba
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="html.jsp" %>
  <body>
      <jsp:include page="header.jsp" />
      <h4 class="teal-text">Revise sus credenciales</h4>
      <div class="container">
          <p class="red-text">El nombre de usuario y la contraseña no coinciden. Por favor vuelva a intentar iniciar sesión.</p>

     <form action="/login.jsp" method="GET" class="col s12">
            <div class="row">
                    <div class="input-field col s12">
                      <input id="username" type="text" class="validate" pattern="[^'\x22]+" title="Su nombre de usuario no puede tener comillas" required name="txtUserName">
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
             <jsp:include page="/footer.jsp" />
    </body>
    </html>