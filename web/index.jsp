<%-- 
    Document   : index
    Created on : 13-ago-2015, 22:33:09
    Author     : juanleyba
--%>

<%@page import="Model.Torneo"%>
<%@page import="java.util.List"%>
<%@page import="Model.Club"%>
<%@page import="Controller.TorneosController"%>
<%@page import="Controller.ClubesController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.Usuario"%>
<%           
    Usuario user = (Usuario)session.getAttribute("usuario");

    ClubesController cc = new ClubesController();
    TorneosController tc = new TorneosController();
    List<Club> listaClubes = cc.listarClubesActivos();
    List<Torneo> listaTorneos = tc.listarProximosTorneos().subList(0,6);
%>
<!DOCTYPE html>
<html>
    <%@include file="html.jsp" %>
  <body>
      <jsp:include page="header.jsp" />
      <div class="main-container">
      <div id="main-title">
          <h1 class="teal-text light">Bienvenido a Golftime</h1>
      </div>
      <div id="subtitle">
          <h5 class="text-darken-1 blue-grey-text">En Golftime podrás consultar los horarios disponibles en cada torneo de tu club, inscribirte de manera online y seguir tus propios resultados y estadísticas de juego.</h5>
      </div>
      <div id="comenzar">

          <a href="#loginForm" class="modal-trigger btn-large white teal-text"><i class="material-icons left teal-text">thumb_up</i>Comenzar</a>

      </div>
      <div class="row white center promo-wrapper">
          <h3 class="teal-text light">La herramienta online para jugadores y clubes de golf</h3>
          <div class="wrapper-col">
              <div class="col s12 m4">
                  <div class="center promo">
                      <i class="large material-icons teal-text">done_all</i>
                      <h5 class="promo-caption">Inscripciones Online</h5>
                      <p class="light center">Inscribite al torneo que quieras y recibí la confirmación de tu inscripción. Podés anotarte y darte de baja sin moverte de tu casa o levantar el teléfono</p>
                  </div>
              </div>
              <div class="col s12 m4">
                  <div class="center promo">
                      <i class="large material-icons teal-text">reorder</i>
                      <h5 class="promo-caption">Resultados</h5>
                      <p class="light center">
                          Revisá tus score y el de tus amigos en los distintos torneos que te inscribiste con nuestra herramienta de resultados online.
                      </p>
                  </div>
              </div>
              <div class="col s12 m4">
                  <div class="center promo">
                      <i class="large material-icons teal-text">equalizer</i>
                      <h5 class="promo-caption">Estadísticas</h5>
                      <p class="light center">
                          Analizá la evolución de tus resultados, tu handicap y los torneos que disputaste a través de las estadísticas personales que brinda Golftime.
                      </p>
                  </div>
              </div>
          </div>
      </div>


          <div class="row">
              <div class="wrapper-col">
              <h3 class="center light grey-text text-darken-3">Próximos torneos</h3>
              <% for(Torneo item:listaTorneos){%>
              <div class="col m6">
                  <div class="card">

                      <div class="card-content">
                          <span class="card-title"> <a href="torneo.jsp?idTorneo=<%=item.getIdTorneo()%>"><%=item.getNombre()%> - (<%=item.getTipoDescripcion()%>)</a></span>
                          <p id="fecha">
                              <%= tc.fechaOrdenada(item.getFecha())%>
                          </p>
                          <p class="teal-text">
                              <%=item.getClub()%>
                          </p>
                      </div>
                      <div class="card-action">
                          <a href="torneo.jsp?idTorneo=<%=item.getIdTorneo()%>">Ver Horarios</a>
                          <a href="resultados.jsp?idTorneo=<%=item.getIdTorneo()%>">Ver resultados</a>

                      </div>
                  </div>
              </div>
              <%}%>
                  </div>
          </div>
            <div class="row center blue darken-2">
                <div class="wrapper-col">
                <h4 class="white-text light">
                    Si tu club no utiliza Golftime, solicitá que nos contacten y disfrutá de nuestro sistema desde tu computadora.
                </h4>
                    </div>
            </div>

          <div class="row">
              <div class="wrapper-col">
              <h3 class="center light grey-text text-darken-3">Consultá torneos y resultados</h3>
              <% for(Club item:listaClubes){%>
              <div class="col s4 m4">
                  <div class="card">
                      <img class="circle responsive-img" src="/images/<%=item.getLogo() %>" alt="<%=item.getNombre()%>" title="<%=item.getNombre()%>"/>

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
      </div>
            <jsp:include page="/footer.jsp" />

  </body>
</html>
