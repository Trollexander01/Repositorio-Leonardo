<%@ page contentType="text/html; charset-utf=8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Declaracion de variables en JSP B)</title>
</head>
<%
String carrera = "Desarrollo de Software Multiplataforma";
int grupo = 51;
float calificacion = 9.5f;
double beca = 1000.59;
%>

<body>
    <center>
        <h1 style="color: navy">Declaracion de Variables B)</h1>
        <h2 style="color: blue">Mi carrera es: <%= carrera %></h2>
        <h2 style="color: green">Estoy en el grupo: <%= grupo %></h2>
        <h2 style="color: red">Mi calificacion es: <%= calificacion %></h2>
        <h2 style="color: purple">Mi beca es: <%= beca %></h2>
    </center>c
</body>
</html>