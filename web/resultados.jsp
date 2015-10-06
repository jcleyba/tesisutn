<%-- 
    Document   : altas
    Created on : 28-ago-2015, 20:29:41
    Author     : juanleyba
--%>

<%@page import="Controller.ResultadosController"%>
<%@page import="Model.Resultado"%>
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
<!DOCTYPE html>
 <% 
    int idTorneo = Integer.parseInt(request.getParameter("idTorneo"));
    ResultadosController rc = new ResultadosController();
    List<Resultado> listaScratch = rc.listaResultadosPorTorneo(idTorneo);
    List<Resultado> lista0a9 = rc.listaResultadosPorTorneoPorCategoria(idTorneo,2);
    List<Resultado> lista10a16 = rc.listaResultadosPorTorneoPorCategoria(idTorneo,3);
    List<Resultado> lista17a24 = rc.listaResultadosPorTorneoPorCategoria(idTorneo,4);
    List<Resultado> lista25a36 = rc.listaResultadosPorTorneoPorCategoria(idTorneo,5);
    
    Object user = session.getAttribute("usuario");
    UsuarioController uc = new UsuarioController();
    boolean isAdmin = uc.isAdmin(user);
    
    %>
<html>
        <jsp:include page="/html.jsp" />
          <body>
      <jsp:include page="/header.jsp" />
       <h4 class="teal-text">Resultados</h4>
        <div clasS="container">
             <h4 >Resultado del Torneo</h4>
           <%if(isAdmin==true){%>
           <a href="imprimirResultados.jsp?idTorneo=<%=idTorneo%>" class=btn right"">Imprimir</a>
           <%}%>
             <div class="row">
    <div class="col s12">
      <ul class="tabs">
        <li class="tab col s3"><a class="active" href="#scratch">Scratch</a></li>
        <li class="tab col s3"><a  href="#0a9" class="">0 a 9</a></li>
        <li class="tab col s3"><a  href="#10a16" class="">10 a 16</a></li>
        <li class="tab col s3"><a  href="#17a24" class="">17 a 24</a></li>
        <li class="tab col s3"><a  href="#25a36" class="">25 a 36</a></li>
      </ul>
    </div>
                        

    <div id="clubes" class="col s12">
     <div id="scratch" class="">
     
      <table class="bordered">
        <thead>
          <tr>
              <th data-field="nombre">Nombre</th>
              <th data-field="apellido">Apellido</th>
              <th data-field="matricula">Gross</th>
              <%if(isAdmin == true){%>
                <th data-field="matricula">Editar</th>
               <%}%>
          </tr>
        </thead>

        <tbody>
          
        <% if(listaScratch != null){
            for(Resultado item : listaScratch) { %>
            <tr>
            <td><%=item.getNombreJugador()%></td>
            <td><%=item.getApellidoJugador()%></td>
            <td><%=item.getSumaHoyos()%></td>
            <%if(isAdmin == true){%><td data-field="matricula">
                <a href="/admin/editarResultado.jsp?idResultado=<%=item.getIdResultado()%>&idTorneo=<%=idTorneo%>" class="btn">Editar</a>
                   </td>
                   <%}%>
            </tr>
         <%}}%>
          
        </tbody>
      </table>
    </div>
    <div id="0a9" class="">
     
      <table class="bordered">
        <thead>
          <tr>
              <th data-field="nombre">Nombre</th>
              <th data-field="apellido">Apellido</th>
              <th data-field="matricula">Gross</th>
               <th data-field="apellido">Handicap</th>
                <th data-field="apellido">Neto</th>
                <%if(isAdmin == true){%>
                <th data-field="matricula">Editar</th>
               <%}%>
          </tr>
        </thead>

        <tbody>
          
        <% if(lista0a9 != null){
            for(Resultado item : lista0a9) { %>
            <tr>
            <td><%=item.getNombreJugador()%></td>
            <td><%=item.getApellidoJugador()%></td>
            <td><%=item.getSumaHoyos()%></td>
            <td class="teal-text"><%=item.getHandicap()%></td>
            <td class=""><%=item.getScoreNeto()%>   </td> 
                <%if(isAdmin == true){%><td data-field="matricula">
                <a href="/admin/editarResultado.jsp?idResultado=<%=item.getIdResultado()%>&idTorneo=<%=idTorneo%>" class="btn">Editar</a>
                   </td>
                   <%}%>
            </tr>
         <%}}%>
          
        </tbody>
      </table>
    </div>
    <div id="10a16" class="">
     
      <table class="bordered">
        <thead>
          <tr>
              <th data-field="nombre">Nombre</th>
              <th data-field="apellido">Apellido</th>
              <th data-field="matricula">Gross</th>
               <th data-field="apellido">Handicap</th>
                <th data-field="apellido">Neto</th>
                <%if(isAdmin == true){%>
                <th data-field="matricula">Editar</th>
               <%}%>
          </tr>
        </thead>

        <tbody>
          
        <% if(lista10a16 != null){
            for(Resultado item : lista10a16) { %>
            <tr>
            <td><%=item.getNombreJugador()%></td>
            <td><%=item.getApellidoJugador()%></td>
            <td><%=item.getSumaHoyos()%></td>
            <td><%=item.getHandicap()%></td>
            <td><%=item.getScoreNeto()%>   </td> 
                <%if(isAdmin == true){%><td data-field="matricula">
                <a href="/admin/editarResultado.jsp?idResultado=<%=item.getIdResultado()%>&idTorneo=<%=idTorneo%>" class="btn">Editar</a>
                   </td>
                   <%}%>
            </tr>
         <%}}%>
          
        </tbody>
      </table>
    </div>     
    <div id="17a24" class="">
     
      <table class="bordered">
        <thead>
          <tr>
              <th data-field="nombre">Nombre</th>
              <th data-field="apellido">Apellido</th>
              <th data-field="matricula">Gross</th>
               <th data-field="apellido">Handicap</th>
                <th data-field="apellido">Neto</th>
                <%if(isAdmin == true){%>
                <th data-field="matricula">Editar</th>
               <%}%>
          </tr>
        </thead>

        <tbody>
          
        <% if(lista17a24 != null){
            for(Resultado item : lista17a24) { %>
            <tr>
            <td><%=item.getNombreJugador()%></td>
            <td><%=item.getApellidoJugador()%></td>
            <td><%=item.getSumaHoyos()%></td>
            <td><%=item.getHandicap()%></td>
            <td><%=item.getScoreNeto()%>   </td> 
                <%if(isAdmin == true){%><td data-field="matricula">
                <a href="/admin/editarResultado.jsp?idResultado=<%=item.getIdResultado()%>&idTorneo=<%=idTorneo%>" class="btn">Editar</a>
                   </td>
                   <%}%>
            </tr>
         <%}}%>
          
        </tbody>
      </table>
    </div>     
    <div id="25a36" class="">
     
      <table class="bordered">
        <thead>
          <tr>
              <th data-field="nombre">Nombre</th>
              <th data-field="apellido">Apellido</th>
              <th data-field="matricula">Gross</th>
               <th data-field="apellido">Handicap</th>
                <th data-field="apellido">Neto</th>
                <%if(isAdmin == true){%>
                <th data-field="matricula">Editar</th>
               <%}%>
          </tr>
        </thead>

        <tbody>
          
        <% if(lista25a36 != null){
            for(Resultado item : lista25a36) { %>
            <tr>
            <td><%=item.getNombreJugador()%></td>
            <td><%=item.getApellidoJugador()%></td>
            <td><%=item.getSumaHoyos()%></td>
            <td><%=item.getHandicap()%></td>
            <td><%=item.getScoreNeto()%>    </td>
                <%if(isAdmin == true){%><td data-field="matricula">
                <a href="/admin/editarResultado.jsp?idResultado=<%=item.getIdResultado()%>&idTorneo=<%=idTorneo%>" class="btn">Editar</a>
                   </td>
                   <%}%>
            </tr>
         <%}}%>
          
        </tbody>
      </table>
    </div>     
  </div>
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
         <script type="text/javascript" src="/js/jquery.js"></script>
      <script type="text/javascript" src="/js/materialize.min.js"></script>
      <script type="text/javascript" src="/js/scripts.js"></script>

  </body>
</html>
