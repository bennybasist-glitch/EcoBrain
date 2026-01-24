<%-- 
    Document   : noticias
    Created on : 21/01/2026, 09:15:14 PM
    Author     : benny
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="conexion.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="css/estilos.css">
    <title>Noticias Ambientales</title>
</head>
<body>
    <nav>
        <a href="inicio.jsp" class="nav-item btn-inicio"><span>🏠</span> Inicio</a>
        <a href="consultar.jsp" class="nav-item btn-cerebro"><span>🧠</span>El Cerebro</a>
        <a href="noticia.jsp" class="nav-item btn-noticias"><span>📰</span> Noticias</a>
        
        <%-- Botón dinámico según el rol --%>
        <% if(session.getAttribute("usuarioRol") != null && session.getAttribute("usuarioRol").equals("Maestro")) { %>
            <a href="admin_noticias.jsp" class="nav-item btn-admin"><span>➕</span> Crear Anuncio</a>
        <% } %>

        <a href="perfil.jsp" class="nav-item btn-perfil"><span>👤</span> Mi Perfil</a>
        <a href="logout.jsp" class="nav-item btn-salir"><span>❌</span> Salir</a>
    </nav>

    <div class="contenedor-principal">
        <h1 class="titulo-pagina">🌿 Muro de Eco-Noticias</h1>
    
        <div class="muro-noticias">
            <%
                try {
                    Statement st = conexion.createStatement();
                    ResultSet rs = st.executeQuery("SELECT * FROM `noticia` ORDER BY id_noticia DESC");
                    while(rs.next()){
            %>
                <div class="card-noticia-larga">
                    <div class="header-noticia">
                        <span class="emoji-noticia">📢</span>
                        <div>
                            <h3><%= rs.getString("titulo") %></h3>
                            <small>Publicado el: <%= rs.getString("fecha_publicacion") %></small>
                        </div>
                    </div>
                    <div class="cuerpo-noticia">
                        <p><%= rs.getString("contenido") %></p>
                    </div>

                    <%-- AQUÍ DEBES PONER EL BOTÓN DE BORRAR --%>
                    <% if(session.getAttribute("usuarioRol") != null && session.getAttribute("usuarioRol").equals("Maestro")) { %>
                        <div style="text-align: right; padding-top: 10px; border-top: 1px dashed #ddd;">
                            <a href="borrar_noticia_proceso.jsp?id=<%= rs.getInt("id_noticia") %>" 
                               class="btn-salir" 
                               style="padding: 5px 10px; text-decoration: none; font-size: 0.8em;"
                               onclick="return confirm('¿Seguro que quieres borrar este anuncio?')">
                               🗑️ Borrar Anuncio
                            </a>
                        </div>
                    <% } %>
                    <%-- FIN DEL BOTÓN DE BORRAR --%>
                </div>
            <%      }
                } catch(Exception e) { 
                    out.print("<div class='card'>✨ ¡Vuelve pronto por más noticias!</div>"); 
                }  
            %>
        </div>
    </div>
</body>
</html>