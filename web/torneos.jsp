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
      <div class="container">
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
               <a href="torneo.jsp?idTorneo=<%=item.getIdTorneo()%>">Ver Horarios</a> 
               <a href="resultados.jsp?idTorneo=<%=item.getIdTorneo()%>">Ver resultados</a>

            </div>
          </div>
        </div>
         <%}%>
            </div>
          </div>
                <jsp:include page="/footer.jsp" />
      <script type="text/javascript" src="js/jquery.js"></script>
       <script type="text/javascript" src="js/materialize.min.js"></script>
      <script type="text/javascript" src="js/scripts.js"></script>   
  </body>
</html>
