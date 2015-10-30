<%-- 
    Document   : club
    Created on : 01-sep-2015, 21:31:23
    Author     : juanleyba
--%>

<%@page import="Controller.UsuarioController"%>
<%@page import="Model.Torneo"%>
<%@page import="Model.Usuario"%>
<%@page import="Model.Jugador"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="Controller.TorneosController"%>
<%@page import="Model.Club"%>
<%@page import="Controller.ClubesController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

    <%@include file="/html.jsp" %>
      <body>
      <jsp:include page="/header.jsp" />
    <% 
      
        int idTorneo = Integer.parseInt(request.getParameter("idTorneo"));
        TorneosController cc = new TorneosController();
        List<Date> listaHorarios = cc.calcularHorariosPorTorneo(idTorneo);
        Torneo torneo = cc.getTorneoPorId(idTorneo);
        UsuarioController uc = new UsuarioController();
        
        int idUsuario = 0;
        
        int idClub = torneo.getIdClub();
        String mensaje =  "";
        
        switch(torneo.getTipoTorneo()){
            case 1: mensaje = "Abierto";break;
            case 2: mensaje = "Cerrado";break;
            case 3: mensaje = "Sólo socios";break;
        }
        int idClubUser = 0;
    %>
      <h4 class="teal-text">Bienvenido al Torneo </h4>
      <div class="container">
          <h3>"<%=torneo.getNombre()%>" - (<%=mensaje%>)</h3>
         <% 
            Object o = session.getAttribute("usuario");
            boolean isAdmin = uc.isAdmin(o);
         if(isAdmin == false) {
             Usuario usuario = (Usuario) session.getAttribute("usuario");
             int respuestaPosible = cc.posibleInscribirse(torneo, usuario);

             switch (respuestaPosible)
             {
                case 200:%> <a href="inscribirme.jsp?idTorneo=<%=idTorneo%>" class="btn">Inscribirme</a><%;break;
                case 400:%> <div>Para inscribirse debe iniciar sesión.</div><%;break;
                case 401:%> <div>Su cuenta aún no ha sido activada</div><%;break;
                case 402:%> <div>El torneo está cerrado o es sólo para socios.</div><%;break;
                case 403:%>  <div>El torneo está cerrado o es sólo para socios.</div><%;break;
             }

         }else{%>
          <a href="imprimirHorarios.jsp?idTorneo=<%=idTorneo%>" class="btn right">Imprimir</a>
          <%}%>


      <div id="horarios">
       <table class="bordered">
        <thead>
          <tr>
              <th data-field="nombre">Hora</th>
              <th data-field="apellido">Jugador 1</th>
              <th data-field="matricula">Jugador 2</th>
              <th data-field="matricula">Jugador 3</th>
              <th data-field="matricula">Jugador 4</th>
          </tr>
        </thead>

        <tbody>
          
        <% if(listaHorarios != null){ 
            
            for(Date item:listaHorarios) { 
                List<Jugador> listaInscriptos = cc.getInscripcionesPorFechaPorTorneo(item.getTime(),idTorneo);
        %>  
            <tr>
            <td><%=item.getHours()%>:<%= (item.getMinutes()<10)?"0"+item.getMinutes():item.getMinutes() %></td>
                <%for(Jugador j:listaInscriptos){%>
                <td><%=j.getNombre()%> <%=j.getApellido()%></td>
                <%}%>
            </tr>
         <%}}%>
        </tbody>
      </table>
      </div>
        
      </div>
             <jsp:include page="/footer.jsp" />
    </body>
