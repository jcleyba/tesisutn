<%-- 
    Document   : index
    Created on : 13-ago-2015, 22:33:09
    Author     : juanleyba
--%>

<%@page import="Model.Torneo"%>
<%@page import="java.util.List"%>
<%@page import="Controller.TorneosController"%>
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
      <div class="container no-back">
        <div class="row">
                <% for(Torneo item:lista){%>
        <div class="col m6">
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
                <i class="material-icons orange-text text-lighten-2">access_time</i><a href="torneo.jsp?idTorneo=<%=item.getIdTorneo()%>">Ver Horarios</a>
                <i class="material-icons orange-text text-lighten-2">poll</i><a href="resultados.jsp?idTorneo=<%=item.getIdTorneo()%>">Ver resultados</a>

            </div>
          </div>
        </div>
         <%}%>
            </div>
          </div>
                <jsp:include page="/footer.jsp" />
  </body>
</html>
