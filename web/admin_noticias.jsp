<%-- 
    Document   : admin_noticias
    Created on : 22/01/2026, 03:03:19 PM
    Author     : benny
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="conexion.jsp" %>
<%@include file="nav.jsp" %> <%-- Al incluir nav.jsp, ya tenemos acceso a 'miRol' --%>
<%@page import="java.sql.*" %>

<%
    /* SOLUCIÓN AL ERROR 500: 
       No declaramos 'String miRol' aquí porque ya se declaró en nav.jsp.
       Solo validamos que tenga el permiso.
    */
    if (miRol == null || !miRol.equals("Maestro")) {
        response.sendRedirect("inicio.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Eco-Brain | Panel Maestro</title>
    <link rel="stylesheet" type="text/css" href="css/estilos.css">
</head>
<body>
    <div class="contenedor-principal">
        <div class="card" style="border-top: 5px solid #3b82f6;">
            <h1>📢 Crear Nuevo Anuncio</h1>
            <p>Escribe un mensaje para que todos los alumnos lo vean en su inicio.</p>
            
            <form method="POST">
                <input type="text" name="txtTitulo" placeholder="Título del anuncio" required style="width: 100%; padding: 10px; margin-bottom: 10px; border-radius: 5px; border: 1px solid #ddd;"><br>
                
                <textarea name="txtContenido" placeholder="Escribe aquí los detalles del anuncio..." required 
                          style="width: 100%; height: 150px; padding: 10px; border-radius: 10px; border: 1px solid #ddd;"></textarea><br><br>
                
                <label>Fecha de publicación:</label><br>
                <input type="date" name="txtFecha" required style="width: 100%; padding: 10px; margin-bottom: 20px;"><br>
                
                <button type="submit" name="btnPublicar" class="btn-eco" style="background: #3b82f6; width: 100%;">
                    PUBLICAR ANUNCIO
                </button>
            </form>

            <%
                // El 'conexion' puede aparecer en rojo en el editor, pero GlassFish lo reconocerá.
                if (request.getParameter("btnPublicar") != null && conexion != null) {
                    try {
                        // Sincronizado con las columnas: titulo, contenido, fecha_publicacion
                        String sql = "INSERT INTO `noticia` (titulo, contenido, fecha_publicacion) VALUES (?, ?, ?)";
                        PreparedStatement ps = conexion.prepareStatement(sql);
                        
                        ps.setString(1, request.getParameter("txtTitulo"));
                        ps.setString(2, request.getParameter("txtContenido"));
                        ps.setString(3, request.getParameter("txtFecha"));
                        
                        int res = ps.executeUpdate();
                        if (res > 0) {
                            out.print("<p style='color:green; font-weight:bold; margin-top:15px;'>✅ ¡La noticia ha sido publicada exitosamente!</p>");
                        }
                    } catch (Exception e) {
                        out.print("<p style='color:red; margin-top:15px;'>Error al guardar: " + e.getMessage() + "</p>");
                    }
                }
            %>
        </div>
        <br>
        <a href="inicio.jsp" style="text-decoration: none; color: #666;">← Volver al Inicio</a>
    </div>
</body>
</html>