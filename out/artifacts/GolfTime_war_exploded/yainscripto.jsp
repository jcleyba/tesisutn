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
          <p class="red-text">Usted ya se ha inscripto al torneo seleccionado. Recuerde que una vez cancelada su inscripción, no puede volver a anotarse en el mismo torneo.</p>

          <p class="center"><i class="material-icons teal-text large">thumb_down</i> </p>
          <p class="center"><button onclick="history.go(-1)" class="btn">Volver al torneo</button></p>
      </div>
             <jsp:include page="/footer.jsp" />

    </body>
    </html>