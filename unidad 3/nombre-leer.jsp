<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%!
    String nombre;
%>
<%
    nombre = request.getParameter("nombre");
%>
<center>
    <h2 style="color: blue;">Tu nombre es: <%= nombre %></h2>
    <a href="pedir-nombre.jsp">Volver a pedir el nombre</a><br><br>
</center>