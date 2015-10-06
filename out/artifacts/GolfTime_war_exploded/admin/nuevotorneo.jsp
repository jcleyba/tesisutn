<%-- 
    Document   : nuevotorneo
    Created on : 03-sep-2015, 21:32:00
    Author     : juanleyba
--%>

<%@page import="Model.TipoTorneo"%>
<%@page import="Controller.TorneosController"%>
<%@page import="java.util.List"%>
<%@page import="Model.Intervalo"%>
<%@page import="Model.Club"%>
<%@page import="Controller.ClubesController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <%@include file="/html.jsp" %>
   <% 
    TorneosController cc = new TorneosController();
    List<Intervalo> listaInter = cc.listarIntervalos();
    List<TipoTorneo> listaTipos = cc.listarTipos();
    int idClub = Integer.parseInt(request.getParameter("id"));
    %>
  <body>
      <jsp:include page="/header.jsp" />
      <h4 class="teal-text">Agregar nuevo torneo</h4>
      <div class="container">
          <form class="col s12" method="POST" action="agregarTorneo.jsp">
      <div class="row">
        <div class="input-field col s4">
          <input id="first_name" type="text" class="validate" required name="nombreTxt">
          <label for="first_name">Nombre</label>
        </div>
        <div class="input-field col s4">
          <input id="last_name" type="date" class="validate" required name="dateTxt">
          <label for="last_name"></label>
        </div>
           <div class="input-field col s4">
          <input id="username" type="number" min="2" max="4" class="validate" required name="jugadoresTxt">
          <label for="username">Cantidad jugadores por linea</label>
          <input type="text" value="<%= idClub %>" name="txtIdClub" hidden>
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
                  <option value="" disabled selected>Intervalo</option>
                  <% for(Intervalo item: listaInter) {%>
                  <option value="<%=item.getIdIntervalo()%>"><%=item.getNombre()%></option>
                  <%}%>                  
              </select>
              <select name="comboTipoTorneo" class="col s6" required>
                  <option value="" disabled selected>Tipo Torneo</option>
                  <% for(TipoTorneo item:listaTipos) {%>
                  <option value="<%=item.getIdTipoTorneo()%>"><%=item.getTipoDescripcion()%></option>
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
