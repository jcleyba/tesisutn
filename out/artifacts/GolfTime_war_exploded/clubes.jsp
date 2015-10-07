<%-- 
    Document   : clubes
    Created on : 28-ago-2015, 19:18:24
    Author     : juanleyba
--%>

<%@page import="Model.Club"%>
<%@page import="java.util.List"%>
<%@page import="Controller.ClubesController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
      ClubesController cc = new ClubesController();
    List<Club> lista = cc.listarClubesActivos();
%>
    <%@include file="html.jsp" %>
  <body>
      <jsp:include page="header.jsp" />
      <h4 class="teal-text">Estos son los clubes que utilizan Golf Time</h4>
      <div class="container">
       
        <div class="row">
        <% for(Club item:lista){%>
        <div class="col s4 m4">
          <div class="card">
            <div class="card-image">
               <img src="/images/<%=item.getLogo() %>" alt="<%=item.getNombre()%>" title="<%=item.getNombre()%>"/>
            </div>
            <div class="card-content">
                           <span class="card-title"> <a href="club.jsp?id=<%=item.getIdClub()%>"><%=item.getNombre()%></a></span>
            </div>
            <div class="card-action">
               <a href="club.jsp?id=<%=item.getIdClub()%>">Ver torneos</a>
            </div>
          </div>
        </div>
         <%}%>
      </div>
      </div>
            <jsp:include page="/footer.jsp" />
      <script type="text/javascript" src="js/jquery.js"></script>
      <script type="text/javascript" src="js/materialize.min.js"></script>
      <script type="text/javascript" src="js/scripts.js"></script>
    </body>
    </html>