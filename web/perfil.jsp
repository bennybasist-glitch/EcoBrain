<%-- 
    Document   : perfil
    Created on : 22/01/2026, 01:20:18 PM
    Author     : benny
--%>

<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="conexion.jsp" %>
<%
    // RF2: Verificación de sesión
    String nombreSesion = (String) session.getAttribute("usuarioNombre");
    if (nombreSesion == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Mi Perfil - Eco-Brain</title>
    <link rel="stylesheet" type="text/css" href="css/estilos.css">
</head>
<body>
    <%@include file="nav.jsp" %>
    
    <div class="contenedor-principal" style="margin-top: 30px;">
        <div class="card-perfil-heroico">
        <div class="encabezado-perfil">
            <div class="avatar-eco">🧑‍🚀</div>
            <h1>Perfil de Eco-Héroe</h1>
        </div>

        <div class="info-heroica">
            <p><strong>👤 Nombre:</strong> <%= nombreSesion %></p>
            <%
                try {
                    String sql = "SELECT correo, rol, puntos FROM `usuario` WHERE nombre=?";
                    PreparedStatement ps = conexion.prepareStatement(sql);
                    ps.setString(1, nombreSesion);
                    ResultSet rs = ps.executeQuery();
                    
                    if(rs.next()){
                        int misPuntos = rs.getInt("puntos");
                        String nivel = (misPuntos >= 100) ? "Eco-Maestro 🏆" : "Recluta Verde 🌱";
            %>
                <p><strong>📧 Correo:</strong> <%= rs.getString("correo") %></p>
                <p><strong>🛡️ Rol:</strong> <%= rs.getString("rol") %></p>
                
                <div class="medalla-puntos">
                    <div class="brillo-estrella">🌟</div>
                    <h2><%= misPuntos %> Puntos</h2>
                    <span class="etiqueta-nivel"><%= nivel %></span>
            </div>
            <% 
                    }
                } catch(Exception e) { out.print("Error al cargar datos."); }
            %>
        </div>
        
        <a href="logout.jsp" class="btn-salir-perfil">Cerrar Sesión Segura</a>
        </div>
    </div>
</body>
</html>