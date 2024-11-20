<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cuento Generado</title>
    <link rel="icon" href="../Imagenes/Logo.jpeg" type="image/x-icon">
    <link rel="stylesheet" href="../Styles/Cuento.css">
</head>
<body>
    <center>
        <h1 class="title">Cuento Generado</h1>
        <div id="cuento-container" class="cuento-container">
            <%
                // Captura de parámetros de la primera persona
                String nombre1 = request.getParameter("txtNombre1");
                String genero1 = request.getParameter("SelectGenero1");
                String apodo1 = request.getParameter("txtApodo1");
                String colorCabello1 = request.getParameter("txtColorCabello1");
                String colorOjos1 = request.getParameter("txtColorOjos1");
                String edad1 = request.getParameter("txtEdad1");
                String hobbie1 = request.getParameter("SelectHobbie1");

                // Captura de parámetros de la segunda persona
                String nombre2 = request.getParameter("txtNombre2");
                String genero2 = request.getParameter("SelectGenero2");
                String apodo2 = request.getParameter("txtApodo2");
                String colorCabello2 = request.getParameter("txtColorCabello2");
                String colorOjos2 = request.getParameter("txtColorOjos2");
                String edad2 = request.getParameter("txtEdad2");
                String hobbie2 = request.getParameter("SelectHobbie2");

                // Generación del cuento línea por línea en JavaScript
                String cuento = 
                    "Había una vez, en una ciudad de nombre perdido en el tiempo, un ser llamado " + nombre1 + ". " +
                    "Este " + genero1.toLowerCase() + " era conocido por su espíritu aventurero y su curiosidad sin límites. " + 
                    nombre1 + ", a quien todos llamaban '" + apodo1 + "', tenía una apariencia inconfundible. Con sus ojos " +
                    colorOjos1.toLowerCase() + " y su cabello de color " + colorCabello1.toLowerCase() + 
                    ", cada paso suyo parecía contar una historia propia. Aunque joven, con apenas " + edad1 + " años, su amor por " +
                    hobbie1.toLowerCase() + " le había llevado a explorar lugares y descubrir secretos que muchos solo imaginaban en sueños.\n" +
                    "Un día, mientras se dedicaba a " + hobbie1.toLowerCase() + ", " + nombre1 + " sintió una presencia a su lado. " +
                    "Era " + nombre2 + ", un " + genero2.toLowerCase() + " de espíritu igualmente indomable. A pesar de que apenas se conocían, " +
                    "parecía que el destino los había unido. " + nombre2 + ", con su melena " + colorCabello2.toLowerCase() + 
                    " y sus ojos " + colorOjos2.toLowerCase() + ", irradiaba una energía especial. Conocido como '" + apodo2 + "', su entusiasmo por " +
                    hobbie2.toLowerCase() + " le había convertido en un enigma para quienes le rodeaban. Así, de repente, los caminos de " +
                    nombre1 + " y " + nombre2 + " se entrelazaron, y juntos decidieron embarcarse en una serie de aventuras.\n" +
                    "El primer reto que enfrentaron fue una antigua leyenda local sobre un bosque encantado. Se decía que quien entraba en el bosque bajo la luz de la luna llena descubriría secretos de su propia alma. Intrigados, " + nombre1 + " y " + nombre2 + " decidieron adentrarse en el bosque una noche, llevando solo lo esencial. A medida que avanzaban entre los árboles, sus sombras se mezclaban con la penumbra, y el susurro de las hojas parecía contarles historias de tiempos olvidados.\n" +
                    "Mientras caminaban, " + nombre1 + " comenzó a hablar de sus sueños, de cómo siempre había sentido una conexión especial con el mundo natural. 'Hay algo en la naturaleza que me hace sentir vivo, que me recuerda que soy parte de algo mucho más grande', confesó " + nombre1 + ", sus ojos " + colorOjos1.toLowerCase() + " brillando a la luz de la luna. " + nombre2 + " asintió, compartiendo su propio deseo de descubrir lo desconocido y su pasión por " + hobbie2.toLowerCase() + ". Ambos sabían que en esa búsqueda por respuestas, habían encontrado a alguien que realmente les comprendía.\n" +
                    "De repente, escucharon un ruido extraño. Se detuvieron, tratando de discernir de dónde venía. Era un canto melódico, como si una voz etérea estuviera llamándolos desde las profundidades del bosque. Decidieron seguir el sonido, guiados únicamente por la curiosidad. Pronto llegaron a un claro donde encontraron un lago de aguas cristalinas que reflejaba la luz de la luna. Al acercarse a la orilla, ambos sintieron una calma profunda y se dieron cuenta de que el lago parecía contener visiones de sus propios recuerdos y sueños.\n" +
                    "Sentados junto al lago, comenzaron a compartir sus historias más personales. " + nombre2 + " habló de su infancia, de los desafíos que había enfrentado y de cómo " + hobbie2.toLowerCase() + " le había ayudado a entender el mundo. " + nombre1 + " escuchaba atentamente, admirando la fuerza y determinación de " + nombre2 + ". A su vez, compartió sus propias experiencias, revelando su amor por " + hobbie1.toLowerCase() + " y su anhelo de dejar una marca en el mundo. Aquella noche, se dieron cuenta de que no solo eran compañeros de aventura, sino almas afines en busca de su propio propósito.\n" +
                    "Esa fue solo la primera de muchas noches bajo las estrellas, y el bosque se convirtió en su refugio. Pasaron semanas explorando, descubriendo nuevos lugares y enfrentando desafíos juntos. Cada aventura era un paso más en su conexión. Su amistad se transformaba lentamente en algo más profundo, una unión de respeto y comprensión que ambos valoraban profundamente.\n" +
                    "Con el paso del tiempo, su presencia en la región comenzó a ser notoria. Las personas hablaban de ellos como una pareja inseparable, como los aventureros que exploraban lo desconocido y llevaban historias de esperanza y valentía a aquellos que los escuchaban. Inspiraban a otros a perseguir sus sueños, a no temer lo desconocido, y a encontrar consuelo en la compañía de alguien que entendiera su pasión.\n" +
                    "Así continuaron sus días, viviendo cada momento al máximo y enfrentando cada obstáculo con valor. Y aunque las estaciones cambiaban, " + nombre1 + " y " + nombre2 + " sabían que, pase lo que pase, sus almas estaban unidas por el amor al misterio y al aprendizaje continuo. Así fue como, de ser simples exploradores, se convirtieron en leyendas que inspiraban a generaciones futuras.\n" +
                    "..."; // Fin del cuento
            %>
        </div>
        <button id="IniciarCuento" onclick="iniciarCuento()" class="button start-button">Iniciar Cuento</button>
        <a href="FormularioCuento.jsp" class="button back-button">Volver al formulario</a>
    </center>

    <script>
        const cuento = `<%= cuento %>`.split('\n'); // Divide el cuento en líneas
        const cuentoContainer = document.getElementById('cuento-container');

        // Función para leer en voz alta cada línea
        function leerTexto(texto) {
            const utterance = new SpeechSynthesisUtterance(texto);
            utterance.lang = 'es-ES'; // Configura el idioma a español
            speechSynthesis.speak(utterance);
            return new Promise(resolve => {
                utterance.onend = resolve; // Espera hasta que termine de leer
            });
        }

        // Función para mostrar línea por línea con efecto de aparición
        async function iniciarCuento() {
            var btnIniciar = document.getElementById('IniciarCuento');
            btnIniciar.disabled = true;
            for (const linea of cuento) {
                const parrafo = document.createElement('p');
                parrafo.textContent = linea;
                parrafo.style.opacity = 0;
                cuentoContainer.appendChild(parrafo);
                
                await mostrarLinea(parrafo); // Muestra la línea con animación
                await leerTexto(linea); // Lee la línea en voz alta
            }
            btnIniciar.disabled = true;
        }

        // Efecto de aparición gradual para cada línea
        function mostrarLinea(parrafo) {
            return new Promise(resolve => {
                let opacity = 0;
                parrafo.style.display = "block";
                
                const fadeIn = setInterval(() => {
                    opacity += 0.05;
                    parrafo.style.opacity = opacity;
                    if (opacity >= 1) {
                        clearInterval(fadeIn);
                        resolve();
                    }
                }, 50);
            });
        }
    </script>
</body>
</html>
