<%-- 
    Document   : registro
    Created on : 21/01/2026, 09:13:48 PM
    Author     : benny
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="conexion.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registro - Eco-Brain</title>
    <link rel="stylesheet" type="text/css" href="css/estilos.css">
</head>
<body>
    <div class="contenedor-principal">
        <div class="card">
            <h2>Crear cuenta de Eco-Héroe</h2>
            <form method="POST">
                <input type="text" name="txtNombre" placeholder="Nombre completo" required><br>
                <input type="email" name="txtCorreo" placeholder="Correo electrónico" required><br>
                <input type="password" name="txtPass" placeholder="Contraseña" required><br>
                <select name="txtRol">
                    <option value="Alumno">Alumno</option>
                    <option value="Maestro">Maestro</option>
                </select><br><br>
                <button type="submit" name="btnRegistrar" class="btn-eco">REGISTRARSE</button>
            </form>
            <%
                if (request.getParameter("btnRegistrar") != null && conexion != null) {
                    try {
                        String sql = "INSERT INTO `usuario` (nombre, correo, password, rol) VALUES (?, ?, ?, ?)";
                        PreparedStatement ps = conexion.prepareStatement(sql);
                        ps.setString(1, request.getParameter("txtNombre"));
                        ps.setString(2, request.getParameter("txtCorreo"));
                        ps.setString(3, request.getParameter("txtPass"));
                        ps.setString(4, request.getParameter("txtRol"));
                        ps.executeUpdate();
                        out.print("<p style='color:green;'>¡Registro exitoso! <a href='login.jsp'>Entra aquí</a></p>");
                    } catch (Exception e) {
                        out.print("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
                    }
                }
            %>
        </div>
    </div>
</body>
</html>