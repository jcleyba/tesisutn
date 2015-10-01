<%-- 
    Document   : administrador
    Created on : 26-ago-2015, 13:28:21
    Author     : juanleyba
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="html.jsp" %>
  <body>
      <jsp:include page="header.jsp" />
      <h4 class="white-text">Iniciar sesión administrador</h4>
      <div class="container">
          <form action="loginAdmin.jsp" method="POST">
              Usuario: <input type="text" name="usernameTxt" required><br>
              Contraseña:  <input type="password" name="passwordTxt" required><br>
              <br>
              <input type="submit" value="Enviar" class="btn">
          </form>
      </div>
    </body>
