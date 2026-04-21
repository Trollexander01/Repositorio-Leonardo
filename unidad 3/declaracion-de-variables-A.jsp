 <%@ page contentType="text/html; charset=utf-8" language="java" %>
 <%!
    // Declaración de variables
    String nombre = "Johan";
    int anio = 2026;
    float estatura = 1.73f;
    float peso = 70.5f;
 %>
 <!DOCTYPE html>
 <html lang="en">
 <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Declaracion de varisbles t</title>
 </head>
 <body>
    <center>
      
        <h1 style="color: navy">Declaracion de Variables A)</h1>
        <h2 style="color: blue">Buen día, mi nombre es: <%= nombre %></h2>
        <h2 style="color: green">Mi estatura es: <%= estatura %></h2>
        <h2 style="color: red">Mi peso es: <%=peso%></h2>
        <h2 style="color: purple">Estamos en el anio: <%=anio%></h2>

        <button><a href="index.jsp">Regresar</a></button>
    </center>
 </body>
 </html>