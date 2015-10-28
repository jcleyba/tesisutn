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
      <h4 class="teal-text">Olvidé mi contraseña</h4>
      <div class="container">
          <p class="red-text">Para recuperar su nombre de usuario, por favor ingrese su dirección de correo electrónico.</p>

     <form action="/recuperoUsuario" method="POST" class="col s12">
            <div class="row">
                    <div class="input-field col s12">
                      <input id="email" type="email" class="validate" required name="txtEmail">
                      <label for="email">Email</label>
                    </div>
            </div>

             <div class="row center-align">
                <div class="input-field col s12">
                    <button class="btn" type="submit" name="action">Enviar
                        <i class="material-icons right">send</i>
                    </button>
                </div>
              </div>
    </form>
          <div id="no-email"></div>
      </div>
             <jsp:include page="/footer.jsp" />
    </body>
    </html>