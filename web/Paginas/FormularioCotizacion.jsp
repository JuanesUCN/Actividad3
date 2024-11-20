<%-- 
    Document   : FormularioCotizacion
    Created on : 16 nov 2024, 1:35:58 a.m.
    Author     : usuario
--%>
<%@page import="java.text.DecimalFormat"%>
<%@ page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>ColSports - Cotización</title>
    <link rel="icon" href="../Imagenes/Logo.jpeg" type="image/x-icon">
    <link rel="stylesheet" href="../Styles/style_IndexPage.css" />
  </head>
  <body>
    <header>
        <div class="banner">
            <img class="banner-img" src="../Imagenes/Logo.jpeg" alt="Logo Tienda" id="logo"/>
            <h1>Cotización - ColSports</h1>

            <nav class="menu">
            <div class="menu-item">
                <a href="../index.html">Inicio</a>
            </div>
            <div class="menu-item">
                <a href="FormularioCuento.jsp">Generar Cuento</a>
            </div>
            <div class="menu-item">
                <a href="#">Productos</a>
                    <div class="dropdown">
                        <a href="Productos/futbol.html">Futbol</a>
                        <a href="Productos/baloncesto.html">Baloncesto</a>
                        <a href="Productos/voleibol.html">Voleibol</a>
                    </div>
            </div>
            <div class="menu-item">
                <a href="Contactenos.html">Contactenos</a>
            </div>
            <div class="menu-item">
                <a href="FormularioCotizacion.jsp">Solicitud de Cotización</a>
            </div>
            </nav>
        </div>
    </header>
    <br>

    <div class="div-principal-ctz">
        
        <section id="cotizacion">
            <h1>Solicitud de cotización</h1>
            
            <form id="Cotizacion" action="Cotizacion.jsp" method="post">
                
                <input type="text" id="nombrecompleto" name="nombre" placeholder="Nombre y Apellido" required><br><br>
                
                <select name="Ciudad" id="Ciudad">
                    
                    <option value="-1">Seleccione una ciudad:</option>
                <%
                    // Variables de conexión
                    String url = "jdbc:mysql://localhost:3306/colsports"; // URL de la base de datos
                    String usuario = "root"; // Usuario de la base de datos
                    String password = ""; // Contraseña de la base de datos

                    Connection conexion = null;
                    Statement statement = null;
                    ResultSet resultSet = null;

                    try {
                        // Cargar el driver de MySQL
                        Class.forName("com.mysql.cj.jdbc.Driver");

                        // Establecer la conexión
                        conexion = DriverManager.getConnection(url, usuario, password);
                        //out.println("<h3>Conexión exitosa a la base de datos</h3>");

                        // Crear una consulta SQL
                        statement = conexion.createStatement();
                        resultSet = statement.executeQuery("SELECT * FROM Tbl_Ciudades");
                        
                        while (resultSet.next()) {
                            String nombre = resultSet.getString("Ciudad");
                            
                %>
                            <option value="<%= nombre %>"><%= nombre %></option>
                <%
                        }
                    } catch (Exception e) {
                        out.println("<h3>Error al conectar con la base de datos: " + e.getMessage() + " </h3>");
                        e.printStackTrace();
                    } finally {
                        // Cerrar recursos
                        if (resultSet != null) resultSet.close();
                        if (statement != null) statement.close();
                        if (conexion != null) conexion.close();
                    }
                
                %>
                </select>
                

                <input type="text" id="Direccion" name="Direccion" placeholder="Direccion" required><br><br>
                
                <input type="number" id="celular" name="celular" placeholder="Celular" required><br><br>                

            <center>
            <table class="TablaProductos" border="1">
                
                <tr><th>Seleccionar</th><th>Nombre</th><th>Nombre Categoria</th><th>Precio</th><th>Unidades</th></tr>
                
            <%    
                int rowCount = 0;
                try {
                
                        conexion = null;
                        statement = null;
                        resultSet = null;
                        
                        // Establecer la conexión
                        conexion = DriverManager.getConnection(url, usuario, password);
                
                        statement = conexion.createStatement();
                
                        // Cargar el driver de MySQL
                        Class.forName("com.mysql.cj.jdbc.Driver");

                        // Establecer la conexión
                        conexion = DriverManager.getConnection(url, usuario, password);
                        //out.println("<h3>Conexión exitosa a la base de datos</h3>");

                        // Crear una consulta SQL
                        statement = conexion.createStatement();
                        resultSet = statement.executeQuery("SELECT pro.IdProducto, pro.nombre, "
                                                        + "cate.NombreCategoria, pro.precio "
                                                        + "FROM tbl_productos AS pro "
                                                        + "INNER JOIN tbl_categoriaproductos AS cate "
                                                        + "ON pro.IdCategoria = cate.idCategoria;");

                        
                                                                              
                        while (resultSet.next()) {
                            int idproducto = resultSet.getInt("IdProducto");
                            String nombrePro = resultSet.getString("nombre");
                            String nombreCate = resultSet.getString("NombreCategoria");
                            double Precio = resultSet.getDouble("precio");
                            rowCount++;

                %>
                <tr>
                    <td><input type="checkbox" name="cbox<%= idproducto %>" id="cbox<%= idproducto %>"/>
                        <input type="hidden" name="IdProducto<%= idproducto %>" value="<%= idproducto %>" />
                    </td>
                    <td><%= nombrePro %></td>
                    <td><%= nombreCate %></td>
                    <td>$ <%= Precio %></td>
                    <td><input type="text" name="Unidades<%= idproducto %>" id="Unidades<%= idproducto %>" value="1"></td>
                <%
                        }
                    } catch (Exception e) {
                        out.println("<h3>Error al conectar con la base de datos: " + e.getMessage() + " </h3>");
                        e.printStackTrace();
                    } finally {
                        // Cerrar recursos
                        if (resultSet != null) resultSet.close();
                        if (statement != null) statement.close();
                        if (conexion != null) conexion.close();
                    }
                
                %>
                </table>
                
                <input type="hidden" name="NumProductos" value="<%= rowCount %>" />
            

            <input class="button" type="submit" value="Enviar">
            </center>
            </form>

        </section>
               
            <!--<button type="button" onclick="finalizarCotizacion()">Finalizar</button>-->
        

    </div>

    <script>
        function finalizarCotizacion() {
            alert("¡Gracias! Se ha enviado un correo electrónico con toda la información. En breves momentos uno de nuestros asesores se comunicará usted.");

            document.getElementById('nombre').value = "";
            document.getElementById('email').value = "";
            document.getElementById('celular').value = "";
            document.getElementById('cotizacion').value = "";
        }
    </script>

  </body>
</html>

