<%-- 
    Document   : error
    Created on : 19-ago-2015, 22:27:15
    Author     : juanleyba
--%>

<%@page import="Model.Administrador"%>
<%@page import="Controller.UsuarioController"%>
<%@page import="Model.Usuario"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Model.Torneo"%>
<%@page import="Model.TipoTorneo"%>
<%@page import="Model.Intervalo"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="Controller.TorneosController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

   <% 
    Administrador user = (Administrador)session.getAttribute("usuario");
    UsuarioController uc = new UsuarioController();
    Usuario admin = uc.getAdmin(user.getIdAdministrador());
    TorneosController cc = new TorneosController();
    List<Intervalo> listaInter = cc.listarIntervalos();
    List<TipoTorneo> listaTipos = cc.listarTipos();
    int idTorneo = Integer.parseInt(request.getParameter("id"));
    Torneo torneo = cc.getTorneoPorId(idTorneo);
    int jugadoresXTorneo = torneo.getJugadoresPorLinea();
    if(torneo.getIdClub() != admin.getIdClub())
    {
        response.sendRedirect("index.jsp");
    }
    
    %>
<!DOCTYPE html>
<html>
    <%@include file="/html.jsp" %>
  <body>
      <jsp:include page="/header.jsp" />
      <h4 class="teal-text">Editar Torneo</h4>
      
      <div class="container">
         
    <form class="col s12" method="POST" action="updateTorneos.jsp?id=<%=idTorneo%>">
      <div class="row">
        <div class="input-field col s4">
          <input id="first_name" type="text" class="validate" value="<%=torneo.getNombre()%>" required name="nombreTxt">
        </div>
        <div class="input-field col s4">
          <input id="fecha" type="date" class="validate" required name="dateTxt">
          <label for="fecha"></label>
        </div>
           <div class="input-field col s4">
               <input id="username" type="number" min="2" max="4" class="validate" value='<%=torneo.getJugadoresPorLinea()%>' required name="jugadoresTxt">
          <label for="username">Cantidad jugadores por linea</label>
          <input type="text" value="<%= torneo.getIdClub() %>" name="txtIdClub" hidden>
        </div>
      </div>

      <div class="row">
        <div class=" col s6">
          <input id="email" type="time" class="" required name="horaInicioTxt">
          <label for="email">Hora inicio</label>
        </div>
           <div class=" col s6">
          <input id="email" type="time" class="" required name="horaCierreTxt">
          <label for="email">Hora cierre</label>
        </div>
        <div class="row"> 
            <select name="comboIntervalo" class="col s6" required>
                 
                  <% for(Intervalo item: listaInter) {%>
                  <option value="<%=item.getIdIntervalo()%>" <%if (item.getIdIntervalo()== torneo.getIntervalo()){%>selected<%}%> ><%=item.getNombre()%></option>
                  <%}%>                  
              </select>
              <select name="comboTipoTorneo" class="col s6" required>
                  <option value="" disabled selected>Tipo Torneo</option>
                  <% for(TipoTorneo item:listaTipos) {%>
                  <option value="<%=item.getIdTipoTorneo()%>"
                          <%if (item.getIdTipoTorneo()== torneo.getTipoTorneo()){%>selected<%}%>                   
><%=item.getTipoDescripcion()%></option>
                  <%}%>                  
              </select>
              <br>
              
          </div> 
              <div class="row center-align">
                <div class="input-field col s12">
                    <input type="submit" value="Enviar" class="btn ">
                </div>
              </div>
      </div>
    </form>
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
      <script type="text/javascript" src="/js/jquery.js"></script>
      <script type="text/javascript" src="/js/materialize.min.js"></script>
      <script type="text/javascript" src="/js/scripts.js"></script>
    </body>
    </html>