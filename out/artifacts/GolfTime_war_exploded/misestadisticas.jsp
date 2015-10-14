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

<!DOCTYPE html>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
    <%@include file="html.jsp" %>
    <%
        UsuarioController uc = new UsuarioController();
        Usuario user = (Usuario)session.getAttribute("usuario");
        Jugador ju = uc.getJugador(user.getIdUsuario());

        EstadisticasController ec = new EstadisticasController();
        float[] array = ec.estadisticasJugador(ju.getIdJugador()) ;
        ArrayList listaPorMes = ec.estadisticasPorMes(ju.getIdJugador());
    %>
<header>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link type="text/css" rel="stylesheet" href="/css/materialize.min.css"  media="screen,projection"/>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="/css/style.css"  media="screen,projection"/>
    <script type="text/javascript" src="/js/jsapi.js"></script>
    <!--Let browser know website is optimized for mobile-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <script type="text/javascript">
        setTimeout(function(){google.load('visualization', '1', {'callback':drawChart, 'packages':['bar']})}, 200);
        setTimeout(function(){google.load('visualization', '1', {'callback':drawChart2, 'packages':['bar']})}, 1000);

        function drawChart() {
            var data = google.visualization.arrayToDataTable([
                ['Promedios', 'Valores'],
                ['Promedio Score', <%=array[0]%>],
                ['Promedio Handicap', <%=array[1]%>],
                ['Torneos Jugados', <%=array[2]%>],
            ]);

            var options = {
                chart: {
                    title: 'Estadísticas Generales'
                },
                height: 400
            };
            var chart = new google.charts.Bar(document.getElementById('chart'));
            chart.draw(data, options);
        }

        function drawChart2(){
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


            var chart2 = new google.charts.Bar(document.getElementById('chart_div'));
            chart2.draw(data2, options2);
        }
    </script>
</header>
  <body>


      <jsp:include page="header.jsp" />
      <h4 class="teal-text">Bienvenido <%=ju.getNombre()%>&nbsp;  <%=ju.getApellido()%></h4>
      <div class="container" style="background-color: white">
          <div id="chart"></div>
          <div id="chart_div"></div>
          <head></head>
      </div>
  <jsp:include page="/footer.jsp" />

  </body>
