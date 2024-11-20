<%-- 
    Document   : Cotizacion
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
            <center>
          <%
              
              String Nombrecompleto = request.getParameter("nombre");
              String Ciudad = request.getParameter("Ciudad");
              String Direccion = request.getParameter("Direccion");
              String Celular = request.getParameter("celular");
              
              
              String NumeroMaximoProductos = request.getParameter("NumProductos");
              
    // Parámetros enviados desde el formulario
    int num1 = 0; //Integer.parseInt(request.getParameter("num1"));
    int num2 = 0; //Integer.parseInt(request.getParameter("num2"));

    // Variables de conexión
    String url = "jdbc:mysql://localhost:3306/colsports";
    String usuario = "root";
    String password = "";

    Connection conexion = null;
    CallableStatement callableStatement = null;
    PreparedStatement ps = null;
    ResultSet resultSet = null;
 
    try {
        // Conectar a la base de datos
        Class.forName("com.mysql.cj.jdbc.Driver");
        conexion = DriverManager.getConnection(url, usuario, password);

        // Preparar la llamada al procedimiento almacenado
        callableStatement = conexion.prepareCall("{CALL GuardarCotizacion(?, ?, ?, ?, ?)}");

        // Establecer parámetros de entrada
        callableStatement.setString(1, Nombrecompleto);
        callableStatement.setString(2, Ciudad);
        callableStatement.setString(3, Direccion);
        callableStatement.setString(4, Celular);

        // Registrar el parámetro de salida
        callableStatement.registerOutParameter(5, Types.INTEGER);

        // Ejecutar el procedimiento
        callableStatement.execute();

        // Obtener el resultado del parámetro de salida
        int IdCotizacion = callableStatement.getInt(5);
        
        int index = 1;   
        int numproducto = 1;
        
        
        while (Integer.parseInt(NumeroMaximoProductos) > numproducto) 
        {
            if (request.getParameter("IdProducto" + Integer.toString(index)) == null)
            {
                index++;
                numproducto++;
                continue;
            }
            
            if (request.getParameter("cbox" + Integer.toString(index)) == null)
            {
                index++;
                numproducto++;
                continue;
            }
            
            String idProducto = request.getParameter("IdProducto" + Integer.toString(index));
            String unidades = request.getParameter("Unidades" + Integer.toString(index));

            // Consulta SQL de INSERT
            String query = "INSERT INTO tbl_productoscotizacion (IdCotizacion, IdProducto, Cantidad) "
                                                                   + " VALUES (?, ?, ?)";
            
            // Crear PreparedStatement
            ps = conexion.prepareStatement(query);                                                      
                                                                   
            // Establecer los parámetros de la consulta
            ps.setInt(1, IdCotizacion);                                                                            
            ps.setInt(2, Integer.parseInt(idProducto));                                                                                        
            ps.setInt(3, Integer.parseInt(unidades));                                                                            
            
            // Ejecutar el INSERT
            int rowsAffected = ps.executeUpdate();                                                                      
            
            index++;
            numproducto++;
        }
        
        // Crear una consulta SQL
        Statement statement = conexion.createStatement();
        resultSet = statement.executeQuery("select pro.nombre AS Producto, procoti.Cantidad, pro.precio, (pro.precio * procoti.Cantidad) as Valortotal "
                                            + " FROM tbl_productoscotizacion as procoti"
                                            + " INNER JOIN tbl_productos as pro on procoti.IdProducto = pro.idproducto"
                                            + " where procoti.IdCotizacion = " + IdCotizacion + "");

        %>
        <table class="TablaProductos" border="1">
                
            <tr><th>Nombre Producto</th><th>Cantidad</th><th>Precio</th><th>Valor Total</th></tr>
                
        <%
            double totalCotizacion = 0; 
        while (resultSet.next()) 
        {
            String Producto = resultSet.getString("Producto");
            int Cantidad = resultSet.getInt("Cantidad");
            double Precio = resultSet.getDouble("precio");
            double total = resultSet.getDouble("Valortotal");
            totalCotizacion = totalCotizacion + total;
        %>
            <tr>

                <td><%= Producto %></td>
                <td><%= Cantidad %></td>
                <td>$ <%= Precio %></td>
                <td>$ <%= total %></td>
            </tr>
        
          
        <%
        }
        %>
        </table>
        <br><br>  
        <h3>Total cotizacion:  <%= totalCotizacion %></h3>
        <br> 

        <input class="button" type="submit" onclick="finalizarCotizacion()"
               value="Enviar Solicitud">
        
        <script>
            function finalizarCotizacion() {
                alert("¡Gracias! Se ha enviado un correo electrónico con toda la información. En breves momentos uno de nuestros asesores se comunicará usted.");

                location.href='FormularioCotizacion.jsp';
            }
        </script>
        
       <%
    } catch (Exception e) {
        out.println("<h3>" + e.getMessage() + "</h3>");
        e.printStackTrace();
    } finally {
        // Cerrar recursos
        if (callableStatement != null) callableStatement.close();
        if (conexion != null) conexion.close();
    }
%>
</center>
  </body>
</html>

