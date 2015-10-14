<%-- 
    Document   : altas
    Created on : 28-ago-2015, 20:29:41
    Author     : juanleyba
--%>

<%@page import="Controller.ResultadosController"%>
<%@page import="Model.Resultado"%>
<%@page import="Controller.UsuarioController"%>
<%@page import="java.util.List"%>
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
       <h4 class="teal-text">Resultados del torneo</h4>
        <div clasS="container">

           <%if(isAdmin==true){%>
           <a href="imprimirResultados.jsp?idTorneo=<%=idTorneo%>" class=btn right"">Imprimir</a>
           <%}%>
             <div class="row">
    <div class="col s12">
      <ul class="tabs">
        <li class="tab col s3"><a  href="#scratch" class="active">Scratch</a></li>
        <li class="tab col s3"><a  href="#cat0a9" class="">0 a 9</a></li>
        <li class="tab col s3"><a  href="#cat10a16" class="">10 a 16</a></li>
        <li class="tab col s3"><a  href="#cat17a24" class="">17 a 24</a></li>
        <li class="tab col s3"><a  href="#cat25a36" class="">25 a 36</a></li>
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
    <div id="cat0a9" class="">
     
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
    <div id="cat10a16" class="">
     
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
    <div id="cat17a24" class="">
     
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
    <div id="cat25a36" class="">
     
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
                   <jsp:include page="/footer.jsp" />


  </body>
</html>
