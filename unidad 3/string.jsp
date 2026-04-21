<%@  page contentType="text/html, charset-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Uso de String</title>
</head>
<body>
    <%
        String dia = "viernes 13";
        String semana = "trece";
        String siglo = "XXI";
        mes = "marzo";
        anio = "2026"
    %>
    <center>
        <h2 style="color: blue;">Hoy es <%= dia %> de <%= mes %> del <%= anio %> y <%= siglo %></h2>
        <p><%= semana %></p>
        <p><%= siglo %></p>
        <p><%= mes %></p>
        <p><%= anio %></p>
        <p></p>
    </center>
</body>
</html>