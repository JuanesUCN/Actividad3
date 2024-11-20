<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Crear Cuento</title>
    <link rel="icon" href="../Imagenes/Logo.jpeg" type="image/x-icon">
    <link rel="stylesheet" href="../Styles/Cuento.css">
</head>
<body>
    <center>
        <h1>Creando un cuento</h1><br>
        <div class="container">
            <form id="cuentoForm" action="Cuento.jsp" method="get" onsubmit="return validarFormulario()">
                <button type="button" class="accordion">Persona # 1</button>
                <div class="panel">
                    <table>
                        <tr>
                            <td>Nombre Completo:</td>
                            <td><input type="text" id="txtNombre1"  name="txtNombre1" required></td>
                        </tr>
                        <tr>
                            <td>Género:</td>
                            <td>
                                <select id="SelectGenero1" name="SelectGenero1">
                                    <option value="Femenino">Femenino</option>
                                    <option value="Masculino">Masculino</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>Apodo:</td>
                            <td><input type="text" id="txtApodo1" name="txtApodo1" required></td>
                        </tr>
                        <tr>
                            <td>Color de Cabello:</td>
                            <td><input type="text" id="txtColorCabello1" name="txtColorCabello1" required></td>
                        </tr>
                        <tr>
                            <td>Color de Ojos:</td>
                            <td><input type="text" id="txtColorOjos1" name="txtColorOjos1" required></td>
                        </tr>
                        <tr>
                            <td>Edad:</td>
                            <td><input type="number" id="txtEdad1" name="txtEdad1" required></td>
                        </tr>
                        <tr>
                            <td>Hobbie:</td>
                            <td>
                                <select id="SelectHobbie1" name="SelectHobbie1">
                                    <option value="Fotografía de microorganismos">Fotografía de microorganismos</option>
                                    <option value="Coleccionar fragmentos de rocas espaciales">Coleccionar fragmentos de rocas espaciales</option>
                                    <option value="Recolección de Pruebas de vida">Recolección de Pruebas de vida</option>
                                </select>
                            </td>
                        </tr>
                    </table>
                </div>

                <button type="button" class="accordion">Persona # 2</button>
                <div class="panel">
                    <table>
                        <tr>
                            <td>Nombre Completo:</td>
                            <td><input type="text" id="txtNombre2" name="txtNombre2" required></td>
                        </tr>
                        <tr>
                            <td>Género:</td>
                            <td>
                                <select id="SelectGenero2" name="SelectGenero2">
                                    <option value="Femenino">Femenino</option>
                                    <option value="Masculino">Masculino</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>Apodo:</td>
                            <td><input type="text" id="txtApodo2" name="txtApodo2" required></td>
                        </tr>
                        <tr>
                            <td>Color de Cabello:</td>
                            <td><input type="text" id="txtColorCabello2"  name="txtColorCabello2" required></td>
                        </tr>
                        <tr>
                            <td>Color de Ojos:</td>
                            <td><input type="text" id="txtColorOjos2" name="txtColorOjos2" required></td>
                        </tr>
                        <tr>
                            <td>Edad:</td>
                            <td><input type="number" id="txtEdad2" name="txtEdad2" required></td>
                        </tr>
                        <tr>
                            <td>Hobbie:</td>
                            <td>
                                <select  id="SelectHobbie2" name="SelectHobbie2">
                                    <option value="Fotografía de microorganismos">Fotografía de microorganismos</option>
                                    <option value="Coleccionar fragmentos de rocas espaciales">Coleccionar fragmentos de rocas espaciales</option>
                                    <option value="Recolección de Pruebas de vida">Recolección de Pruebas de vida</option>
                                </select>
                            </td>
                        </tr>
                    </table>
                </div>
                <br>
                <input type="submit" value="Generar Cuento">
            </form>
        </div>

        <audio id="background-music" loop>
            <source src="../audio/espacio.mp3" type="audio/mpeg">
            Tu navegador no soporta el elemento de audio.
        </audio>
        <button id="Back-Button" onclick="history.back();">Atrás</button> 
        <button id="play-button" onclick="playMusic()">Reproducir Música</button>
        <button id="mute-button" onclick="toggleMute()">Mute</button>
    </center>

    <script>
        var acc = document.getElementsByClassName("accordion");
        for (let i = 0; i < acc.length; i++) {
            acc[i].addEventListener("click", function() {
                this.classList.toggle("active");
                var panel = this.nextElementSibling;
                if (panel.style.display === "block") {
                    panel.style.display = "none";
                } else {
                    panel.style.display = "block";
                }
            });
        }

        function validarFormulario() {
            // Obtén los valores de los campos
            var nombre1 = document.getElementById("txtNombre1").value;
            var Genero1 = document.getElementById("SelectGenero1").value;
            var Apodo1 = document.getElementById("txtApodo1").value;
            var ColoCabello1 = document.getElementById("txtColorCabello1").value;
            var ColorOjos1 = document.getElementById("txtColorOjos1").value;
            var Edad1 = document.getElementById("txtEdad1").value;
            var Hobbies1 = document.getElementById("SelectHobbie1").value;
            
            var nombre2 = document.getElementById("txtNombre2").value;
            var Genero2 = document.getElementById("SelectGenero2").value;
            var Apodo2 = document.getElementById("txtApodo2").value;
            var ColoCabello2 = document.getElementById("txtColorCabello2").value;
            var ColorOjos2 = document.getElementById("txtColorOjos2").value;
            var Edad2 = document.getElementById("txtEdad2").value;
            var Hobbies2 = document.getElementById("SelectHobbie2").value;

            // Verifica si los campos están vacíos
            if (nombre1 === "" || Genero1 === "" || Apodo1 === "" || ColoCabello1 === "" || ColorOjos1 === "" || Edad1 === "" || Hobbies1 === ""
                    || nombre2 === "" || Genero2 === "" || Apodo2 === "" || ColoCabello2 === "" || ColorOjos2 === "" || Edad2 === "" || Hobbies2 === "") {
                alert("Por favor, completa todos los campos del formulario.");
                return false; // Evita el envío del formulario
            }

            return true; // Permite el envío si los campos están completos
        }

        var music = document.getElementById("background-music");
        var isMuted = false;

        function playMusic() {
            music.play().catch(function(error) {
                console.log("Reproducción de música bloqueada por el navegador. Por favor, haz clic en el botón para activar.");
            });
        }

        function toggleMute() {
            if (isMuted) {
                music.muted = false;
                document.getElementById("mute-button").innerText = "Mute";
            } else {
                music.muted = true;
                document.getElementById("mute-button").innerText = "Unmute";
            }
            isMuted = !isMuted;
        }
    </script>
</body>
</html>
