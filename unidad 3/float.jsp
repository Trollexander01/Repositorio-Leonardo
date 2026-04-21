<%@ page contentType="text/html; charset-utf=8" language="java" %>
<%!
    float euro;
    float libra;
    float dolar;
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Uso de float en JSP</title>
</head>
<body>
    <%
        euro = 20.40f;
        libra = 23.62f;
        dolar = 0.111;
    %>
    <center>
        <h2 style="color: red">Hoy martes 17 de marzo de 2026 el tipo de divisa
            está así: <br>
        </h2>
        <h4 style="color: purple">Euro: <%= euro %><br>Libra: <%= libra %><br>Dólar: <%= dolar %></h4>
        <a href="index.jsp">Volver</a>
    </center>
</body>
</html>