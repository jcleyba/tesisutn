<%-- 
    Document   : club
    Created on : 01-sep-2015, 21:31:23
    Author     : juanleyba
--%>

<%@page import="Controller.UsuarioController"%>
<%@page import="Model.Jugador"%>
<%@page import="Model.Usuario"%>
<%@page import="Model.Torneo"%>
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
        Torneo torneo = cc.getTorneoPorId(idTorneo);
        List<Date> listaHorarios = cc.calcularHorariosPorTorneo(idTorneo);
        Usuario user = (Usuario)session.getAttribute("usuario");
        UsuarioController uc = new UsuarioController();
        Jugador jugador = uc.getJugador(user.getIdUsuario());
        boolean posible = cc.posibleInscribirse(torneo, user);
        boolean inscripto = cc.inscripto(idTorneo, jugador.getIdJugador());
        
        if(inscripto == true){
            response.sendRedirect("yainscripto.jsp");
        }
        
       %>
      <h4 class="teal-text">Inscribirme al torneo "<%= torneo.getNombre()%>"</h4>
      <div class="container">
          <%if(user != null && posible){%>
          <form action="agregarInscripcion.jsp" method="POST" class="col s12">
            <div class="row">
             
              <div class="input-field col s3">
             <input type="text" value="<%= jugador.getNombre()%>" disabled name="txtNombre"/>
              </div>
               <div class="input-field col s3">
             <input type="text" value="<%= jugador.getApellido()%>" disabled name="txtApellido"/>
               </div> 
              <div class="input-field col s3">
             <input type="text" value="<%= jugador.getMatricula()%>" disabled name="txtNombre"/>
             <input type="text" hidden value="<%= jugador.getIdJugador()%>" name="idjugadorTxt">
             <input type="text" hidden value="<%= idTorneo%>" name="idtorneoTxt">
               </div>
                <select name="comboHorarios" class="input-field col s3" required>
                  <option value="" disabled selected>Horario</option>
                  <% for(Date item:listaHorarios) {%>
                  <option value="<%=item.getTime()%>"><%=item.getHours()%>:<%= (item.getMinutes()<10)?"0"+item.getMinutes():item.getMinutes() %></option>
                  <%}%>                  
              </select>
              
              </div>
              
             <div class="row center-align">
                <div class="input-field col s12">
                    <input type="submit" value="Enviar" class="btn">
                </div>
              </div>
        
    </form>
              <%}else {%>
              <h4>Usted no está habilitado para inscribirse en este torneo</h4>
               <%}%>
      </div>
      
            <jsp:include page="/footer.jsp" />
    </body>
