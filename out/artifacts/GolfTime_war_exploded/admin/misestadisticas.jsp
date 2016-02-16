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
    <%
        int anio = 2016;
        if(request.getParameter("anioFiltro") != null)
        {
            anio = Integer.parseInt(request.getParameter("anioFiltro"));
        }
        UsuarioController uc = new UsuarioController();
        Administrador admin = (Administrador)session.getAttribute("usuario");
        Usuario user = uc.getAdmin(admin.getIdAdministrador());
        int idclub = user.getIdClub();
        EstadisticasController ec = new EstadisticasController();
        float[] array = ec.estadisticasGeneralesPorClub(idclub);
        ArrayList arrayPorMes = ec.estadisticasPorMesPorClub(idclub,anio);
        float[] arrayTipos = ec.estadisticasTiposTorneosPorClub(idclub, anio);
        float[] arrayTorneosAbiertos = ec.estadisticasSociosyNoSocios(idclub, anio);
    %>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link type="text/css" rel="stylesheet" href="/css/materialize.min.css"  media="screen,projection"/>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="/css/style.css"  media="screen,projection"/>
    <script type="text/javascript" src="/js/jsapi.js"></script>
    <!--Let browser know website is optimized for mobile-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <script type="text/javascript">
        setTimeout(function(){google.load('visualization', '1', {'callback':drawChart1, 'packages':['bar','corechart']})}, 200);
        setTimeout(function(){google.load('visualization', '1', {'callback':drawChart2, 'packages':['bar','corechart']})}, 1000);
        setTimeout(function(){google.load('visualization', '1', {'callback':drawChart3, 'packages':['bar','corechart']})}, 400);
        setTimeout(function(){google.load('visualization', '1', {'callback':drawChart4, 'packages':['bar','corechart']})}, 500);


        function drawChart1() {
          var data = google.visualization.arrayToDataTable([
              ['Valores', 'Promedios'],
              ['Promedio Jugadores por torneos', <%=array[0]%>],
              ['Torneos Jugados', <%=array[1]%>],

          ]);

          var options = {
              chart: {
                  title: 'Estadísticas Generales'
              },
              height: 400,
              width:800
          };

          var chart = new google.charts.Bar(document.getElementById('chart'));

          chart.draw(data, options);

      }
        function drawChart2(){
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

            var options2 = {
                chart: {
                    title: 'Estadísticas por Mes'
                },
                hAxis: {title: 'Mes'},
                vAxis: {minValue: 0},
                height: 400,
                width:800,
                legend: { position: 'top' }
            };

            var chart2 = new google.charts.Bar(document.getElementById('chart_div'));
            chart2.draw(data2, options2);

        }

      function drawChart3() {
          var data3 = google.visualization.arrayToDataTable([
              ['Tipos', 'Cantidad'],
              ['Abierto', <%=arrayTipos[0]%>],
              ['Cerrado', <%=arrayTipos[1]%>],
              ['Sólo Socios', <%=arrayTipos[2]%>],
          ]);


          var options3 = {
              title: 'Tipos de torneos disputados',
              height: 400,
              width:800
          };

          var chart3 = new google.visualization.PieChart(document.getElementById('pie_div'));
          chart3.draw(data3, options3);
      }
        function drawChart4() {
            var data4 = google.visualization.arrayToDataTable([
                ['Tipos', 'Cantidad'],
                ['Socios', <%=arrayTorneosAbiertos[0]%>],
                ['No Socios', <%=arrayTorneosAbiertos[1]%>]
            ]);


            var options4 = {
                title: 'Torneos Abiertos',
                height: 400,
                width:800
            };

            var chart4 = new google.visualization.PieChart(document.getElementById('pie2_div'));
            chart4.draw(data4, options4);
        }
          function cargarCharts() {
                  drawChart1();
                  drawChart2();
                  drawChart3();
              drawChart4();

          };


      google.setOnLoadCallback(cargarCharts());
        google.setOnLoadCallback(drawChart2());


    </script>

  </head>

  <body>
      <jsp:include page="/header.jsp" />
      <h4 class="teal-text">Bienvenido a sus estadísticas</h4>
      <div class="container" style="background-color: white">
          Seleccione el año que desea consultar <form class="row">
              <select name="anioFiltro" class="col m3">
                  <option value="2015" selected disabled>Año</option>
                  <option value="2015" >2015</option>
                  <option value="2016" >2016</option>
              </select>&nbsp;&nbsp;
              <input type="submit" value="Actualizar" class="btn" onclick="cargarCharts()">
          </form>
          <div id="chart"></div>

          <div id="chart_div"></div>

          <div id="pie_div"></div>

          <div id="pie2_div"></div>
      </div>
      <jsp:include page="/footer.jsp" />

  </body>
