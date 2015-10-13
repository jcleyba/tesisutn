<%-- 
    Document   : club
    Created on : 01-sep-2015, 21:31:23
    Author     : juanleyba
--%>


<%@ page import="Controller.EstadisticasController" %>
<%@ page import="Controller.UsuarioController" %>
<%@ page import="Model.Usuario" %>
<%@ page import="Model.Administrador" %>
<%@ page import="java.util.ArrayList" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
    <%@include file="/html.jsp" %>
    <%
        UsuarioController uc = new UsuarioController();
        Administrador admin = (Administrador)session.getAttribute("usuario");
        Usuario user = uc.getAdmin(admin.getIdAdministrador());
        int idclub = user.getIdClub();
        EstadisticasController ec = new EstadisticasController();
        float[] array = ec.estadisticasGeneralesPorClub(idclub);
        ArrayList arrayPorMes = ec.estadisticasPorMesPorClub(idclub);


    %>
  <body>
  <script type="text/javascript">
      google.load("visualization", "1", {packages:["bar"]});
      google.setOnLoadCallback(drawChart);
      function drawChart() {
          var data = google.visualization.arrayToDataTable([
              ['Valores','Promedios'],
              ['Promedio Jugadores por torneos',<%=array[0]%>],
              ['Torneos Jugados',<%=array[1]%>],

          ]);

          var data2 = google.visualization.arrayToDataTable([
              ['Mes', 'Torneos jugados', 'Cantidad Inscriptos', 'Promedio Inscripciones'],
              <%for(Object item : arrayPorMes){%>
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

          var options = {
              chart: {
                  title: 'Estadísticas Generales'
              },
              height: 400
          };
          var options2 = {
              chart: {
                  title: 'Estadísticas por Mes'
              },
              hAxis: {title: 'Mes'},
              vAxis: {minValue: 0},
              height: 400,
              legend: { position: 'top' }
          };
          var chart = new google.charts.Bar(document.getElementById('chart'));
          var chart2 = new google.charts.Bar(document.getElementById('chart_div'));
          chart.draw(data, options);
          setTimeout(function(){chart2.draw(data2, options2);},500);
      }
  </script>
      <jsp:include page="/header.jsp" />
      <h4 class="teal-text">Bienvenido a sus estadísticas</h4>
      <div class="container" style="background-color: white">
          <div id="chart"></div>
          <div id="chart_div"></div>
          <head></head>
      </div>
      <jsp:include page="/footer.jsp" />

  </body>
