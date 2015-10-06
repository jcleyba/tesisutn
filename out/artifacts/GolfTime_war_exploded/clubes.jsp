<%-- 
    Document   : clubes
    Created on : 28-ago-2015, 19:18:24
    Author     : juanleyba
--%>

<%@page import="Model.Club"%>
<%@page import="java.util.List"%>
<%@page import="Controller.ClubesController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
      ClubesController cc = new ClubesController();
    List<Club> lista = cc.listarClubesActivos();
%>
    <%@include file="html.jsp" %>
  <body>
      <jsp:include page="header.jsp" />
      <h4 class="teal-text">Estos son los clubes que utilizan Golf Time</h4>
      <div class="container">
       
        <div class="row">
        <% for(Club item:lista){%>
        <div class="col s4 m4">
          <div class="card">
            <div class="card-image">
               <img src="/images/<%=item.getLogo() %>" alt="<%=item.getNombre()%>" title="<%=item.getNombre()%>"/>
            </div>
            <div class="card-content">
                           <span class="card-title"> <a href="club.jsp?id=<%=item.getIdClub()%>"><%=item.getNombre()%></a></span>
            </div>
            <div class="card-action">
               <a href="club.jsp?id=<%=item.getIdClub()%>">Ver torneos</a>
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