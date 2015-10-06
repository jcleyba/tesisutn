<%-- 
    Document   : error
    Created on : 19-ago-2015, 22:27:15
    Author     : juanleyba
--%>

<%@page import="Model.Club"%>
<%@page import="Controller.ClubesController"%>
<%@page import="Model.Administrador"%>
<%@page import="Controller.UsuarioController"%>
<%@page import="Model.Usuario"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Model.Torneo"%>
<%@page import="Model.TipoTorneo"%>
<%@page import="Model.Intervalo"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="Controller.TorneosController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

   <% 
    ClubesController cc = new ClubesController();
    int idClub = Integer.parseInt(request.getParameter("id"));
    Club club = cc.clubPorId(idClub);
    
    %>
<!DOCTYPE html>
<html>
    <%@include file="/html.jsp" %>
  <body>
      <jsp:include page="/header.jsp" />
      <h4 class="teal-text">Editar Torneo</h4>
      
      <div class="container">
         
    <form class="col s12" method="POST" action="updateClub.jsp?id=<%=idClub%>" enctype="multipart/form-data">
      <div class="row">
        <div class="input-field col s4">
          <input id="first_name" type="text" class="validate" value="<%=club.getNombre()%>" required name="nombreTxt">
        </div>
        

      <div class="row">
        <div class="input-field col s12">
                      <input id="matricula" type="text" class="validate" value="<%=club.getDireccion()%>" required name="txtDireccion">
                      <label for="matricula">Dirección</label>
                    </div>
                <div class="input-field col s12">
                      <input id="matricula" type="text" class="validate" value="<%=club.getTelefono()%>"  required name="txtTelefono">
                      <label for="matricula">Teléfono</label>
                    </div>
                <div class="input-field col s12">
                      <input id="matricula" type="email" class="validate" value="<%=club.getEmail()%>" required name="txtEmail">
                      <label for="matricula">Email</label>
                    </div>
            </div>
             <div class="row">
               <div class=" input-field col s12">
                     
                   
                   <div>Subir Logo</div>
                <input type="file" name="logoClub" />
     
                </div>
             </div>
       
          </div> 
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