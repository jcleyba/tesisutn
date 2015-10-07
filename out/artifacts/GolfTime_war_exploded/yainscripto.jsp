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
          <p class="red-text">Usted ya se ha inscripto al torneo seleccionado.</p>
          <a href="index.jsp" class="btn">Volver a inicio</a>
      </div>
             <jsp:include page="/footer.jsp" />
      <script type="text/javascript" src="js/jquery.js"></script>
      <script type="text/javascript" src="js/materialize.min.js"></script>
      <script type="text/javascript" src="js/scripts.js"></script>
    </body>
    </html>