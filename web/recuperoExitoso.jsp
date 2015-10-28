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
      <h4 class="teal-text">Recuperación exitosa</h4>
      <div class="container">
          <p class="">Se ha enviado un correo electrónico a su casilla con los datos solicitados. Verifique en su bandeja de entrada o su carpeta de correo no deseado.</p>
          <p class="center"><i class="material-icons teal-text large">thumb_up</i> </p>
          <p class="center"><a href="index.jsp" class="btn">Volver a inicio</a></p>
      </div>
             <jsp:include page="/footer.jsp" />

    </body>
    </html>