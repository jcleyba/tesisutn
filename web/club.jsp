<%-- 
    Document   : club
    Created on : 01-sep-2015, 21:31:23
    Author     : juanleyba
--%>

<%@page import="java.util.List"%>
<%@page import="Model.Torneo"%>
<%@page import="Controller.TorneosController"%>
<%@page import="Model.Club"%>
<%@page import="Controller.ClubesController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
    <%@include file="html.jsp" %>
    <% 
        int idClub = Integer.parseInt(request.getParameter("id"));
        ClubesController cc = new ClubesController();
        Club club = cc.clubPorId(idClub);
        TorneosController tc = new TorneosController();
        List<Torneo> listaTorneo = tc.listarProximosTorneosPorClub(idClub);
    
    %>
  <body>
      <jsp:include page="header.jsp" />
      <h4 class="white-text">Bienvenido al sitio de <%=club.getNombre()%></h4>
      <div class="container">
          <div>
                <% for(Torneo item : listaTorneo){%>
        <div class="col s4 m4">
          <div class="card">
           
            <div class="card-content">
                <span class="card-title"> <a href="torneo.jsp?idTorneo=<%=item.getIdTorneo()%>"><%=item.getNombre()%> - (<%=item.getTipoDescripcion()%>)</a></span>
                <p id="fecha"> <%= tc.fechaOrdenada(item.getFecha())%></p>
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
       
      <script type="text/javascript" src="js/jquery.js"></script>
      <script type="text/javascript" src="js/materialize.min.js"></script>
      <script type="text/javascript" src="js/scripts.js"></script>
    </body>
