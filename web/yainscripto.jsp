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
      <h4 class="white-text">Inscripción existente</h4>
      <div class="container">
          <p class="red-text">Usted ya se ha inscripto al torneo seleccionado.</p>
          <a href="index.jsp" class="btn">Volver a inicio</a>
      </div>
       <footer class="page-footer blue-grey darken-4">
          <div class="container  blue-grey darken-4">
            <div class="row">
              <div class="col l6 s12">
                <h5 class="white-text">Gracias por visitar Golftime</h5>
                <p class="grey-text text-lighten-4">La primera aplicación web de inscripciones online.</p>
              </div>
              <div class="col l4 offset-l2 s12">
                <h5 class="white-text">Links</h5>
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
      <script type="text/javascript" src="js/jquery.js"></script>
      <script type="text/javascript" src="js/materialize.min.js"></script>
      <script type="text/javascript" src="js/scripts.js"></script>
    </body>
    </html>