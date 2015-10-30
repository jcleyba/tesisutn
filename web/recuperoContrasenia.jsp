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
          <p class="red-text">Para recuperar su contraseña, por favor ingrese su nombre de usuario de Golftime.</p>

     <form action="/recuperoPass" method="POST" class="col s12">
            <div class="row">
                    <div class="input-field col s12">
                      <input id="username" type="text" pattern="[^'\x22]+" class="validate" required name="txtUsername">
                      <label for="username">Nombre de usuario</label>
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
      </div>
             <jsp:include page="/footer.jsp" />
    </body>
    </html>