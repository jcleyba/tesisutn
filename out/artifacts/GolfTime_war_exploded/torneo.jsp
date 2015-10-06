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
         if(isAdmin == false){   
            Usuario usuario = (Usuario)session.getAttribute("usuario");
            boolean posible = cc.posibleInscribirse(torneo, usuario);
            int estado = 0;
            
            if(usuario != null){
                Jugador jug =  uc.getJugador(usuario.getIdUsuario());
                estado = jug.getEstado();
            }
            if(estado == 1){ 
                if(usuario != null && posible){       
            %>
            <a href="inscribirme.jsp?idTorneo=<%=idTorneo%>" class="btn">Inscribirme</a>
            
                
                
           <%  }else if(usuario == null){%>
            
             <div>Para inscribirse debe iniciar sesión.</div>
        
     
        <%}else if(usuario != null && !posible){%>
             <div>El torneo está cerrado o es sólo para socios.</div>
         
         
         <%}else {%>
                 <div>El torneo está cerrado o es sólo para socios.</div>
            <%}}else{%>
            
            <div>Su cuenta aún no ha sido activada</div>
            <%}}else {%>
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
