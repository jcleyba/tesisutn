<%-- 
    Document   : administrador
    Created on : 26-ago-2015, 13:28:21
    Author     : juanleyba
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="html.jsp" %>
  <body>
      <jsp:include page="header.jsp" />
      <h4 class="teal-text">Iniciar sesión administrador</h4>
      <div class="container">
          <form action="loginAdmin.jsp" method="POST">
              Usuario: <input type="text" name="usernameTxt" pattern="[^'\x22]+" required><br>
              Contraseña:  <input type="password" name="passwordTxt" required><br>
              <br>
              <input type="submit" value="Enviar" class="btn">
          </form>
      </div>
      <jsp:include page="/footer.jsp" />

  </body>
