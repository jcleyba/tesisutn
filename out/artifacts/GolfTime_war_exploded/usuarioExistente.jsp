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
      <h4 class="teal-text">Inscripción existente</h4>
      <div class="container">
          <p class="red-text">Su nombre de usuario ya ha sido registrado por otro jugador. Por favor elija un nuevo nombre y vuelva a intentarlo. </p>

          <p class="center"><i class="material-icons teal-text large">thumb_down</i> </p>
          <p class="center"><a href="/index.jsp" class="btn">Volver al inicio</a></p>
      </div>
             <jsp:include page="/footer.jsp" />

    </body>
    </html>