<%-- 
    Document   : login
    Created on : 21/01/2026, 09:25:45 PM
    Author     : benny
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="conexion.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Eco-Brain - Login</title>
    <link rel="stylesheet" type="text/css" href="css/estilos.css">
</head>
<body>
    <div class="login-body">
        <div class="card-login">
        <div class="logo-container">
            <img src="imagenes/logo_ecobrain.png" alt="Eco-Brain" width="220" style="margin-bottom: 10px;">
            <h2 style="color: #16a34a; margin-bottom: 25px;">¡Hola, Eco-Héroe!</h2>
            
            <form method="POST">
                <input type="email" name="txtCorreo" placeholder="📧 Correo escolar" required>
                <input type="password" name="txtPass" placeholder="🔑 Tu contraseña" required>
                <button type="submit" name="btnEntrar" class="btn-entrar-eco">¡ENTRAR AL MUNDO!</button>
            </form>
            
            <p style="margin-top: 25px; font-size: 0.9rem;">
                ¿Eres nuevo en la escuela? <br>
                <a href="registro.jsp" style="color: #3b82f6; font-weight: bold; text-decoration: none;">¡Crea tu cuenta de Eco-Héroe aquí!</a>
            </p>

            <%
                if (request.getParameter("btnEntrar") != null) {
        try {
            // Seleccionamos nombre Y rol
            String sql = "SELECT nombre, rol FROM `usuario` WHERE correo=? AND password=?";
            PreparedStatement ps = conexion.prepareStatement(sql);
            ps.setString(1, request.getParameter("txtCorreo"));
            ps.setString(2, request.getParameter("txtPass"));
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                // Guardamos AMBOS en la sesión
                session.setAttribute("usuarioNombre", rs.getString("nombre"));
                session.setAttribute("usuarioRol", rs.getString("rol")); 
                response.sendRedirect("inicio.jsp");
            } else {
                out.print("<p style='color:red;'>Datos incorrectos.</p>");
            }
        } catch (Exception e) {
            out.print("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
                    }
                }
            %>
        </div>
    </div>
</body>
</html>