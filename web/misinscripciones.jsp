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
<!DOCTYPE html>
<html>
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
      <h4 class="teal-text">Bienvenido <%=ju.getNombre()%>&nbsp;<%=ju.getApellido()%></h4>
      <div class="container">
        <div>
        <%if(listaTorneos.size()>0) {%>
        <p>Si cancela su inscripción no podrá volver a inscribirse en el mismo torneo.</p>
        <table class="bordered">
        <thead>
          <tr>
              <th data-field="nombre">Nombre</th>
              <th data-field="fecha">Fecha</th>
              <th data-field="editar">Editar</th>
              <th data-field="matricula">Cancelar</th>
             
          </tr>
        </thead>

        <tbody>
             <% for(Torneo item : listaTorneos){%>
       
            <tr>
            <td><a href="/torneo.jsp?idTorneo=<%=item.getIdTorneo()%>"><%=item.getNombre() %></a></td>
            <td><%= tc.fechaOrdenada(item.getFecha())%></td>
                <td>
                    <a href="editarInscripcion.jsp?idTorneo=<%=item.getIdTorneo()%>" class="btn">Editar</a>
                </td>
            <td>
                <script>
                    var confirmacion = function(torneo,idusuario)
                    {
                        var con = confirm("Si cancela su inscripción no podrá volver a inscribirse. ¿Desea continuar?");
                        if(con == true)
                        {
                            window.location.href = "cancelarInscripcion.jsp?idTorneo="+torneo+"&idUsuario="+idusuario;
                        }
                    }
                </script>
                <button onclick="confirmacion(<%=item.getIdTorneo()%> , <%=user.getIdUsuario()%>)" class="btn red">Cancelar</button>
            </td>
            
            </tr>
         <%}%>
          
        </tbody>
      </table>
         <%}else{%>
              <div><p class="red-text">Usted aún no tiene inscripciones disponibles.</p></div>
              <%}%>
          </div>
      </div>

      <jsp:include page="/footer.jsp" />

  </body>
</html>