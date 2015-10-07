<%-- 
    Document   : altas
    Created on : 28-ago-2015, 20:29:41
    Author     : juanleyba
--%>

<%@page import="Controller.TorneosController"%>
<%@page import="Model.Torneo"%>
<%@page import="Model.Administrador"%>
<%@page import="Controller.UsuarioController"%>
<%@page import="Model.Jugador"%>
<%@page import="Model.Usuario"%>
<%@page import="Controller.AdminController"%>
<%@page import="java.util.List"%>
<%@page import="Controller.ClubesController"%>
<%@page import="Model.Club"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="checkRol.jsp" />
<!DOCTYPE html>
 <% 
    int idclub = 0;
    List<Jugador> lista = null; 
    List<Torneo> listaTorneos = null;
    UsuarioController uc = new UsuarioController();
    Object user = session.getAttribute("usuario");
    
    boolean isAdmin = uc.isAdmin(user);
    if(user == null || !isAdmin )
    {
        response.sendRedirect("/administrador.jsp");
    }
    else {
    AdminController cc = new AdminController();
    Administrador admin = (Administrador)user;
    lista = cc.obtenerJugadoresPorClub(admin);
    session.setAttribute("usuario",admin);
    idclub = cc.getAdminClubId(admin);
    TorneosController tc = new TorneosController();
    listaTorneos = tc.listarTorneos(idclub);
    }
    %>
<html>
        <jsp:include page="/html.jsp" />
          <body>
      <jsp:include page="/header.jsp" />
       <h4 class="teal-text">Consola Administrador</h4>
        <div clasS="container">
             <div class="row">
            <div class="col s12">
              <ul class="tabs">
                  <li class="tab col s3"><a  href="#clubes">Jugadores</a></li>
                  <li class="tab col s3"><a  href="#admin" class="active">Torneos</a></li>
                  <li class="tab col s3"><a  href="#stats" >Estadísticas</a></li>
              </ul>
            </div>
            <div id="clubes" class="col s12">
             <div id="loginForm" class="">
             <a href="imprimirJugadores.jsp?idClub=<%=idclub%>" class="btn right">Imprimir Lista</a>
              <table class="bordered">
                <thead>
                  <tr>
                      <th data-field="apellido">Apellido</th>
                      <th data-field="nombre">Nombre</th>
                      <th data-field="matricula">Matricula</th>
                      <th data-field="matricula">Activar</th>
                      <th data-field="matricula">Editar</th>
                  </tr>
                </thead>

                <tbody>

                <% if(lista != null){
                    for(Jugador item:lista) { %>
                    <tr>
                    <td><%=item.getApellido()%></td>
                    <td><%=item.getNombre() %></td>
                    <td><%=item.getMatricula()%></td>
                    <td><%if(item.getEstado() == 0){%>
                        <a href="activarJugador.jsp?id=<%=item.getIdJugador()%>" class="btn">Activar</a>
                    <%} else {%>
                        <a href="desactivarJugador.jsp?id=<%=item.getIdJugador()%>" class="btn">Desactivar</a>
                    <%}%>
                    </td>
                    <td> <a href="editarJugador.jsp?id=<%=item.getIdJugador()%>" class="btn">Editar</a></td>
                    </tr>
                 <%}}%>

                </tbody>
              </table>
            </div>
          </div>
             </div>
     <div id="admin" class="col s12">
         <table class="bordered">
        <thead>
          <tr>
              <th data-field="nombre">Nombre</th>
              <th data-field="fecha">Fecha</th>
              <th data-field="tipoTorneo">Tipo de Torneo</th>
              <th data-field="matricula">Editar</th>
              <th data-field="matricula">Cerrar</th>
              <th data-field="matricula">Cargar Resultados</th>

          </tr>
        </thead>

        <tbody>
          
        <% TorneosController tt = new TorneosController();
           if(lista != null){
            for(Torneo item:listaTorneos) { %>
            <tr>
            <td><a href="/resultados.jsp?idTorneo=<%=item.getIdTorneo()%>"><%=item.getNombre()%></a></td>
            <td><%= tt.fechaOrdenada(item.getFecha())%></td>
            <td><%=item.getTipoDescripcion()%></td>
            <td>
                <a href="editarTorneo.jsp?id=<%=item.getIdTorneo()%>" class="btn">Editar</a>
            </td>
            <td>
                <a href="cerrarTorneo.jsp?id=<%=item.getIdTorneo()%>" class="btn">Cerrar</a>
            </td>
            <td>
                <a href="cargaResultados.jsp?idTorneo=<%=item.getIdTorneo()%>" class="btn">Cargar</a>
            </td>
            </tr>
         <%}}%>
          
        </tbody>
      </table>
         <br>   
             <a href="nuevotorneo.jsp?id=<%=idclub%>" class="btn">Nuevo torneo</a>
        
     </div>
            <div id="stats">
            </div>
    
  </div>
                   <jsp:include page="/footer.jsp" />
  </body>
</html>
