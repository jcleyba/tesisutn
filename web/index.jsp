<%-- 
    Document   : index
    Created on : 13-ago-2015, 22:33:09
    Author     : juanleyba
--%>

<%@page import="Model.Torneo"%>
<%@page import="java.util.List"%>
<%@page import="Model.Club"%>
<%@page import="Controller.TorneosController"%>
<%@page import="Controller.ClubesController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.Usuario"%>
<%           
    Usuario user = (Usuario)session.getAttribute("usuario");

    ClubesController cc = new ClubesController();
    TorneosController tc = new TorneosController();
    List<Club> listaClubes = cc.listarClubesActivos();
    List<Torneo> listaTorneos = tc.listarProximosTorneos();
%>
<!DOCTYPE html>
<html>
    <%@include file="html.jsp" %>
  <body>
      <jsp:include page="header.jsp" />
      <h4 class="teal-text">Bienvenido a Golf Time</h4>
      <div class="container">
          <p>En Golftime podrás consultar los horarios disponibles en cada torneo de tu club. Además de seguir tus propias estadísticas de resultados por torneo</p>
          <div class="row"> 
              <h5 class="col s5">Clubes</h5><div class="col s2" >&nbsp;</div><h5 class="col s5">Próximos torneos</h5>
                 <ul class="collection col s5">
                      
                   <%for(Club item : listaClubes){%>
                    <li class="collection-item avatar">
                      <img src="images/<%=item.getLogo()%>" alt="<%=item.getNombre()%>" class="circle">
                      <span class="title teal-text"><%=item.getNombre()%></span>
                      <p>
                          <%=item.getDireccion()%><br>
                          <%=item.getTelefono()%>
                      </p>
                      <a href="club.jsp?id=<%=item.getIdClub()%>" class="secondary-content"><i class="material-icons">play_arrow</i></a>
                    </li>
                     <%}%>
                 </ul>
                
            <div class="col s2">&nbsp;</div>
         <ul class="collection col s5">
        
        <%for(Torneo item : listaTorneos){%>
        <li class="collection-item"><div><%=item.getNombre()%><a href="torneo.jsp?idTorneo=<%=item.getIdTorneo()%>" class="secondary-content"><i class="material-icons">send</i></a></div></li>
                <%}%>
      </ul>
            
            </div>
          
          
      </div>
            <jsp:include page="/footer.jsp" />

  </body>
</html>
