/**
 * API Gemini - Google AI Connection
 * Desarrollador: Johan Alexander Rodríguez González
 */
document.getElementById('btnGemini').addEventListener('click', async () => {
    const prompt = document.getElementById('geminiInput').value;
    const output = document.getElementById('geminiRes');
    
    // Reemplaza con tu llave real
    const KEY = "xyz1234567890"; // Reemplaza con tu API Key real
    
    // CAMBIO IMPORTANTE: Usamos la versión 'v1' y el modelo 'gemini-1.5-flash'
    const URL = `https://generativelanguage.googleapis.com/v1/models/gemini-2.5-flash:generateContent?key=${KEY}`;

    if (!prompt) return alert("Escribe algo para Gemini");
    output.innerText = "Gemini está analizando tu petición...";

    try {
        const response = await fetch(URL, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({
                contents: [{
                    parts: [{ text: prompt }]
                }]
            })
        });

        const data = await response.json();

        if (data.candidates && data.candidates[0].content) {
            output.innerText = data.candidates[0].content.parts[0].text;
        } else {
            // Si hay error de seguridad o de la API, lo mostramos claro
            output.innerText = "Error: " + (data.error ? data.error.message : "No se pudo generar contenido. Revisa si tu API Key tiene restricciones de región.");
        }
    } catch (error) {
        output.innerText = "Error de red: Asegúrate de estar usando Live Server.";
    }
});