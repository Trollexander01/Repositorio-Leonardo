<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%!
    String materia = "Aplicaciones web orientada a objetos";
    String profesor = "Dr. Leonardo Hernández Peña";
    int unidades = 3;
    double calificacion = 9.99;
    String direccion = "Direccion de Tecnologias de la informacion";
    float promedio = 10.0f;
    String universidad = "Universidad Tecnologica de la Costa";
    String carrera = "Desarrollo de Software Multiplataforma";
    String sunombre = "Johan Alexander Rodriguez Gonzalez";
%>
title>Datos de la materia</title>
center>
    <h1 style="text-align: center; color: red">Cuatrimestre Enero - Abril 2026</h1>
    <h2 style="text-align: center; color: blue"><%= universidad %></h2>
    <h2 style="text-align: center; color: green"><%= direccion %></h2>
    <h2 style="text-align: center; color: purple"><%= carrera %></h2>
    <h2 style="text-align: center; color: brown"><%= materia %></h2>
    <h2 style="text-align: center; color: cyan"><%= profesor %></h2>
    <h2 style="text-align: center; color: orange">Alumno: <%= sunombre %></h2>
    <h2 style="text-align: center; color: magenta">Unidades: <%= unidades %></h2>
    <h2 style="text-align: center; color: pink">Calificacion: <%= calificacion %></h2>
    <h2 style="text-align: center; color: gray">Promedio: <%= promedio %></h2>
    <a href="index.jsp">Volver al índice de la unidad 3</a><br><br>
</center>