/**
 * API TikTok - Video Publicado
 * Desarrollador: Johan Alexander Rodríguez González
 * Archivo: tiktok.js
 */
document.getElementById('btnTikTok').addEventListener('click', () => {
    const container = document.getElementById('videoContainer');
    
    // 1. Limpiamos el contenedor por completo
    container.innerHTML = '';

    // 2. Creamos el elemento blockquote desde cero mediante código
    const blockquote = document.createElement('blockquote');
    blockquote.className = 'tiktok-embed';
    blockquote.cite = 'https://www.tiktok.com/@trollexander_01/video/7543532517199056136';
    blockquote.setAttribute('data-video-id', '7543532517199056136');
    blockquote.style.maxWidth = '605px';
    blockquote.style.minWidth = '325px';

    const section = document.createElement('section');
    section.innerHTML = `
        <a target="_blank" href="https://www.tiktok.com/@trollexander_01">@trollexander_01</a> 
        <p>Brillan, brillan tan bonitos... #ojitosmentirosos</p>
    `;

    blockquote.appendChild(section);
    container.appendChild(blockquote);

    // 3. Forzamos la recarga del SDK de TikTok
    // Borramos cualquier rastro previo del script para evitar que se bloquee
    const oldScript = document.querySelector('script[src*="tiktok.com/embed.js"]');
    if (oldScript) {
        oldScript.remove();
    }

    // Volvemos a inyectar el script oficial
    const script = document.createElement('script');
    script.src = "https://www.tiktok.com/embed.js";
    script.async = true;
    document.body.appendChild(script);
});