<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Examen Unidad 3</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background: #f5f5f7; padding: 20px; }
        .panel { background: white; max-width: 760px; margin: auto; border-radius: 10px; box-shadow: 0 8px 25px rgba(0,0,0,.12); padding: 24px; }
        h1 { text-align: center; margin-bottom: 18px; color: #333; }
        .sub { text-align: center; color: #555; margin-bottom: 22px; }
        .grid2 { display: grid; grid-template-columns: 1fr 1fr; gap: 14px; }
        .group { margin-bottom: 16px; }
        label { display: block; margin-bottom: 4px; color: #333; font-weight: 600; }
        input[type="text"], input[type="number"] { width: 100%; padding: 10px 12px; border: 1px solid #bbb; border-radius: 6px; }
        input[type="number"] { -moz-appearance: textfield; }
        button { width: 100%; padding: 12px; border: none; border-radius: 7px; background: linear-gradient(135deg,#667eea,#764ba2); color: white; font-size: 16px; font-weight: 700; cursor: pointer; }
        .resultado { background: #f0f8ff; border-left: 4px solid #4a90e2; padding: 14px 16px; border-radius: 6px; margin-top: 16px; }
        .error { background: #fdd; border-left: 4px solid #e74c3c; padding: 14px 16px; border-radius: 6px; margin-top: 16px; }
        .item { margin: 8px 0; }
        .info { background: #e8f5e9; border-left: 4px solid #27ae60; padding: 12px 14px; border-radius: 6px; margin-top: 16px; }
    </style>
</head>
<body>
<div class="panel">
    <h1>Examen Unidad 3</h1>
    <p class="sub">Introduce tus apellidos y diez números del 1 al 100</p>

    <%
        String mensajeError = null;
        String mensajeResultado = null;
        String apellidoP = request.getParameter("apellidoP");
        String apellidoM = request.getParameter("apellidoM");
        boolean procesar = "POST".equalsIgnoreCase(request.getMethod());

        boolean apellidosIguales = false;
        int mayor = 0;
        int menor = 0;
        boolean tieneIguales = false;

        if (procesar) {
            if (apellidoP == null || apellidoP.trim().isEmpty() || apellidoM == null || apellidoM.trim().isEmpty()) {
                mensajeError = "Debes ingresar ambos apellidos (paterno y materno).";
            } else {
                apellidoP = apellidoP.trim();
                apellidoM = apellidoM.trim();
                apellidosIguales = apellidoP.equalsIgnoreCase(apellidoM);

                int[] numeros = new int[10];
                for (int i = 0; i < 10; i++) {
                    String valor = request.getParameter("num" + (i + 1));
                    if (valor == null || valor.trim().isEmpty()) {
                        mensajeError = "Debes ingresar los 10 números.";
                        break;
                    }
                    try {
                        int n = Integer.parseInt(valor.trim());
                        if (n < 1 || n > 100) {
                            mensajeError = "Número inválido en el campo " + (i + 1) + ". Debe ser entre 1 y 100.";
                            break;
                        }
                        numeros[i] = n;
                    } catch (NumberFormatException e) {
                        mensajeError = "El campo " + (i + 1) + " no es un número válido.";
                        break;
                    }
                }

                if (mensajeError == null) {
                    mayor = numeros[0];
                    menor = numeros[0];
                    for (int i = 1; i < numeros.length; i++) {
                        if (numeros[i] > mayor) mayor = numeros[i];
                        if (numeros[i] < menor) menor = numeros[i];
                    }

                    java.util.Map<Integer, Integer> conteo = new java.util.HashMap<>();
                    for (int n : numeros) {
                        conteo.put(n, conteo.getOrDefault(n, 0) + 1);
                    }

                    StringBuilder iguales = new StringBuilder();
                    for (java.util.Map.Entry<Integer, Integer> e : conteo.entrySet()) {
                        if (e.getValue() > 1) {
                            if (iguales.length() > 0) iguales.append(", ");
                            iguales.append(e.getKey()).append(" (" + e.getValue() + ")");
                        }
                    }

                    tieneIguales = iguales.length() > 0;

                    StringBuilder res = new StringBuilder();
                    res.append("Apellido paterno: <strong>").append(apellidoP).append("</strong><br>");
                    res.append("Apellido materno: <strong>").append(apellidoM).append("</strong><br>");
                    res.append("Apellidos iguales: <strong>").append(apellidosIguales ? "Sí" : "No").append("</strong><br>");
                    res.append("Número mayor: <strong>").append(mayor).append("</strong><br>");
                    res.append("Número menor: <strong>").append(menor).append("</strong><br>");
                    if (tieneIguales) {
                        res.append("Hay números repetidos: <strong>").append(iguales.toString()).append("</strong>.<br>");
                    } else {
                        res.append("No hay números repetidos.");
                    }

                    mensajeResultado = res.toString();
                }
            }
        }
    %>

    <form method="post" action="examen unidad 3.jsp">
        <div class="grid2">
            <div class="group">
                <label for="apellidoP">Apellido paterno</label>
                <input type="text" id="apellidoP" name="apellidoP" value="<%= (apellidoP != null) ? apellidoP : "" %>" required />
            </div>
            <div class="group">
                <label for="apellidoM">Apellido materno</label>
                <input type="text" id="apellidoM" name="apellidoM" value="<%= (apellidoM != null) ? apellidoM : "" %>" required />
            </div>
        </div>

        <div class="group">
            <p style="color:#555; margin-bottom: 8px; font-weight: 600;">Ingresa los 10 números (1-100):</p>
            <div class="grid2">
                <input type="number" name="num1" min="1" max="100" value="<%= request.getParameter("num1") != null ? request.getParameter("num1") : "" %>" required />
                <input type="number" name="num2" min="1" max="100" value="<%= request.getParameter("num2") != null ? request.getParameter("num2") : "" %>" required />
                <input type="number" name="num3" min="1" max="100" value="<%= request.getParameter("num3") != null ? request.getParameter("num3") : "" %>" required />
                <input type="number" name="num4" min="1" max="100" value="<%= request.getParameter("num4") != null ? request.getParameter("num4") : "" %>" required />
                <input type="number" name="num5" min="1" max="100" value="<%= request.getParameter("num5") != null ? request.getParameter("num5") : "" %>" required />
                <input type="number" name="num6" min="1" max="100" value="<%= request.getParameter("num6") != null ? request.getParameter("num6") : "" %>" required />
                <input type="number" name="num7" min="1" max="100" value="<%= request.getParameter("num7") != null ? request.getParameter("num7") : "" %>" required />
                <input type="number" name="num8" min="1" max="100" value="<%= request.getParameter("num8") != null ? request.getParameter("num8") : "" %>" required />
                <input type="number" name="num9" min="1" max="100" value="<%= request.getParameter("num9") != null ? request.getParameter("num9") : "" %>" required />
                <input type="number" name="num10" min="1" max="100" value="<%= request.getParameter("num10") != null ? request.getParameter("num10") : "" %>" required />
            </div>
        </div>

        <button type="submit">Enviar</button>
    </form>

    <%
        if (mensajeError != null) {
    %>
        <div class="error"><strong>Error:</strong> <%= mensajeError %></div>
    <%
        } else if (mensajeResultado != null) {
    %>
        <div class="resultado"><%= mensajeResultado %></div>
    <%
        }
    %>
    br<button class="btn" onclick="location.href='index.jsp'">← Volver al Menú</button>
</div>

</body>
</html>
