<%-- 
    Document   : logout.jsp
    Created on : 20-ago-2015, 22:57:57
    Author     : juanleyba
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% session.invalidate();
   request.setAttribute("usuario", null);
   response.sendRedirect("/");
%>
