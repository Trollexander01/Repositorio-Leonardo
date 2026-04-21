<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<%
String carrera = "Desarrollo de Software Multiplataforma";
int grupo = 51;
float calificacion = 9.99f;
double beca = 1000.59;
%>
<body>
    <center>
        <h1 style="color: brown;">Declaración de Variables B)</h1>
        <h2>Estoy cursando la carrera de <%=carrera%></h2>
        <h2 style="color: green;">Grupo: <%=grupo%></h2>
        <h2 style="color: blue;">Calificación: <%=calificacion%></h2>
        <h2 style="color: purple;">Beca: <%=beca%></h2>
    </center>
</body>
</html>