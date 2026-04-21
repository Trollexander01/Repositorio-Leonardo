// chatgpt.js
document.getElementById('btnGPT').addEventListener('click', async () => {
    const prompt = document.getElementById('gptInput').value;
    const output = document.getElementById('gptRes');
    
    // ASEGÚRATE DE QUE LA KEY ESTÉ ENTRE COMILLAS
    const API_KEY = "XYZ1234567890"; // Reemplaza con tu API Key real

    if (!prompt) return;
    output.innerText = "Escribiendo...";

    try {
        const response = await fetch('https://api.openai.com/v1/chat/completions', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'Authorization': `Bearer ${API_KEY}`
            },
            body: JSON.stringify({
                model: "gpt-3.5-turbo", // Usa este modelo, es el que menos errores da
                messages: [{ role: "user", content: prompt }]
            })
        });

        const data = await response.json();
        
        if (data.error) {
            // Esto te dirá exactamente qué pasa (ej. "insufficient_quota")
            output.innerText = "Error de OpenAI: " + data.error.message;
        } else {
            output.innerText = data.choices[0].message.content;
        }
    } catch (error) {
        output.innerText = "Error de conexión. Intenta con Live Server.";
    }
});