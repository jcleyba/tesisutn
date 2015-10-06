<%-- 
    Document   : index
    Created on : 13-ago-2015, 22:33:09
    Author     : juanleyba
--%>

<%@page import="Model.Torneo"%>
<%@page import="java.util.List"%>
<%@page import="Controller.TorneosController"%>
<%@page import="Model.Club"%>
<%@page import="Controller.ClubesController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.Usuario"%>
<% 
    Usuario user = (Usuario)session.getAttribute("usuario");
      TorneosController cc = new TorneosController();
    List<Torneo> lista = cc.listarProximosTorneos();
%>
<!DOCTYPE html>
<html>
    <%@include file="html.jsp" %>
  <body>
      <jsp:include page="header.jsp" />
      <h4 class="teal-text">Próximos torneos disponibles</h4>
      <div class="container">
          <div>
                <% for(Torneo item:lista){%>
        <div class="col s2 m2">
          <div class="card">
           
            <div class="card-content">
                <span class="card-title"> <a href="torneo.jsp?idTorneo=<%=item.getIdTorneo()%>"><%=item.getNombre()%> - (<%=item.getTipoDescripcion()%>)</a></span>
                <p id="fecha">
                    <%= cc.fechaOrdenada(item.getFecha())%>
                </p>
                <p class="teal-text">
                    <%=item.getClub()%>
                </p>
            </div>
            <div class="card-action">
               <a href="torneo.jsp?idTorneo=<%=item.getIdTorneo()%>">Ver Horarios</a> 
               <a href="resultados.jsp?idTorneo=<%=item.getIdTorneo()%>">Ver resultados</a>

            </div>
          </div>
        </div>
         <%}%>
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
      <script type="text/javascript" src="js/jquery.js"></script>
       <script type="text/javascript" src="js/materialize.min.js"></script>
      <script type="text/javascript" src="js/scripts.js"></script>   
  </body>
</html>
