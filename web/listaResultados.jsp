<%-- 
    Document   : altas
    Created on : 28-ago-2015, 20:29:41
    Author     : juanleyba
--%>


<%@page import="Model.Torneo"%>
<%@ page import="Controller.TorneosController" %>
<%@ page import="java.util.List" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <%
     TorneosController tc = new TorneosController();
     List<Torneo> listaTorneos = tc.listarTorneosPrevios();

 %>
<html>
        <jsp:include page="/html.jsp" />
          <body>
      <jsp:include page="/header.jsp" />
       <h4 class="teal-text">Torneos finalizados</h4>
        <div class="container">
        <table class="bordered" id="listaResultados" data-page-length='20'>
            <thead>
            <th>Nombre Torneo</th>
            <th>Club</th>
            <th>Fecha</th>
            </thead>
            <tbody>
                <%for(Torneo item : listaTorneos){%>
                    <tr>
                        <td><a href="resultados.jsp?idTorneo=<%=item.getIdTorneo()%>" ><%=item.getNombre() %></a></td>
                        <td><%=item.getClub()%></td>
                        <td><%=tc.fechaOrdenada(item.getFecha())%></td>
                    </tr>

               <% }%>


            </tbody>
        </table>

    
        </div>

      <jsp:include page="/footer.jsp" />
      <script type="text/javascript" charset="utf8" src="http://cdn.datatables.net/1.10.9/js/jquery.dataTables.js"></script>

  </body>
</html>
