<%-- 
    Document   : consultar
    Created on : 21/01/2026, 09:14:17 PM
    Author     : benny
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="conexion.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Eco-Brain - El Cerebro</title>
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
        <div class="card-buscador-magico">
        <h2 class="titulo-cerebro">🧠 ¡Pregúntale al Cerebro IA!</h2>
        <p class="instruccion-eco">Escribe el nombre de un objeto para saber cómo reciclarlo.</p>
        
        <form method="POST" class="formulario-animado">
            <div class="input-contenedor">
                <input type="text" name="txtObjeto" placeholder="Ej: Botella de plastico" required>
            </div>
            <button type="submit" class="btn-eco-brillante">
                🔍 INVESTIGAR
            </button>
        </form>

        <%
           String objeto = request.getParameter("txtObjeto");
    String nombreUser = (String) session.getAttribute("usuarioNombre"); // Obtenemos quién está logueado

    if (conexion != null && objeto != null) {
        try {
            // 1. Buscar el residuo
            String sql = "SELECT * FROM `residuo` WHERE nombreObjeto LIKE ?";
            PreparedStatement ps = conexion.prepareStatement(sql);
            ps.setString(1, "%" + objeto + "%");
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                // 2. ¡Éxito! El niño aprendió a reciclar algo. Sumamos 10 puntos.
                String sqlPuntos = "UPDATE `usuario` SET puntos = puntos + 10 WHERE nombre = ?";
                PreparedStatement psPuntos = conexion.prepareStatement(sqlPuntos);
                psPuntos.setString(1, nombreUser);
                psPuntos.executeUpdate();
%>
                <div class="card" style="background: #dcfce7; border: 2px solid #22c55e;">
                    <h3>✅ ¡Muy bien, Eco-Héroe!</h3>
                    <p>Has ganado <strong>10 puntos</strong> por aprender a reciclar: <%= rs.getString("nombreObjeto") %></p>
                    <p>Va en el: <strong><%= rs.getString("categoria") %></strong></p>
                </div>
<%
            }
        } catch(Exception e) { out.print("Error: " + e.getMessage()); }
            }
        %>
    </div>
</body>
</html>