<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%! 
     String pais;s
     int moneda;
     float paridad;
     double total;
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <%
         pais = "Mexico";
         moneda = 10;
         paridad = 17.8f;
         total = 178.00;
    %>
        <h1>Declaración de Variables C)</h1>
        <h2>En pais <%=pais%> el dolar tiene un precio de <%=paridad%> y yo tengo <%=moneda%> dolares.
             Entonces mi total es <%=total%> pesos.</h2>
</body>
</html>