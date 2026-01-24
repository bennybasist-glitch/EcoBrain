<%-- 
    Document   : inicio
    Created on : 21/01/2026, 09:29:49 PM
    Author     : benny
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="conexion.jsp" %>
<%
    String nombre = (String) session.getAttribute("usuarioNombre");
    if (nombre == null) response.sendRedirect("login.jsp");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Eco-Brain - Inicio</title>
    <link rel="stylesheet" type="text/css" href="css/estilos.css">
</head>
<body>
    <nav>
    <a href="inicio.jsp" class="nav-item btn-inicio"><span>🏠</span> Inicio</a>
    <a href="consultar.jsp" class="nav-item btn-cerebro"><span>🧠</span>El Cerebro</a>
    <a href="noticia.jsp" class="nav-item btn-noticias"><span>📰</span> Noticias</a>
    <a href="perfil.jsp" class="nav-item btn-perfil"><span>👤</span> Mi Perfil</a>
    <a href="logout.jsp" class="nav-item btn-salir"><span>❌</span> Salir</a>
</nav>
    </nav>
    <div class="contenedor-principal">
    <h1 class="titulo-bienvenida">¡Bienvenido, Eco-Héroe <%= nombre %>!</h1>
    
    <div class="seccion-anuncios">
        <h2 class="subtitulo-llamativo">📢 Noticias de la Escuela</h2>
        
        <div class="grid-noticias">
            <%
                try {
                    Statement st = conexion.createStatement();
                    ResultSet rs = st.executeQuery("SELECT * FROM `noticia` ORDER BY id_noticia DESC LIMIT 3");
                    while(rs.next()){
            %>
                <div class="card-noticia-mini">
                    <div class="icono-noticia">🌱</div>
                    <div class="contenido-noticia">
                        <strong><%= rs.getString("titulo") %></strong>
                        <p><%= rs.getString("fecha_publicacion") %></p>
                    </div>
                </div>
            <%
                    }
                } catch(Exception e) { 
                    out.print("<div class='card'>✨ ¡Pronto habrá nuevas noticias!</div>"); 
                }
            %>
        </div>
        <br>
       <a href="consultar.jsp" class="btn-llamativo">
        <span>🧠</span> ¿Qué reciclamos hoy?
    </a>
    </div>
</body>
</html>
