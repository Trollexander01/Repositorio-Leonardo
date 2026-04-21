<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Resultado Validación - Universidad</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }
        
        .container {
            background: white;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
            width: 100%;
            max-width: 500px;
        }
        
        .resultado {
            text-align: center;
            margin-bottom: 30px;
        }
        
        .icon {
            font-size: 60px;
            margin-bottom: 15px;
        }
        
        h1 {
            margin-bottom: 10px;
            font-size: 28px;
        }
        
        .aprobado h1 {
            color: #27ae60;
        }
        
        .rechazado h1 {
            color: #e74c3c;
        }
        
        .mensaje {
            color: #666;
            font-size: 16px;
            line-height: 1.6;
            margin-bottom: 20px;
        }
        
        .datos-resumen {
            background: #f8f9fa;
            padding: 20px;
            border-radius: 5px;
            margin: 20px 0;
            border-left: 4px solid;
        }
        
        .aprobado .datos-resumen {
            border-left-color: #27ae60;
        }
        
        .rechazado .datos-resumen {
            border-left-color: #e74c3c;
        }
        
        .dato-item {
            display: flex;
            justify-content: space-between;
            padding: 10px 0;
            border-bottom: 1px solid #ddd;
        }
        
        .dato-item:last-child {
            border-bottom: none;
        }
        
        .dato-label {
            font-weight: 600;
            color: #333;
        }
        
        .dato-valor {
            color: #666;
        }
        
        .detalles-validacion {
            background: #fff3cd;
            border-left: 4px solid #ffc107;
            padding: 15px;
            border-radius: 3px;
            margin: 20px 0;
            font-size: 14px;
        }
        
        .detalles-validacion strong {
            color: #856404;
        }
        
        .botones {
            display: flex;
            gap: 10px;
            margin-top: 30px;
        }
        
        .btn {
            flex: 1;
            padding: 12px;
            border: none;
            border-radius: 5px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            transition: transform 0.2s, box-shadow 0.2s;
        }
        
        .btn-primario {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
        }
        
        .btn-secundario {
            background: #e0e0e0;
            color: #333;
        }
        
        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }
        
        .error-mensaje {
            background: #f8d7da;
            color: #721c24;
            padding: 15px;
            border-left: 4px solid #f5c6cb;
            border-radius: 3px;
            margin: 20px 0;
        }
    </style>
</head>
<body>
    <%
        // Obtener parámetros del formulario
        String nombre = request.getParameter("nombre");
        String edadStr = request.getParameter("edad");
        
        // Variables de validación
        boolean esValido = true;
        String mensajeError = "";
        int edad = 0;
        
        // Validación de datos vacíos
        if (nombre == null || nombre.trim().isEmpty()) {
            esValido = false;
            mensajeError = "El nombre no puede estar vacío.";
        }
        
        if (edadStr == null || edadStr.trim().isEmpty()) {
            esValido = false;
            mensajeError = "La edad no puede estar vacía.";
        } else {
            try {
                edad = Integer.parseInt(edadStr);
                
                // Validación de rango de edad
                if (edad < 17 || edad > 69) {
                    esValido = false;
                    mensajeError = "La edad debe estar entre 17 y 69 años para poder registrarse.";
                }
            } catch (NumberFormatException e) {
                esValido = false;
                mensajeError = "La edad ingresada no es un número válido.";
            }
        }
        
        // Validación adicional: edad razonable
        if (esValido && edad <= 0) {
            esValido = false;
            mensajeError = "Por favor, ingresa una edad válida.";
        }
        
        // Limpiar nombre para evitar caracteres especiales
        if (nombre != null) {
            nombre = nombre.trim();
        }
    %>
    
    <div class="container">
        <% if (esValido) { %>
            <!-- Formulario Aprobado -->
            <div class="resultado aprobado">
                <div class="icon">✓</div>
                <h1>¡Registro Aprobado!</h1>
                <p class="mensaje">Felicitaciones, cumples con los requisitos para registrarte en la universidad.</p>
            </div>
            
            <div class="datos-resumen aprobado">
                <div class="dato-item">
                    <span class="dato-label">Nombre:</span>
                    <span class="dato-valor"><strong><%= nombre %></strong></span>
                </div>
                <div class="dato-item">
                    <span class="dato-label">Edad:</span>
                    <span class="dato-valor"><strong><%= edad %> años</strong></span>
                </div>
                <div class="dato-item">
                    <span class="dato-label">Estado:</span>
                    <span class="dato-valor" style="color: #27ae60;"><strong>Apto para registrarse</strong></span>
                </div>
            </div>
            
            <div class="detalles-validacion">
                <strong>✓ Validación completada exitosamente:</strong><br>
                • Nombre válido y completo<br>
                • Edad dentro del rango permitido (17 - 69 años)<br>
                • Todos los requisitos cumplidos
            </div>
            
        <% } else { %>
            <!-- Formulario Rechazado -->
            <div class="resultado rechazado">
                <div class="icon">✗</div>
                <h1>Registro No Aprobado</h1>
                <p class="mensaje">Lo sentimos, no cumples con los requisitos para registrarte.</p>
            </div>
            
            <div class="error-mensaje">
                <strong>Error de validación:</strong><br>
                <%= mensajeError %>
            </div>
            
            <div class="datos-resumen rechazado">
                <div class="dato-item">
                    <span class="dato-label">Nombre:</span>
                    <span class="dato-valor"><%= (nombre != null && !nombre.isEmpty()) ? nombre : "No proporcionado" %></span>
                </div>
                <div class="dato-item">
                    <span class="dato-label">Edad:</span>
                    <span class="dato-valor"><%= (edadStr != null && !edadStr.isEmpty()) ? edadStr + " años" : "No proporcionada" %></span>
                </div>
                <div class="dato-item">
                    <span class="dato-label">Estado:</span>
                    <span class="dato-valor" style="color: #e74c3c;"><strong>No apto</strong></span>
                </div>
            </div>
            
            <div class="detalles-validacion">
                <strong>Requisitos para registrarse:</strong><br>
                • Tener una edad mínima de 17 años<br>
                • Tener una edad máxima de 69 años<br>
                • Proporcionar un nombre válido
            </div>
            
        <% } %>
        
        <div class="botones">
            <button class="btn btn-secundario" onclick="history.back()">← Volver Atrás</button>
            <button class="btn btn-primario" onclick="location.href='registro-universidad.jsp'">Intentar de Nuevo</button>
            <button class="btn btn-secundario" onclick="location.href='index.jsp'">Volver al Índice</button>
        </div>
    </div>
</body>
</html>
