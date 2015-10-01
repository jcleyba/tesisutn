<%-- 
    Document   : nuevotorneo
    Created on : 03-sep-2015, 21:32:00
    Author     : juanleyba
--%>

<%@page import="Model.Torneo"%>
<%@page import="Model.Usuario"%>
<%@page import="Controller.UsuarioController"%>
<%@page import="Model.Administrador"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Controller.ResultadosController"%>
<%@page import="Model.Jugador"%>
<%@page import="Model.TipoTorneo"%>
<%@page import="Controller.TorneosController"%>
<%@page import="java.util.List"%>
<%@page import="Model.Intervalo"%>
<%@page import="Model.Club"%>
<%@page import="Controller.ClubesController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <%@include file="/html.jsp" %>
   <% 
   
    int idResultado = Integer.parseInt(request.getParameter("idResultado"));
    int idTorneo = Integer.parseInt(request.getParameter("idTorneo"));
    ResultadosController rc = new ResultadosController();
    ArrayList<Jugador> listaInscriptos = (ArrayList)rc.listaJugadoresInscriptosPorTorneo(idTorneo);
    
    Administrador user = (Administrador)session.getAttribute("usuario");
    UsuarioController uc = new UsuarioController();
    Usuario admin = uc.getAdmin(user.getIdAdministrador());
    TorneosController cc = new TorneosController();
    Torneo torneo = cc.getTorneoPorId(idTorneo);
    if(torneo.getIdClub() != admin.getIdClub())
    {
        response.sendRedirect("index.jsp");
    }
    %>
  <body>
      <jsp:include page="/header.jsp" />
      <h4 class="white-text">Agregar nueva tarjeta</h4>
      <div class="container">
     <form class="col s12" method="POST" action="updateResultado.jsp?idTorneo=<%=idTorneo%>&idResultado=<%=idResultado%>">
          <div class="row">
               <select name="comboInscriptos" class="input-field col s8" required>
                  <option value="" disabled selected>Jugador</option>
                  <% for(Jugador item:listaInscriptos) {%>
                  <option value="<%=item.getIdJugador()%>"><%=item.getNombre()%> <%=item.getApellido()%></option>
                  <%}%>                  
              </select>
            <div class="input-field col s4">
              <input id="first_name" type="number" max="36" class="validate" required name="handicapTxt">
              <label for="first_name">Handicap</label>
            </div>
          </div>
      <div class="row">
        <div class="input-field col s2">
          <input id="first_name" type="number" class="validate" required name="hoyo1">
          <label for="first_name">Hoyo 1</label>
        </div>
          <div class="input-field col s2">
          <input id="first_name" type="number" class="validate" required name="hoyo2">
          <label for="first_name">Hoyo 2</label>
        </div>
          <div class="input-field col s2">
          <input id="first_name" type="number" class="validate" required name="hoyo3">
          <label for="first_name">Hoyo 3</label>
        </div>
          <div class="input-field col s2">
          <input id="first_name" type="number" class="validate" required name="hoyo4">
          <label for="first_name">Hoyo 4</label>
        </div>
          <div class="input-field col s2">
          <input id="first_name" type="number" class="validate" required name="hoyo5">
          <label for="first_name">Hoyo 5</label>
        </div>
         
          <div class="input-field col s2">
          <input id="first_name" type="number" class="validate" required name="hoyo6">
          <label for="first_name">Hoyo 6</label>
        </div>
        
      </div>
     <div class="row">
        <div class="input-field col s2">
          <input id="first_name" type="number" class="validate" required name="hoyo7">
          <label for="first_name">Hoyo 7</label>
        </div>
          <div class="input-field col s2">
          <input id="first_name" type="number" class="validate" required name="hoyo8">
          <label for="first_name">Hoyo 8</label>
        </div>
          <div class="input-field col s2">
          <input id="first_name" type="number" class="validate" required name="hoyo9">
          <label for="first_name">Hoyo 9</label>
        </div>
          <div class="input-field col s2">
          <input id="first_name" type="number" class="validate" required name="hoyo10">
          <label for="first_name">Hoyo 10</label>
        </div>
          <div class="input-field col s2">
          <input id="first_name" type="number" class="validate" required name="hoyo11">
          <label for="first_name">Hoyo 11</label>
        </div>
         
          <div class="input-field col s2">
          <input id="first_name" type="number" class="validate" required name="hoyo12">
          <label for="first_name">Hoyo 12</label>
        </div>
        
      </div>
          <div class="row">
        <div class="input-field col s2">
          <input id="first_name" type="number" class="validate" required name="hoyo13">
          <label for="first_name">Hoyo 13</label>
        </div>
          <div class="input-field col s2">
          <input id="first_name" type="number" class="validate" required name="hoyo14">
          <label for="first_name">Hoyo 14</label>
        </div>
          <div class="input-field col s2">
          <input id="first_name" type="number" class="validate" required name="hoyo15">
          <label for="first_name">Hoyo 15</label>
        </div>
          <div class="input-field col s2">
          <input id="first_name" type="number" class="validate" required name="hoyo16">
          <label for="first_name">Hoyo 16</label>
        </div>
          <div class="input-field col s2">
          <input id="first_name" type="number" class="validate" required name="hoyo17">
          <label for="first_name">Hoyo 17</label>
        </div>
         
          <div class="input-field col s2">
          <input id="first_name" type="number" class="validate" required name="hoyo18">
          <label for="first_name">Hoyo 18</label>
        </div>
        
      </div>
           
              
              <br>
              
         
              <div class="row center-align">
                <div class="input-field col s12">
                    <input type="submit" value="Enviar" class="btn ">
                </div>
              </div>
     
    </form>
      </div>
              <footer class="page-footer blue-grey darken-4">
          <div class="container  blue-grey darken-4">
            <div class="row">
              <div class="col l6 s12">
                <h5 class="white-text">Gracias por visitar Golftime</h5>
                <p class="grey-text text-lighten-4">La primera aplicación web de inscripciones online.</p>
              </div>
              <div class="col l4 offset-l2 s12">
                <h5 class="white-text">Links</h5>
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
