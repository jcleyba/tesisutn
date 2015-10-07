<%-- 
    Document   : club
    Created on : 01-sep-2015, 21:31:23
    Author     : juanleyba
--%>


<%@ page import="Controller.EstadisticasController" %>
<%@ page import="Controller.UsuarioController" %>
<%@ page import="Model.Usuario" %>
<%@ page import="Model.Jugador" %>
<%@ page import="java.util.ArrayList" %>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
    <%@include file="html.jsp" %>
    <%
        UsuarioController uc = new UsuarioController();
        Usuario user = (Usuario)session.getAttribute("usuario");
        Jugador ju = uc.getJugador(user.getIdUsuario());

        int idJugador = ju.getIdJugador();
        EstadisticasController ec = new EstadisticasController();
        float[] array = ec.estadisticasJugador(idJugador) ;
        ArrayList listaPorMes = ec.estadisticasPorMes(idJugador);
    %>
  <body>
  <script type="text/javascript">
      google.load("visualization", "1.1", {packages:["bar"]});
      google.setOnLoadCallback(drawChart);
      function drawChart() {
          var data = google.visualization.arrayToDataTable([
              ['Promedios','Valores'],
              ['Promedio Score',<%=array[0]%>],
              ['Promedio Handicap',<%=array[1]%>],
              ['Torneos Jugados',<%=array[2]%>],
          ]);
          var data2 = google.visualization.arrayToDataTable([
              ['Mes', 'Promedio Score', 'Promedio Handicap', 'Torneos Jugados'],
              <%for(Object item : listaPorMes){%>
              [
                  <%for(Object j : (ArrayList)item)
                  {
                    if(j instanceof String){%>
                  '<%=j.toString()%>',
                  <%}else{%>
                  <%=j.toString()%>,
                  <%}%>

                  <%}%>
              ],
              <%}%>
          ]);

          var options2 = {
              chart: {
                  title: 'Estadísticas por Mes'
              },
              hAxis: {title: 'Mes'},
              vAxis: {minValue: 0},
              height: 400,
              legend: { position: 'top' }
          };

          var options = {
              chart: {
                  title: 'Estadísticas Generales'
              },
              height: 400
          };
          var chart = new google.charts.Bar(document.getElementById('chart'));
          var chart2 = new google.charts.Bar(document.getElementById('chart_div'));
          chart.draw(data, options);
          setTimeout(function(){chart2.draw(data2, options2);},500);
      }
  </script>
      <jsp:include page="header.jsp" />
      <h4 class="teal-text">Bienvenido <%=ju.getNombre()%>&nbsp;  <%=ju.getApellido()%></h4>
      <div class="container" style="background-color: white">
          <div id="chart"></div>
          <div id="chart_div"></div>
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