<%-- 
    Document   : club
    Created on : 01-sep-2015, 21:31:23
    Author     : juanleyba
--%>

<%@page import="Model.Usuario"%>
<%@page import="Model.Jugador"%>
<%@page import="Controller.UsuarioController"%>
<%@page import="java.util.List"%>
<%@page import="Model.Torneo"%>
<%@page import="Controller.TorneosController"%>
<%@page import="Model.Club"%>
<%@page import="Controller.ClubesController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
    <%@include file="html.jsp" %>
    <% 
        UsuarioController uc = new UsuarioController();
        Usuario user = (Usuario)session.getAttribute("usuario");
        Jugador ju = uc.getJugador(user.getIdUsuario());
        TorneosController tc = new TorneosController();
        List<Torneo> listaTorneos = tc.listarInscripcionesPorUsuario(user.getIdUsuario());
        if(ju.getIdUsuario() != user.getIdUsuario())
        {
            response.sendRedirect("error.jsp");
        }
    %>
  <body>
      <jsp:include page="header.jsp" />
      <h4 class="white-text">Bienvenido <%=ju.getNombre()%>&nbsp;  <%=ju.getApellido()%></h4>
      <div class="container">
          <div>
               <table class="bordered">
        <thead>
          <tr>
              <th data-field="nombre">Nombre</th>
              <th data-field="fecha">Fecha</th>
              <th data-field="matricula">Cancelar</th>
             
          </tr>
        </thead>

        <tbody>
             <% for(Torneo item : listaTorneos){%>
       
            <tr>
            <td><%=item.getNombre() %></td>
            <td><%= tc.fechaOrdenada(item.getFecha())%></td>
           
            <td>
                <a href="cancelarInscripcion.jsp?idTorneo=<%=item.getIdTorneo()%>&idUsuario=<%=user.getIdUsuario()%>" class="btn">Cancelar</a>
            </td>
            
            </tr>
         <%}%>
          
        </tbody>
      </table>
         
          </div>
      </div>
       
      <script type="text/javascript" src="js/jquery.js"></script>
      <script type="text/javascript" src="js/materialize.min.js"></script>
      <script type="text/javascript" src="js/scripts.js"></script>
    </body>
